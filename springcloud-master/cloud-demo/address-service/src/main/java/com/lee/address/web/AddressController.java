package com.lee.address.web;


import com.lee.address.pojo.Address;
import com.lee.address.service.AddressService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;


@RestController
@RequestMapping("/Address")
public class AddressController {

    @Resource
    private AddressService addressService;


    @GetMapping("/findAddressById")
    public ResponseEntity<List<Address>> findAddressById(@RequestParam Integer id) {
        List<Address> AddressList = addressService.findAddressById(id);
        System.out.println(AddressList);
        return ResponseEntity.ok(AddressList);
    }

    @PostMapping("/addAddress")
    public void addAddress(@RequestBody Address address) {
        addressService.addAddress(address);
    }

    @DeleteMapping("deleteAddress/{id}")
    public Object deleteAddress(@PathVariable("id") Integer id) {
        boolean result = addressService.deleteAddress(id);
        if (result) {
            return "Address deleted successfully";
        } else {
            return "Failed to delete address";
        }
    }
}
