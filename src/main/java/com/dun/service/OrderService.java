package com.dun.service;

import com.dun.entity.Order;
import com.dun.entity.dto.OrderDto;
import com.dun.entity.query.GetOrderListQuery;
import com.github.pagehelper.Page;

import javax.servlet.http.HttpServletRequest;

public interface OrderService {
    OrderDto getById(String id);

    Page<OrderDto> getList(GetOrderListQuery query);

    void insert(Order order);

    void initOrderListPage(GetOrderListQuery query, HttpServletRequest request);
}
