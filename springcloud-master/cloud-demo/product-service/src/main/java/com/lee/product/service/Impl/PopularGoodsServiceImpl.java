package com.lee.product.service.Impl;


import com.lee.product.mapper.PopularGoodsMapper;
import com.lee.feign.pojo.Product;
import com.lee.product.service.PopularGoodsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PopularGoodsServiceImpl implements PopularGoodsService {
    @Resource
    PopularGoodsMapper popularGoodsMapper;
    @Override
    public List<Product> getPopularGoods() {
        return popularGoodsMapper.getPopularGoods();
    }
}
