package com.dun.entity;

import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@NoArgsConstructor
public class User {

    private String id;
    private String username;
    private String password;
    private String phone;
    @TableLogic(value = "0", delval = "1")
    private boolean isDeleted; // 是否删除。0：否；1：是

    public User(String username, String password, String phone) {
        this.id = UUID.randomUUID().toString().replace("-", "");
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.isDeleted = false;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username=" + username +
                ", password=" + password +
                ", phone=" + phone +
                ", isDeleted=" + isDeleted +
                '}';
    }
}
