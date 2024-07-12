package com.dun.entity;

import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Data
@NoArgsConstructor
public class Order {

    private String id; // id
    private String userId; // 用户ID
    private String productId; // 商品Id
    private String createTime; // 创建时间
    @TableLogic(value = "0", delval = "1")
    private boolean isDeleted; // 是否删除。0：否；1：是

    public Order(String userId, String productId) {
        this.id = UUID.randomUUID().toString().replace("-", "");
        this.userId = userId;
        this.productId = productId;
        this.createTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        this.isDeleted = false;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", userId=" + userId +
                ", productId=" + productId +
                ", createTime=" + createTime +
                ", isDeleted=" + isDeleted +
                '}';
    }
}
