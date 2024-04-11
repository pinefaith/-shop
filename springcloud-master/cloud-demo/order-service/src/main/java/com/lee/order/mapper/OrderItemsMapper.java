package com.lee.order.mapper;

import com.lee.order.pojo.OrderItems;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderItemsMapper {
    @Insert("insert into order_items (user_id, order_no, product_id, product_name, price, quantity, total_price, created, updated) values (#{user_id}, #{order_no}, #{product_id}, #{product_name}, #{price}, #{quantity}, #{total_price}, #{created}, #{updated})")
    void addOrderItem(OrderItems orderItem);

    @Select("select * from order_items where order_no = #{order_id}")
    @Results({
            @Result(column="product_id", property="product_id", jdbcType= JdbcType.INTEGER),
            @Result(column="order_no", property="order_no", jdbcType= JdbcType.INTEGER),
            @Result(column="total_price", property="total_price", jdbcType= JdbcType.INTEGER),
            @Result(column="product_name", property="product_name", jdbcType= JdbcType.VARCHAR),
            @Result(column="user_id", property="user_id", jdbcType=JdbcType.INTEGER)
    })
    List<OrderItems> getOrderItems(@Param("order_id") Long order_id);

    @Select("select * from order_items where user_id = #{user_id}")
    @Results({
            @Result(column="product_id", property="product_id", jdbcType= JdbcType.INTEGER),
            @Result(column="order_no", property="order_no", jdbcType= JdbcType.INTEGER),
            @Result(column="total_price", property="total_price", jdbcType= JdbcType.INTEGER),
            @Result(column="product_name", property="product_name", jdbcType= JdbcType.VARCHAR),
            @Result(column="user_id", property="user_id", jdbcType=JdbcType.INTEGER)
    })
    List<OrderItems> getOrderList(@Param("user_id") Integer user_id);

    @Delete("delete from order_items where order_no = #{order_no}")
    void deleteOrder(@Param("order_no") Integer order_no);
}
