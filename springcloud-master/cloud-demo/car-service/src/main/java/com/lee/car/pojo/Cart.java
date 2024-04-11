package com.lee.car.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    Integer id;
    Integer user_id;
    Integer product_id;
    Integer quantity;
}
