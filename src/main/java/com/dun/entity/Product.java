package com.dun.entity;

import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@NoArgsConstructor
public class Product {

    private String id; // ID
    private String name; // 单价
    private Double price; // 价格
    @TableLogic(value = "0", delval = "1")
    private boolean isDeleted; // 是否删除。0：否；1：是

    public Product(String name, Double price) {
        this.id = UUID.randomUUID().toString().replace("-", "");
        this.name = name;
        this.price = price;
        this.isDeleted = false;
    }

    public void update(String name, Double price) {
        this.name = name;
        this.price = price;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name=" + name +
                ", price=" + price +
                ", isDeleted=" + isDeleted +
                '}';
    }
}
