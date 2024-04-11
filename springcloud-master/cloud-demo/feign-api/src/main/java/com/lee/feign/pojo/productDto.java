package com.lee.feign.pojo;

import lombok.Data;

import java.io.Serializable;

@Data
public class productDto implements Serializable {
    Integer productId;
    int i;
}
