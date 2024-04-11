package com.lee.product.service;



import com.lee.feign.pojo.Product;

import java.util.List;

public interface PopularGoodsService {
    List<Product> getPopularGoods();
}
