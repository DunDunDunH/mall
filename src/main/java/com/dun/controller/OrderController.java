package com.dun.controller;

import com.dun.entity.dto.OrderDto;
import com.dun.entity.query.GenericReadByIdQuery;
import com.dun.entity.query.GetOrderListQuery;
import com.dun.service.OrderService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@AllArgsConstructor
@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @GetMapping("getList")
    public String getOrderList(GetOrderListQuery query, HttpServletRequest request, HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        query.setUserId(userId);
        orderService.initOrderListPage(query, request);
        return "orderList";
    }

    @GetMapping("get")
    public String getOrder(GenericReadByIdQuery query, HttpServletRequest request) {
        // 保存商品
        OrderDto orderDto = orderService.getById(query.getId());
        request.setAttribute("order", orderDto);
        return "orderDetail";
    }
}
