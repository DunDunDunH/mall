package com.dun.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dun.entity.Product;
import com.dun.entity.query.GetProductListQuery;
import com.github.pagehelper.Page;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface ProductMapper extends BaseMapper<Product> {
    Page<Product> getList(GetProductListQuery query);

    void deleteById(String id);

    void deleteBatchByIds(String[] ids);
}
