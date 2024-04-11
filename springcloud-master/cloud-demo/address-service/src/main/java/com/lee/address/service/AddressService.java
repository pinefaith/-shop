package com.lee.address.service;




import com.lee.address.pojo.Address;

import java.util.List;

public interface AddressService {
    List<Address> findAddressById(Integer id);

    void addAddress(Address address);

    boolean deleteAddress(Integer id);

}
