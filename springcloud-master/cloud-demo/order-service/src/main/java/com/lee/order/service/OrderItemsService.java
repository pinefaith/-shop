package com.lee.order.service;

import com.lee.order.pojo.OrderItems;

import java.util.List;

public interface OrderItemsService {
    void addOrderItem(OrderItems orderItem);

    List<OrderItems> getOrderItems(Long order_id);

    List<OrderItems> getOrderList(Integer user_id);
    void deleteOrder(Integer order_no);
}
