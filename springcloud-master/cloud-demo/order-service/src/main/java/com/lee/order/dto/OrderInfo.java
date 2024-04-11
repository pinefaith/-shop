package com.lee.order.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderInfo {
    private Integer product_id;
    private String product_name;
    private BigDecimal price;
    private Integer quantity;
    private BigDecimal total;
    private String created_time;
    private String image_url;
    private Long order_no;
    private String payment_time;
    private Integer status;
}
