package com.lee.order.mapper;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.lee.order.pojo.Order;
import java.util.List;

@Repository
public interface CommentsMapper {

    @Select("select * from `order` where status = 2")
    List<Order> getAllComments();
}
