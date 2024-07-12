package com.dun.service;

import com.dun.entity.User;

public interface UserService {
    boolean isExistUsername(String username, String id);

    boolean isExistPhone(String phone, String id);

    User getByUsername(String username);

    void insert(User user);
}
