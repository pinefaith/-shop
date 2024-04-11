package com.lee.user.mapper;

import com.lee.user.pojo.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    @Select("select *from user where account = #{account}")
    User findByAccount(@Param("account") String account);
    @Insert("insert into user(account,name,password,phone,sex) values(#{account},#{name},#{password},#{phone},#{sex})")
    boolean addUser(User user);
    @Select("select * from user where id = #{id}")
    List<User> findById(@Param("id") Integer id);

    @Select("select * from user where id = #{id}")
    User findId(@Param("id") Integer id);

    @Update("update user set account=#{account}, name=#{name}, password=#{password},phone=#{phone},sex=#{sex} where id=#{id}")
    void Update(User user);
}