package com.lee.feign.clients.fallback;

import com.lee.feign.clients.UserClient;
import com.lee.feign.pojo.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.openfeign.FallbackFactory;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
public class UserClientFallbackFactory implements FallbackFactory<UserClient> {
    @Override
    public UserClient create(Throwable throwable) {
        return new UserClient() {
            @Override
            public User findById(Integer id){
                log.error("查询用户异常", throwable);
                return new User();
            }
        };
    }
}