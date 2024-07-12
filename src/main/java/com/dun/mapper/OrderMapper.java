package com.dun.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dun.entity.Order;
import com.dun.entity.dto.OrderDto;
import com.dun.entity.query.GetOrderListQuery;
import com.github.pagehelper.Page;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface OrderMapper extends BaseMapper<Order> {
    Page<OrderDto> getList(GetOrderListQuery query);

    int insert(Order order);

    OrderDto getById(String id);
}
