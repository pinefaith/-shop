package com.lee.order.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderItems {
    Integer id;
    Integer user_id;
    Long order_no;
    Integer product_id;
    String product_name;
    BigDecimal price;
    Integer quantity;
    BigDecimal total_price;
    LocalDateTime created;
    LocalDateTime updated;
}
