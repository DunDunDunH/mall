<%@ page import="java.util.List" %>
<%@page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" th:href="@{/api/css/jquery.pagination.css}">
<script th:src="@{/api/js/jquery.pagination.min.js}"></script>
<html>
<head>
    <title>商城系统</title>
    <style type="text/css">
        .lnr {
            font-size: 20px;
            vertical-align: -5px;
        }

        .rightside-nav {
            float: right;
        }

        .rightside-nav a {
            line-height: 30px;
            text-align: center;
            box-sizing: border-box;
            cursor: pointer;
        }

        .rightside-nav a:last-child {
            padding-right: 80px;
        }
    </style>
</head>
<body style="margin:0px;background: url(${pageContext.request.contextPath}/static/images/login.jpg) no-repeat;background-size:100% 100%;background-attachment:fixed;">
<div class="nav" style="background-color: antiquewhite">
    <div class="rightside-nav" style="color: white">
        <a href="${pageContext.request.contextPath}/product/indexPage"><span class="lnr lnr-user"></span><span>Hi,${name}</span></a>&nbsp&nbsp&nbsp&nbsp
        <a href="${pageContext.request.contextPath}/product/indexPage"><span class="lnr lnr-home"></span><span>首页</span></a>&nbsp&nbsp&nbsp&nbsp
        <a href="${pageContext.request.contextPath}/order/getList"><span class="lnr lnr-home"></span><span>订单管理</span></a>&nbsp&nbsp&nbsp&nbsp
        <a href="${pageContext.request.contextPath}/user/logout"><span class="lnr lnr-home"></span><span>注销</span></a>
    </div>
</div>
<div align="center" style="padding-top: 100px">
    <h1>商品</h1>
    <form action="${pageContext.request.contextPath}/product/save" method="post" style="border:3px solid black;width: 20%;padding-bottom: 20px">
        <p><input id="id" name="id" type="hidden" value="${product.id}"></p>
        <p>&nbsp&nbsp名称:&nbsp&nbsp<input id="name" name="name" type="text" value="${product.name}">&nbsp&nbsp</p>
        <p>&nbsp&nbsp价格:&nbsp&nbsp<input id="price" name="price" type="number" step="0.01" value="${product.price}"></p>
        <input type="submit" class="button" value="确定">
        <button><a href="${pageContext.request.contextPath}/product/indexPage">返回</a></button><br><br>
    </form>
</div>
</body>
</html>