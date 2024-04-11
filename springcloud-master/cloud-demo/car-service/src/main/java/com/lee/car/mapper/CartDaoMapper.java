package com.lee.car.mapper;



import com.lee.car.dto.CartDetailsDTO;
import com.lee.car.pojo.Cart;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartDaoMapper {

    @Insert("insert into cart(user_id,product_id,quantity) values(#{user_id},#{product_id},#{quantity})")
    Boolean addCart(Cart cart);

    @Select("select * from cart where user_id = #{user_id} AND product_id = #{product_id}")
    Cart getCart(@Param("user_id") Integer user_id,@Param("product_id") Integer product_id);

    @Update("update cart set quantity = #{quantity} where user_id = #{user_id} AND product_id = #{product_id}")
    void updateCart(Cart existingCart);

    @Select("select COUNT(*) AS cart_count FROM cart WHERE user_id = #{user_id};")
    Integer getProductNum(@Param("user_id") Integer user_id);

    @Select("SELECT c.id, c.quantity,c.product_id, p.product_name,p.image_url, p.price,p.stock FROM cart c JOIN products_copy p ON c.product_id = p.id WHERE c.user_id = #{user_id}")
    @Results({
            @Result(column="sort_id", property="sort_id", jdbcType= JdbcType.INTEGER),
            @Result(column="product_name", property="product_name", jdbcType=JdbcType.VARCHAR),
            @Result(column="product_id", property="product_id", jdbcType=JdbcType.VARCHAR),
            @Result(column="image_url", property="image_url", jdbcType=JdbcType.VARCHAR)
    })
    List<CartDetailsDTO> findCartDetailsByUserId(@Param("user_id") Integer user_id);

    @Delete("delete from cart where id = #{id}")
    void deleteCartItem(@Param("id") Integer id);
}
