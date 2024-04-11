package com.lee.order.mapper;

import com.lee.order.pojo.Order;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderMapper {

    @Insert("insert into `order`(order_no,user_id,address_id,amount,created_time,payment_time,comments,status) values(#{order_no},#{user_id},#{address_id},#{amount},#{created_time},#{payment_time},#{comments},#{status})")
    Boolean addOrder(Order order);

    @Select("select * from `order` where order_no = #{order_no}")
    @Results({
            @Result(column="order_no", property="order_no", jdbcType= JdbcType.INTEGER),
            @Result(column="user_id", property="user_id", jdbcType=JdbcType.INTEGER)
    })
    Order findByOrderId(@Param("order_no") String order_no);

    @Update("update `order` set payment_time = #{payment_time} ,status = #{status} WHERE order_no = #{order_no}")
    void updateByOrderNo(@Param("order_no") String order_no,@Param("payment_time")  String payment_time,@Param("status") Integer status);

    @Select("select id from `order` where order_no = #{order_no}")
    Integer getIDByOrderNo(@Param("order_no") Long order_no);

    @Update("UPDATE products_copy SET popularity = popularity + 1 WHERE id IN ( SELECT oi.product_id FROM order_items oi LEFT JOIN `order` o ON oi.order_no = o.id WHERE o.order_no = #{order_no} )")
    void upperPopularity(@Param("order_no") String order_no);
}
