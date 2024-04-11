package com.lee.user.service.impl;

import com.lee.user.mapper.UserMapper;
import com.lee.user.pojo.User;
import com.lee.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userDaoMapper;

    @Override
    public boolean hasUser(String account) {
        User user = userDaoMapper.findByAccount(account);
        return user != null;
    }

    @Override
    public User login(String account, String password) {
        User user = userDaoMapper.findByAccount(account);
//        boolean match = new BCryptPasswordEncoder().matches(user.getPassword());
        if (user != null && user.getPassword().equals(password)) {
//            System.out.println(user);
            return user;
        } else {
            return null;
        }
    }

    @Override
    public void addUser(User user) {
         userDaoMapper.addUser(user);
    }

    @Override
    public List<User> findById(Integer id) {
        return userDaoMapper.findById(id);
    }

    @Override
    public User findId(Integer id) {
        User user = this.userDaoMapper.findId(id);
        return user;
    }

    @Override
    public void Update(User user){
        this.userDaoMapper.Update(user);
    }
}
