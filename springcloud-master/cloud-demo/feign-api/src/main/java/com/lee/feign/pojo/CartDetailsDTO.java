package com.lee.feign.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartDetailsDTO {
    private Integer id;
    private Integer quantity;
    private String product_name;
    private String image_url;
    private BigDecimal price;
    private Integer sort_id;
    private Integer stock;
    private Integer product_id;
}