package com.lee.feign.clients;

import com.lee.feign.clients.fallback.ProductserviceClientFallbackFactory;
import com.lee.feign.pojo.Product;
import com.lee.feign.pojo.productDto;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient(value = "productservice", fallbackFactory = ProductserviceClientFallbackFactory.class)
public interface ProductClient {
    @GetMapping("/Product/getProductsById")
    Product getProductsById(Integer productId);

    @GetMapping("/Product/updateStock")
    void updateStock(productDto productDto);
}
