package com.lee.product.service.Impl;


import com.lee.product.mapper.ProductDaoMapper;
import com.lee.feign.pojo.Product;
import com.lee.product.service.ProductService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Resource
    ProductDaoMapper productDaoMapper;


    @Override
    public Product getProductsById(Integer id) {
        return productDaoMapper.getProductsById(id);
    }

    @Override
    public List<Product> getProductByName(String product_name) {
        return productDaoMapper.getProductByName(product_name);
    }

    @Override
    public void updateStock(Integer product_id, int stock) {
        productDaoMapper.updateStock(product_id, stock);
    }
}
