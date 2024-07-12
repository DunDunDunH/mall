package com.dun.entity.dto;

import lombok.Data;

@Data
public class OrderDto {

    private String id; // id
    private String productName; // 商品Id
    private String productPrice; // 商品Id
    private String createTime; // 创建时间
}
