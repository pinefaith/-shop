package com.lee.feign.clients;

import com.lee.feign.clients.fallback.UserClientFallbackFactory;
import com.lee.feign.pojo.User;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author LiJing
 * @version 1.0
 */
@FeignClient(value = "userservice", fallbackFactory = UserClientFallbackFactory.class)
public interface UserClient {

    @GetMapping("/findById")
    public User findById(@RequestParam Integer id);
}
