package com.lee.car.web;


import com.lee.car.common.Result;
import com.lee.car.dto.CartDetailsDTO;
import com.lee.car.pojo.Cart;
import com.lee.car.service.CartService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/cart")
public class CartController {
    @Resource
    CartService cartService;

    /**
     * 加入购物车
     * @param cart
     * @return
     */
    @PostMapping("/addShoppingCart")
    public Result<?> add(@RequestBody Cart cart) {
        // 根据 user_id 和 product_id 查询购物车项
        Cart existingCart = cartService.getCart(cart.getUser_id(), cart.getProduct_id());
        System.out.println(cart.getQuantity());
        if (existingCart != null) {
            // 存在相同的购物车项，将 quantity 数量增加
            existingCart.setQuantity(existingCart.getQuantity() + cart.getQuantity());
            cartService.updateCart(existingCart);
        } else {
            // 不存在相同的购物车项，插入新的购物车项
            Boolean result = cartService.addCart(cart);
        }
        return Result.success();
    }

    /**
     * 根据登录用户查询购物车商品数量
     * @param user_id
     * @return
     */
    @GetMapping("/getProductNum/{user_id}")
    public Result<?> getProductNum(@PathVariable Integer user_id){
        try {
            Integer productNum = cartService.getProductNum(user_id);
            return Result.success(productNum);
        }catch (Exception e) {
            e.printStackTrace();
            // 返回失败响应
            return Result.error("1","查询购物车数量失败");
        }
    }

    /**
     * 查询当前用户所有的购物车数据
     * @param user_id
     * @return
     */
    @GetMapping("/showAll/{user_id}")
    public Result<?> getCartDetailsByUserId(@PathVariable Integer user_id) {
        try {
            List<CartDetailsDTO> cartDetailsByUserId = cartService.getCartDetailsByUserId(user_id);
            return Result.success(cartDetailsByUserId);
        }catch (Exception e) {
            e.printStackTrace();
            // 返回失败响应
            return Result.error("1","查询个人购物车列表失败");
        }
    }

    /**
     * 购物车中某件商品数量改变
     * @param cart
     * @return
     */
    @PostMapping("/quantityChange")
    public Result<?> quantityChange(@RequestBody Cart cart){
        System.out.println(cart);

        // 从请求体中获取参数
        int userId = cart.getUser_id();
        int productId = cart.getProduct_id();
        int quantity = cart.getQuantity();
        Cart cartInDate = cartService.getCart(userId, productId);
        cartInDate.setQuantity(quantity);
        try {
            // 更新数据库
            cartService.updateCart(cartInDate);
            // 返回成功响应
            return Result.success();
        } catch (Exception e) {
            e.printStackTrace();
            // 返回失败响应
            return Result.error("1","更新失败");
        }
    }

    /**
     * 删除购物车列表中的某一个
     * @param id
     * @return
     */
    @PostMapping("/deleteCartItem/{id}")
    public Result<?> deleteCartItem(@PathVariable Integer id) {
        try {
            cartService.deleteCartItem(id);
            return Result.success();
        } catch (Exception e) {
            e.printStackTrace();
            // 返回失败响应
            return Result.error("1", "删除失败");
        }
    }
}
