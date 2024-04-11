package com.lee.product.mapper;
import com.lee.feign.pojo.Product;
import com.lee.product.pojo.Sort;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.type.JdbcType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SortDaoMapper {

   @Select("select * from sort")
   @Results({
           @Result(column="parent_id", property="parent_id", jdbcType= JdbcType.INTEGER),
           @Result(column="sort_name", property="sort_name", jdbcType=JdbcType.VARCHAR)
   })
   List<Sort> ListSort();


   @Select({
           "<script>",
           "select",
           "*",//别用*
           "from products_copy",
           "where sort_id in",
           "<foreach collection='array' item='sort_id' open='(' separator=',' close=')'>",
           "#{sort_id}",
           "</foreach>",
           "</script>"
   })
   @Results({
           @Result(column="sort_id", property="sort_id", jdbcType= JdbcType.INTEGER),
           @Result(column="product_name", property="product_name", jdbcType=JdbcType.VARCHAR),
           @Result(column="image_url", property="image_url", jdbcType=JdbcType.VARCHAR)
   })
   List<Product> getProductsByClass(List<Integer> array);
}
