package com.lee.product.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Prefer {
    Integer id;
    Integer user_id;
    Integer product_id;
}