package com.lee.product.mapper;
import com.lee.product.pojo.Prefer;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PreferDaoMapper {

    @Insert("insert into prefer(user_id,product_id) values(#{user_id},#{product_id})")
    Boolean addPrefer(Prefer prefer);

    @Select("select * from prefer where user_id=#{user_id} and product_id=#{product_id}")
    Prefer getPrefer(@Param("user_id") Integer user_id, @Param("product_id") Integer product_id);

    @Update("update prefer set quantity = #{quantity} where user_id = #{user_id} AND product_id = #{product_id}")
    void updatePrefer(Prefer existingPrefer);

    @Select("select COUNT(*) AS prefer_count FROM prefer WHERE user_id = #{user_id};")
    Integer getProductNum(@Param("user_id") Integer user_id);

    @Delete(" delete from prefer where product_id = #{id}")
    void deletePreferItem(@Param("id") Integer id);

    @Select("select product_id from prefer where user_id = #{user_id}")
    List<Integer> getProduct_id(@Param("user_id") Integer user_id);
}
