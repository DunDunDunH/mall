package com.dun.service.impl;

import com.dun.entity.Order;
import com.dun.entity.dto.OrderDto;
import com.dun.entity.query.GetOrderListQuery;
import com.dun.mapper.OrderMapper;
import com.dun.service.OrderService;
import com.github.pagehelper.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public OrderDto getById(String id) {
        return orderMapper.getById(id);
    }

    @Override
    public Page<OrderDto> getList(GetOrderListQuery query) {
        return orderMapper.getList(query);
    }

    @Override
    public void insert(Order order) {
        orderMapper.insert(order);
    }

    @Override
    public void initOrderListPage(GetOrderListQuery query, HttpServletRequest request) {
        Page<OrderDto> orderDtos = getList(query);
        request.setAttribute("orderList", orderDtos.getResult());
        request.setAttribute("pages", orderDtos.getPages());
        request.setAttribute("pageNum", orderDtos.getPageNum());
        request.setAttribute("pageSize", orderDtos.getPageSize());
        request.setAttribute("total", orderDtos.getTotal());
        request.setAttribute("query", query);
    }
}
