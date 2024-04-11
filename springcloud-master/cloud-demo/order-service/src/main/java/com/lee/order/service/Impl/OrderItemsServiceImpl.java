package com.lee.order.service.Impl;

import com.lee.order.mapper.OrderItemsMapper;
import com.lee.order.pojo.OrderItems;
import com.lee.order.service.OrderItemsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrderItemsServiceImpl implements OrderItemsService {
    @Resource
    OrderItemsMapper orderItemsDaoMapper;
    @Override
    public void addOrderItem(OrderItems orderItem) {
        orderItemsDaoMapper.addOrderItem(orderItem);
    }

    @Override
    public List<OrderItems> getOrderItems(Long order_id) {
        return orderItemsDaoMapper.getOrderItems(order_id);
    }

    @Override
    public List<OrderItems> getOrderList(Integer user_id) {
        return orderItemsDaoMapper.getOrderList(user_id);
    }
    @Override
    public void deleteOrder(Integer order_no) {
        orderItemsDaoMapper.deleteOrder(order_no);
    }

}
