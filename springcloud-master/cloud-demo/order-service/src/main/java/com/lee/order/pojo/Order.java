package com.lee.order.pojo;

import com.lee.feign.pojo.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {

    Long id;
    Long order_no;
    Integer user_id;
    Integer address_id;
    BigDecimal amount;
    LocalDateTime created_time;
    LocalDateTime payment_time;
    String comments;
    Integer status;
}