package com.lee.product.web;

import com.lee.product.common.Result;
import com.lee.product.pojo.Prefer;
import com.lee.feign.pojo.Product;
import com.lee.product.service.PreferService;
import com.lee.product.service.ProductService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.LinkedList;
import java.util.List;

@RestController
@RequestMapping("/prefer")
public class PreferController {
    @Resource
    PreferService preferService;
    @Resource
    ProductService productService;

    /**
     * 加入我喜欢
     * @param prefer
     * @return
     */
    @PostMapping("/addPrefer")
    public Result<?> addPrefer(@RequestBody Prefer prefer) {
        // 根据 user_id 和 product_id 查询购物车项
        Prefer existingPrefer = preferService.getPrefer(prefer.getUser_id(), prefer.getProduct_id());
        if (existingPrefer != null) {
            // 存在相同的购物车项，将 quantity 加一

        } else {
            // 不存在相同的购物车项，插入新的购物车项
            Boolean result = preferService.addPrefer(prefer);
        }
        return Result.success();
    }
    //根据用户id查询我喜欢
    @GetMapping("/showAll/{user_id}")
    public Result<?> getPreferDetailsByUserId(@PathVariable Integer user_id) {
        List<Product> productListall= new LinkedList<Product>();
        List<Integer> productlist= preferService.getProduct_id(user_id);
        for(Integer product_id :productlist)
        {
            Product productsById = productService.getProductsById(product_id);
            productListall.add(productsById);
        }
        return Result.success(productListall);
    }


   //删除
    @DeleteMapping("/deletePreferItem/{id}")
    public Result<?> deletePreferItem(@PathVariable Integer id){
        preferService.deletePreferItem(id);
        return Result.success();
    }
}
