package com.dun.service.impl;

import com.dun.entity.User;
import com.dun.mapper.UserMapper;
import com.dun.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public boolean isExistUsername(String username, String id) {
        User user = userMapper.getByUsername(username);
        return user != null && !user.getId().equals(id);
    }

    @Override
    public boolean isExistPhone(String phone, String id) {
        User user = userMapper.getByPhone(phone);
        return user != null && !user.getId().equals(id);
    }

    @Override
    public User getByUsername(String username) {
        return userMapper.getByUsername(username);
    }

    @Override
    public void insert(User user) {
        userMapper.insert(user);
    }
}
