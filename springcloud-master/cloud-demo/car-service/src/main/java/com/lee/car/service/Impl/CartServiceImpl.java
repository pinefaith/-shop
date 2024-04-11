package com.lee.car.service.Impl;


import com.lee.car.dto.CartDetailsDTO;
import com.lee.car.mapper.CartDaoMapper;
import com.lee.car.pojo.Cart;
import com.lee.car.service.CartService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CartServiceImpl implements CartService {
    @Resource
    CartDaoMapper cartDaoMapper;
    @Override
    public Boolean addCart(Cart cart) {
        return cartDaoMapper.addCart(cart);
    }

    @Override
    public Cart getCart(Integer user_id, Integer product_id) {
        return cartDaoMapper.getCart(user_id,product_id);
    }

    @Override
    public void updateCart(Cart existingCart) {
        cartDaoMapper.updateCart(existingCart);
    }

    @Override
    public Integer getProductNum(Integer user_id) {
        return cartDaoMapper.getProductNum(user_id);
    }

    @Override
    public List<CartDetailsDTO> getCartDetailsByUserId(Integer user_id) {
        return cartDaoMapper.findCartDetailsByUserId(user_id);
    }

    @Override
    public void deleteCartItem(Integer id) {
        cartDaoMapper.deleteCartItem(id);
    }
}
