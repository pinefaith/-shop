package com.lee.address.mapper;


import com.lee.address.pojo.Address;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface AddressDaoMapper {

    @Select("select * from address where user_id = (#{id})")
    List<Address> findAddressById(@Param("id") Integer id);

    @Insert("INSERT INTO address(user_id,name, phone, addr) VALUES( #{user_id}, #{name}, #{phone}, #{addr} )")
    void insertAddress(Address address);

    @Delete("delete from address where id = #{id}")
    int deleteAddress(@Param("id") Integer id);
}
