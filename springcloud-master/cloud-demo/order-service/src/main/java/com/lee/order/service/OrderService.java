package com.lee.order.service;

import com.lee.order.pojo.Order;

public interface OrderService {
    Boolean addOrder(Order order);

    Order findByOrderId(String order_no);

    void updateByOrderNo(String order_no, String created_time,Integer status);

    Integer getIDByOrderNo(Long order_no);

    void upperPopularity(String order_no);
}
