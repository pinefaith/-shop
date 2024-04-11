package com.lee.order.web;
import com.lee.feign.pojo.CartDetailsDTO;
import com.lee.feign.pojo.Product;
import com.lee.feign.clients.ProductClient;
import com.lee.feign.pojo.productDto;
import com.lee.order.common.Result;
import com.lee.order.dto.OrderInfo;
import com.lee.order.dto.OrderItemsRequest;
import com.lee.order.pojo.Order;
import com.lee.order.pojo.OrderItems;
import com.lee.order.service.OrderItemsService;
import com.lee.order.service.OrderService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/orderItems")
public class OrderItemsController {
    @Resource
    OrderItemsService orderItemsService;
    @Resource
    ProductClient productService;
    @Resource
    OrderService orderService;

    /**
     * 根据用户id获取订单详情
     * @param order_id
     * @return
     */
    @GetMapping("/getOrderItems/{order_id}")
    public Result<?> getOrderItems(@PathVariable Long order_id){
        List<OrderItems> orderItemsList = orderItemsService.getOrderItems(order_id);
        List<OrderInfo> orderInfoList = new ArrayList<>();
        for (OrderItems orderItems : orderItemsList) {
            String product_name = orderItems.getProduct_name();
            BigDecimal price = orderItems.getPrice();
            Integer quantity = orderItems.getQuantity();
            BigDecimal total = orderItems.getTotal_price();
            LocalDateTime createdTime = orderItems.getCreated();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String created_time = createdTime.format(formatter);

            // 获取对应的product_id
            Integer product_id = orderItems.getProduct_id();

            // 根据product_id查询Product表中的记录
            Product product = productService.getProductsById(product_id);

            String image_url = product.getImage_url();

            // 获取对应的order_no
            Long order_id1 = orderItems.getOrder_no();
            Order order = orderService.findByOrderId(order_id1.toString());
            Long order_no = orderItems.getOrder_no();
            Integer status = order.getStatus();
            LocalDateTime paymentTime = order.getPayment_time();
            String payment_time;
            if(paymentTime!=null) {
                DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                payment_time = paymentTime.format(formatter);
            }else
                payment_time = null;
            // 构建订单信息对象
            OrderInfo orderInfo = new OrderInfo(product_id,product_name, price, quantity, total, created_time, image_url, order_no,payment_time,status);
            orderInfoList.add(orderInfo);
        }
        return Result.success(orderInfoList);
    }

    /**
     * 查询用户的所有订单数据
     * @param user_id
     * @return
     */
    @GetMapping("/getOrderList/{user_id}")
    public Result<?> getOrderList(@PathVariable Integer user_id) {
        List<OrderItems> orderItemsList = orderItemsService.getOrderList(user_id);
        List<OrderInfo> orderInfoList = new ArrayList<>();
        for (OrderItems orderItems : orderItemsList) {
            String product_name = orderItems.getProduct_name();
            BigDecimal price = orderItems.getPrice();
            Integer quantity = orderItems.getQuantity();
            BigDecimal total = orderItems.getTotal_price();
            LocalDateTime createdTime = orderItems.getCreated();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            String created_time = createdTime.format(formatter);
            // 获取对应的product_id
            Integer product_id = orderItems.getProduct_id();

            // 根据product_id查询Product表中的记录
            Product product = productService.getProductsById(product_id);

            String image_url = product.getImage_url();

            // 获取对应的order_no
            Long order_id = orderItems.getOrder_no();
            Order order = orderService.findByOrderId(order_id.toString());

            Long order_no = order.getOrder_no();
            Integer status = order.getStatus();
            LocalDateTime paymentTime = order.getPayment_time();
            String payment_time;
            if (paymentTime!=null) {
                DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                payment_time = paymentTime.format(formatter);
            }else
                payment_time = null;
            // 构建订单信息对象
            OrderInfo orderInfo = new OrderInfo(product_id,product_name, price, quantity, total, created_time, image_url, order_no,payment_time,status);
            orderInfoList.add(orderInfo);
        }
        return Result.success(orderInfoList);
    }

    /**
     * 添加订单详情
     * @param orderItemsRequest
     * @return
     */
    @PostMapping("/addOrderItems")
    public Result<?> addOrderItems(@RequestBody OrderItemsRequest orderItemsRequest){
        Long order_id = orderItemsRequest.getOrder_id();
        Integer userId = orderItemsRequest.getUser_id();
        List<CartDetailsDTO> selectedItems = orderItemsRequest.getSelectedItems();
        // 遍历选中的商品列表，并将每个商品添加到订单详情表中
        for (CartDetailsDTO selectedItem : selectedItems) {
            OrderItems orderItem = new OrderItems();
            orderItem.setUser_id(userId);
            orderItem.setOrder_no(order_id);
            orderItem.setProduct_id(selectedItem.getProduct_id());
            orderItem.setProduct_name(selectedItem.getProduct_name());
            orderItem.setPrice(selectedItem.getPrice());
            orderItem.setQuantity(selectedItem.getQuantity());
            BigDecimal price = selectedItem.getPrice();
            Integer quantity = selectedItem.getQuantity();
            orderItem.setTotal_price(price.multiply(BigDecimal.valueOf(quantity)));
            orderItem.setCreated(LocalDateTime.now());
            orderItem.setUpdated(LocalDateTime.now());

            orderItemsService.addOrderItem(orderItem); // 调用Service层方法将订单详情添加到数据库
            // 更新库存
            productDto productDto = new productDto();
            productDto.setI(-selectedItem.getQuantity());
            productDto.setProductId(selectedItem.getProduct_id());
            productService.updateStock(productDto); // 减少库存数量
        }
        return Result.success("订单详情已加入到订单详情表中");
    }
    /**
     * 删除订单详情
     * @param order_no
     * @return
     */
    @DeleteMapping("deleteOrder/{order_no}")
    public Result<?> deleteOrder(@PathVariable Long order_no) {
        Integer order_id = orderService.getIDByOrderNo(order_no);
        // 实现从数据库中删除订单的逻辑
        orderItemsService.deleteOrder(order_id);
        return Result.success("订单删除成功！");
    }
}
