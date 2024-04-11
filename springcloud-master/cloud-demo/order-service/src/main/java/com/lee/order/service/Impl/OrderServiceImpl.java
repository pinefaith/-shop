package com.lee.order.service.Impl;

import com.lee.order.pojo.Order;
import com.lee.order.mapper.OrderMapper;
import com.lee.order.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Service
public class OrderServiceImpl implements OrderService {
    @Resource
    OrderMapper orderDaoMapper;
    @Override
    public Boolean addOrder(Order order) {
        Long order_no = Long.parseLong(generateOrderNo());
        order.setOrder_no(order_no);
        // 自动生成创建时间
        LocalDateTime createdTime = LocalDateTime.now();
        order.setCreated_time(createdTime);
        return orderDaoMapper.addOrder(order);
    }

    @Override
    public Order findByOrderId(String order_no) {
        return orderDaoMapper.findByOrderId(order_no);
    }

    @Override
    public void updateByOrderNo(String order_no, String payment_time,Integer status) {
        orderDaoMapper.updateByOrderNo(order_no,payment_time,status);
    }

    @Override
    public Integer getIDByOrderNo(Long order_no) {
        return orderDaoMapper.getIDByOrderNo(order_no);
    }

    @Override
    public void upperPopularity(String order_no) {
        orderDaoMapper.upperPopularity(order_no);
    }

    private String generateOrderNo() {
        // 实现自动生成订单号的逻辑
        // 这里使用当前时间的格式化字符串作为订单号
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
        String timestamp = LocalDateTime.now().format(formatter);
        return timestamp;
    }
}
