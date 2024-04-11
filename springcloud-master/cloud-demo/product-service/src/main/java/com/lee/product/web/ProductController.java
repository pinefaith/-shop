package com.lee.product.web;


import com.lee.feign.pojo.Product;
import com.lee.feign.pojo.productDto;
import com.lee.product.service.ProductService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/Product")
public class ProductController {
    @Resource
    ProductService productService;

    /**
     * 通过商品id获取商品，用于商品详情页实现
     *
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public Product getProductsById(@PathVariable Integer id) {
        return productService.getProductsById(id);
    }

    @GetMapping("/getProductsById")
    public Product getProductsByIdFeign(@RequestBody Integer id) {
        return productService.getProductsById(id);
    }

    @GetMapping("/updateStock")
    public void updateStock(@RequestBody productDto productDto) {
        productService.updateStock(productDto.getProductId(), productDto.getI());
    }

    /**
     * 按商品名称搜索
     *
     * @param product_name
     * @return
     */
    @GetMapping("/search/{product_name}")
    public List<Product> getProductByName(@PathVariable String product_name) {
        return productService.getProductByName(product_name);
    }
}
