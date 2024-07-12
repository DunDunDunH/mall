package com.dun.service;

import com.dun.entity.Product;
import com.dun.entity.query.GetProductListQuery;
import com.github.pagehelper.Page;

import javax.servlet.http.HttpServletRequest;

public interface ProductService {
    Page<Product> getList(GetProductListQuery query);

    Product getById(String id);

    void save(Product product);

    void deleteById(String id);

    void initProductListPage(GetProductListQuery query, HttpServletRequest request);

    void deleteBatchByIds(String[] ids);
}
