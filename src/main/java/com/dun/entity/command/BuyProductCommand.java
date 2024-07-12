package com.dun.entity.command;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
public class BuyProductCommand {

    private String id; // ID
    private Date createTime = new Date(); // 创建时间
}
