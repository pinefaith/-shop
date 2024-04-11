package com.lee.product.service;



import com.lee.product.pojo.Prefer;

import java.util.List;

public interface PreferService {
    Boolean addPrefer(Prefer prefer);

    Prefer getPrefer(Integer user_id, Integer product_id);

    void updatePrefer(Prefer existingPrefer);
    Integer getProductNum(Integer user_id);

    void deletePreferItem(Integer id);

    List<Integer> getProduct_id(Integer user_id);
}
