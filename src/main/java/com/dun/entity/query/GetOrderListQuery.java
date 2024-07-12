package com.dun.entity.query;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class GetOrderListQuery extends PagingQuery {

    private String userId; // 用户ID
    private String productName; // 商品名称
}
