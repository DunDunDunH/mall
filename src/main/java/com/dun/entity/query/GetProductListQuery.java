package com.dun.entity.query;

import lombok.Data;

@Data
public class GetProductListQuery extends PagingQuery {

    private String name; // 名称
}
