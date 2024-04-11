package com.lee.address.service.Impl;


import com.lee.address.mapper.AddressDaoMapper1;
import com.lee.address.pojo.Address;
import com.lee.address.service.AddressService1;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AddressService1Impl implements AddressService1 {

    @Resource
    AddressDaoMapper1 addressDaoMapper1;

    @Override
    public List<Address> getAddressList(Integer user_id) {
        return addressDaoMapper1.getAddressList(user_id);
    }
}
