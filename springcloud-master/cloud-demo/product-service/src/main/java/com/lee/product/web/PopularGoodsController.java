package com.lee.product.web;


import com.lee.feign.pojo.Product;
import com.lee.product.service.PopularGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/popularGoods")
public class PopularGoodsController {
    @Autowired
    private PopularGoodsService popularGoodsService;

    @GetMapping("/goods")
    public List<Product> getPopularGoods(){
        return popularGoodsService.getPopularGoods();
    }
}
