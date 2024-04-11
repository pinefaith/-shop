package com.lee.address.service.Impl;


import com.lee.address.mapper.AddressDaoMapper;
import com.lee.address.pojo.Address;
import com.lee.address.service.AddressService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AddressServicelmpl implements AddressService {

    @Resource
    private AddressDaoMapper addressDaoMapper;

    @Override
    public List<Address> findAddressById(Integer id) {
        return addressDaoMapper.findAddressById(id);
    }

    @Override
    public void addAddress(Address address) {
        addressDaoMapper.insertAddress(address);
    }

    @Override
    public boolean deleteAddress(Integer id) {
        return addressDaoMapper.deleteAddress(id) > 0;
    }
}
