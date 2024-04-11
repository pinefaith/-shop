package com.lee.product.web;


import com.lee.feign.pojo.Product;
import com.lee.product.pojo.Sort;
import com.lee.product.service.SortService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/shopMall/productType")
public class ProductTypeController {

    @Resource
    private SortService sortService;

    /**
     * 获取商品分类列表
     * @return
     */
    @GetMapping("/list")
    public List<Sort> ListSort(){
        List<Sort> sort = sortService.ListSort();
        return sortService.buildTree(sort);
    }

    /**
     * 主页面获取商品数据
     * @param goodClass
     * @return
     */
    @GetMapping("/list/{goodClass}")
    List<Product> getProductsByClass(@PathVariable int goodClass){
        List<Sort> sort = sortService.ListSort();
        return sortService.getProductsByClass(goodClass,sortService.buildTree(sort));
    }

    /**
     * 按商品类别搜索
     * @param className
     * @return
     */
    @GetMapping("/search/{className}")
    List<Product> getProductsByClassName(@PathVariable String className){
        List<Sort> sort = sortService.ListSort();
        return sortService.getProductsByClassName(className,sortService.buildTree(sort));
    }
}
