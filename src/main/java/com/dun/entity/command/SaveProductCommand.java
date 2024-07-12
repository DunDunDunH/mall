package com.dun.entity.command;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SaveProductCommand {

    private String id; // ID，为空时新增
    private String name; // 名称
    private Double price; // 价格
}
