package com.lee.user.pojo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class User {
    private Integer id;
    private String account;
    private String name;
    private String password;
    private String phone;
    private String sex;
}