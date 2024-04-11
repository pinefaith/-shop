package com.lee.product.service;
import com.lee.feign.pojo.Product;
import com.lee.product.pojo.Sort;

import java.util.List;


public interface SortService {
    List<Sort> ListSort();
    List<Sort> buildTree(List<Sort> sorts);
    List<Product> getProductsByClass(Integer goodClass, List<Sort> treeSort);
    List<Product> getProductsByClassName(String className, List<Sort> treeSort);
}
