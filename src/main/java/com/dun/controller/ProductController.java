package com.dun.controller;

import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.dun.entity.Order;
import com.dun.entity.Product;
import com.dun.entity.command.BuyProductCommand;
import com.dun.entity.command.GenericBatchWriteByIdsCommand;
import com.dun.entity.command.GenericWriteByIdCommand;
import com.dun.entity.command.SaveProductCommand;
import com.dun.entity.query.GenericReadByIdQuery;
import com.dun.entity.query.GetOrderListQuery;
import com.dun.entity.query.GetProductListQuery;
import com.dun.service.OrderService;
import com.dun.service.ProductService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@AllArgsConstructor
@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;
    @Autowired
    private OrderService orderService;

    @GetMapping("indexPage")
    public String indexPage(GetProductListQuery query, HttpServletRequest request) {
        productService.initProductListPage(query, request);
        return "index";
    }

    @GetMapping("savePage")
    public String addPage(GenericReadByIdQuery query, HttpServletRequest request) {
        if (StringUtils.isNotBlank(query.getId())) {
            Product product = productService.getById(query.getId());
            request.setAttribute("product", product);
        }
        return "productSave";
    }

    @PostMapping("save")
    public String saveProduct(SaveProductCommand command, HttpServletRequest request) {
        // 保存商品
        Product product;
        if (StringUtils.isBlank(command.getId())) {
            // 新增
            product = new Product(command.getName(), command.getPrice());
        } else {
            // 修改
            product = productService.getById(command.getId());
            product.update(command.getName(), command.getPrice());
        }
        productService.save(product);
        GetProductListQuery query = new GetProductListQuery();
        productService.initProductListPage(query, request);
        return "index";
    }

    @GetMapping("delete")
    public String deleteProduct(GenericWriteByIdCommand command, HttpServletRequest request) {
        productService.deleteById(command.getId());
        GetProductListQuery query = new GetProductListQuery();
        productService.initProductListPage(query, request);
        return "index";
    }

    @GetMapping("deleteBatch")
    public String deleteProduct(GenericBatchWriteByIdsCommand command, HttpServletRequest request) {
        if (command.getIds()!=null && command.getIds().length>0){
            productService.deleteBatchByIds(command.getIds());
        }
        GetProductListQuery query = new GetProductListQuery();
        productService.initProductListPage(query, request);
        return "index";
    }

    @GetMapping("buy")
    public String buyProduct(BuyProductCommand command, HttpServletRequest request, HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        Order order = new Order(userId, command.getId());
        orderService.insert(order);
        GetOrderListQuery query = new GetOrderListQuery();
        query.setUserId(userId);
        orderService.initOrderListPage(query, request);
        return "orderList";
    }
}
