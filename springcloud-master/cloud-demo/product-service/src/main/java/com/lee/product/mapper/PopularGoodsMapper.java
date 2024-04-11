package com.lee.product.mapper;
import com.lee.feign.pojo.Product;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.type.JdbcType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PopularGoodsMapper {

    @Select("select * from products_copy order by popularity desc limit 5")
    @Results({
            @Result(column="sort_id", property="sort_id", jdbcType= JdbcType.INTEGER),
            @Result(column="product_name", property="product_name", jdbcType=JdbcType.VARCHAR),
            @Result(column="image_url", property="image_url", jdbcType=JdbcType.VARCHAR)
    })
    List<Product> getPopularGoods();
}
