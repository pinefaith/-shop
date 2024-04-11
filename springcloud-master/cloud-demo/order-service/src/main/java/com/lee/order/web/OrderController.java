package com.lee.order.web;

import com.lee.order.common.Result;
import com.lee.order.pojo.Order;
import com.lee.order.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("/order")
public class OrderController {
    @Resource
    OrderService orderService;

    /**
     * 添加订单
     * @param order
     * @return
     */
    @PostMapping("/addOrder")
    public Result<?> addOrder(@RequestBody Order order){
        try {
            Boolean isAddOrder = orderService.addOrder(order);
            order.setId(order.getOrder_no());
            return Result.success(order);
        } catch (Exception e) {
            e.printStackTrace();
            // 返回失败响应
            return Result.error("1","添加订单失败");
        }
    }
}
