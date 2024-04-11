package com.lee.feign.clients.fallback;

import com.lee.feign.clients.ProductClient;
import com.lee.feign.pojo.Product;
import com.lee.feign.pojo.productDto;
import org.springframework.cloud.openfeign.FallbackFactory;

public class ProductserviceClientFallbackFactory implements FallbackFactory<ProductClient> {
    @Override
    public ProductClient create(Throwable throwable) {
        return new ProductClient() {

            @Override
            public Product getProductsById(Integer productId) {
                return new Product();
            }

            @Override
            public void updateStock(productDto productDto) {

            }
        };
    }
}
