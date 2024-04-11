package com.lee.car.service;




import com.lee.car.dto.CartDetailsDTO;
import com.lee.car.pojo.Cart;

import java.util.List;

public interface CartService {
    Boolean addCart(Cart cart);

    Cart getCart(Integer user_id, Integer product_id);

    void updateCart(Cart existingCart);
    Integer getProductNum(Integer user_id);

    List<CartDetailsDTO> getCartDetailsByUserId(Integer user_id);

    void deleteCartItem(Integer id);
}
