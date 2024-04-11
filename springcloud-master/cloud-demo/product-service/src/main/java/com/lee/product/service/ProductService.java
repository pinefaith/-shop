package com.lee.product.service;


import com.lee.feign.pojo.Product;

import java.util.List;

public interface ProductService {
    Product getProductsById(Integer id);

    List<Product> getProductByName(String product_name);

    void updateStock(Integer product_id, int stock);
}
