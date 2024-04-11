package com.lee.user.web;

import com.lee.user.pojo.User;
import com.lee.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/User")
public class UserController {

    @Resource
    private UserService userService;

    @PostMapping(value = "/login",produces = "application/json;charset=UTF-8")
    public  User login(@RequestBody User user){
        String account = user.getAccount();
        String password = user.getPassword();
        User loginUser = userService.login(account, password);
        System.out.println(loginUser);
        if (loginUser == null) {
            return null;
        }else {
            return loginUser;

        }
    }

    @PostMapping("/register")
    public ResponseEntity<String> register(@RequestBody User user) {
        System.out.println(user);
        if (userService.hasUser(user.getAccount())) {
            return ResponseEntity.badRequest().body("用户名已存在");
        } else {
            userService.addUser(user);
            return ResponseEntity.ok("注册成功!");
        }
    }

    @GetMapping("/findById")
    public User findById(@RequestParam Integer id) {
        List<User> userList =  userService.findById(id);
        User user = this.userService.findId(id);
        return user;
    }

    @PutMapping("/Update")
    public ResponseEntity<?> Update(@RequestBody User user) {
        this.userService.Update(user);
        return ResponseEntity.ok("ok");
    }

}

