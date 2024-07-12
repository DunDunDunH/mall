package com.dun.entity.command;

import lombok.Data;

@Data
public class RegisterCommand {

    private String username; // 用户名
    private String password; // 密码
    private String confirmPassword; // 确认密码
    private String phone; // 手机号
}
