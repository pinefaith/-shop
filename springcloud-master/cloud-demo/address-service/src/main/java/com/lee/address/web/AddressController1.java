package com.lee.address.web;


import com.lee.address.common.Result;
import com.lee.address.pojo.Address;
import com.lee.address.service.AddressService1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/address")
public class AddressController1 {
    @Autowired
    AddressService1 addressService1;

    /**
     * 获取个人的所有地址
     * @param user_id
     * @return
     */
    @GetMapping("/getAddressList/{user_id}")
    public Result<?> getAddressList(@PathVariable Integer user_id){
        List<Address> addressList = addressService1.getAddressList(user_id);
        return Result.success(addressList);
    }
}
