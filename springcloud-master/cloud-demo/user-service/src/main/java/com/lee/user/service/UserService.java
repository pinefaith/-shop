package com.lee.user.service;


import com.lee.user.pojo.User;

import java.util.List;

public interface UserService {

    User login(String account, String password);
    void addUser(User user);
    boolean hasUser(String account);
    List<User> findById(Integer id);
    User findId( Integer id);
    void Update(User user);

}
