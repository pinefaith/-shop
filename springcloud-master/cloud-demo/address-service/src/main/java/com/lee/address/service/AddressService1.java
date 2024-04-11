package com.lee.address.service;



import com.lee.address.pojo.Address;

import java.util.List;
public interface AddressService1 {

    List<Address> getAddressList(Integer user_id);
}
