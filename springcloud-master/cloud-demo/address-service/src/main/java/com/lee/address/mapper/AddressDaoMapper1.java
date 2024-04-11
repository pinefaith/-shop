package com.lee.address.mapper;


import com.lee.address.pojo.Address;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface AddressDaoMapper1 {

    @Select("select * from address  where user_id = #{user_id}")
    List<Address> getAddressList(@Param("user_id") Integer user_id);
}
