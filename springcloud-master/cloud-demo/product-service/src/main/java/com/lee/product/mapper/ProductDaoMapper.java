package com.lee.product.mapper;
import com.lee.feign.pojo.Product;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductDaoMapper {

    @Select("select * from products_copy where id = #{id}")
    @Results({
            @Result(column="sort_id", property="sort_id", jdbcType= JdbcType.INTEGER),
            @Result(column="product_name", property="product_name", jdbcType=JdbcType.VARCHAR),
            @Result(column="image_url", property="image_url", jdbcType=JdbcType.VARCHAR)
    })
    Product getProductsById(@Param("id") Integer id);

    @Select("select * from products_copy where product_name like '%${product_name}%'")
    @Results({
            @Result(column="sort_id", property="sort_id", jdbcType= JdbcType.INTEGER),
            @Result(column="product_name", property="product_name", jdbcType=JdbcType.VARCHAR),
            @Result(column="image_url", property="image_url", jdbcType= JdbcType.VARCHAR)
    })
    List<Product> getProductByName(@Param("product_name") String product_name);

    @Update("update products_copy set stock = stock + #{stock} where id = #{product_id}")
    void updateStock(@Param("product_id") Integer product_id, @Param("stock") int stock);
}
