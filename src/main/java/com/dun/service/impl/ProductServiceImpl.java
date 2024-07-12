package com.dun.service.impl;

import com.dun.entity.Product;
import com.dun.entity.query.GetProductListQuery;
import com.dun.mapper.ProductMapper;
import com.dun.service.ProductService;
import com.github.pagehelper.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    @Override
    public Page<Product> getList(GetProductListQuery query) {
        return productMapper.getList(query);
    }

    @Override
    public Product getById(String id) {
        return productMapper.selectById(id);
    }

    @Override
    public void save(Product product) {
        Product existProduct = productMapper.selectById(product.getId());
        if (existProduct == null) {
            productMapper.insert(product);
        } else {
            productMapper.updateById(product);
        }
    }

    @Override
    public void deleteById(String id) {
        productMapper.deleteById(id);
    }

    @Override
    public void initProductListPage(GetProductListQuery query, HttpServletRequest request) {
        Page<Product> products = getList(query);
        request.setAttribute("productList", products.getResult());
        request.setAttribute("pages", products.getPages());
        request.setAttribute("pageNum", products.getPageNum());
        request.setAttribute("pageSize", products.getPageSize());
        request.setAttribute("total", products.getTotal());
        request.setAttribute("query", query);
    }

    @Override
    public void deleteBatchByIds(String[] ids) {
        productMapper.deleteBatchByIds(ids);
    }
}
