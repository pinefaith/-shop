package com.lee.address.pojo;


import lombok.Data;

@Data
public class Address {
    private Integer id;
    private Integer user_id;
    private String name;
    private String phone;
    private String addr;
}
