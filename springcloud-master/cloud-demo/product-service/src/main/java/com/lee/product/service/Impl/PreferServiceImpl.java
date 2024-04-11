package com.lee.product.service.Impl;


import com.lee.product.mapper.PreferDaoMapper;
import com.lee.product.pojo.Prefer;
import com.lee.product.service.PreferService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PreferServiceImpl implements PreferService {
    @Resource
    PreferDaoMapper preferDaoMapper;
    @Override
    public Boolean addPrefer(Prefer prefer) {
        return preferDaoMapper.addPrefer(prefer);
    }

    @Override
    public Prefer getPrefer(Integer user_id, Integer product_id) {
        return preferDaoMapper.getPrefer(user_id,product_id);
    }

    @Override
    public void updatePrefer(Prefer existingPrefer) {
        preferDaoMapper.updatePrefer(existingPrefer);
    }

    @Override
    public Integer getProductNum(Integer user_id) {
        return preferDaoMapper.getProductNum(user_id);
    }

    @Override
    public void deletePreferItem(Integer id) {
        preferDaoMapper.deletePreferItem(id);
    }

    @Override
    public List<Integer> getProduct_id(Integer user_id) {
        return preferDaoMapper.getProduct_id(user_id);
    }
}

