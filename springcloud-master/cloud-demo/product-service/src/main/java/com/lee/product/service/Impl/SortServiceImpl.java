package com.lee.product.service.Impl;


import com.lee.product.mapper.SortDaoMapper;
import com.lee.feign.pojo.Product;
import com.lee.product.pojo.Sort;
import com.lee.product.service.SortService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

@Service
public class SortServiceImpl implements SortService {
    @Resource
    private SortDaoMapper sortDaoMapper;

    @Override
    public List<Sort> ListSort() {
        return sortDaoMapper.ListSort();
    }

    public List<Sort> buildTree(List<Sort> sorts) {
        List<Sort> tree = new ArrayList<>();
        Map<Integer, Sort> map = new HashMap<>();
        for (Sort sort : sorts) {
            map.put(sort.getId(), sort);
        }
        for (Sort sort : sorts) {
            if (sort.getParent_id() == 0) {
                tree.add(sort);
            } else {
                Sort parent = map.get(sort.getParent_id());
                parent.getChildren().add(sort);
            }
        }
        return tree;
    }

    @Override
    public List<Product> getProductsByClass(Integer goodClass, List<Sort> treeSort) {
        Vector<Integer> array = new Vector<>();
        for(Sort sort : treeSort){
            if(Objects.equals(sort.getId(), goodClass) && sort.getChildren() != null){
                List<Sort> sortList = sort.getChildren();
                for(Sort sort1 : sortList){
                    if(sort1.getChildren() != null){
                        List<Sort> sortList1 = sort1.getChildren();
                        for(Sort sort2 : sortList1){
                            array.add(sort2.getId());
                        }
                    }
                }
            }else{
                if(sort.getChildren()!=null){
                    for(Sort sort1 : sort.getChildren()){
                        if(Objects.equals(sort1.getId(), goodClass) && sort1.getChildren() != null){
                            List<Sort> sortList1 = sort1.getChildren();
                            for(Sort sort2 : sortList1){
                                array.add(sort2.getId());
                            }
                        }else{
                            for(Sort sort2 : sort1.getChildren()){
                                if(Objects.equals(sort2.getId(), goodClass))
                                    array.add(sort2.getId());
                            }
                        }
                    }
                }
            }
        }
        List<Integer> idArray = new ArrayList<>();
        for(int i = 0; i < array.size(); i++){
            idArray.add(array.get(i));
        }
        return sortDaoMapper.getProductsByClass(idArray);
    }

    public int matchClassName(String className,List<Sort> treeSort){
        for(Sort sort : treeSort){
            if(sort.getSort_name().equals(className)){
                return sort.getId();
            }
        }
        for (Sort sort: treeSort){
            if(sort.getChildren()!=null){
                for (Sort sort1:sort.getChildren()){
                    if(sort1.getSort_name().equals(className)){
                        return sort1.getId();
                    }
                }
            }
        }
        for (Sort sort: treeSort){
            if(sort.getChildren()!=null){
                for (Sort sort1:sort.getChildren()){
                    if(sort1.getChildren()!=null){
                        for(Sort sort2 : sort1.getChildren()){
                            if(sort2.getSort_name().equals(className)){
                                return sort2.getId();
                            }
                        }
                    }
                }
            }
        }
        return 0;
    }

    @Override
    public List<Product> getProductsByClassName(String className, List<Sort> treeSort) {
        int cateGory = matchClassName(className,treeSort);
        return getProductsByClass(cateGory,treeSort);
    }
}



