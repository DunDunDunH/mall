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
        * {
            padding: 0;
            margin: 0;
        }

        .nav {
            height: 30px;
            width: 100%;
            box-shadow: 5px 5px 8px 0px gray;
        }

        .icon {
            float: left;
        }

        ul {
            list-style-type: none;
        }

        ul li:first-child {
            padding-left: 50px;
        }

        ul li {
            float: left;
            line-height: 30px;
            text-align: center;
            box-sizing: border-box;
            cursor: pointer;
            padding-left: 20px;
        }

        ul > li > a:hover {
            color: lightblue;
        }

        a {
            text-decoration: none;
            color: black;
        }

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
    <h1>订单管理</h1>
    <table border="2" style="font-size: 25px;">
        <tr>
            <td colspan="5">
                <form action="${pageContext.request.contextPath}/order/getList" method="get">
                    商品名称：<input type="text" id="productName" name="productName" value="${query.productName}">
                    <input type="submit" class="button" value="搜索">
                </form>
            </td>
        </tr>
        <tr>
            <th>订单编号</th>
            <th>商品名称</th>
            <th>日期</th>
            <th>操作</th>
        </tr>
        <c:forEach var="order" items="${orderList}">
            <tr align="center">
                <td>${order.id}</td>
                <td>${order.productName} </td>
                <td>${order.createTime} </td>
                <td>
                    <button><a href="${pageContext.request.contextPath}/order/get?id=${order.id}">详情</a></button>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="4">
                <div>
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <c:if test="${pages == 1}">
                                <li class="disabled">
                                </li>
                            </c:if>
                            <c:if test="${pages != 1}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/order/getList?userId=${userId}&pageNum=${pageNum - 1}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:forEach begin="1" end="${pages}" var="i">
                                <c:if test="${pageNum == i}">
                                    <li class="active"><a href="${pageContext.request.contextPath}/order/getList?userId=${userId}&pageNum=${i}">${i}</a>
                                    </li>
                                </c:if>
                                <c:if test="${pageNum != i}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/order/getList?userId=${userId}&pageNum=${i}">${i}</a>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <c:if test="${pages == 1}">
                                <li class="disabled">
                                </li>
                            </c:if>
                            <c:if test="${pages != 1}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/order/getList?userId=${userId}&pageNum=${pageNum + 1}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <span style="font-size: 25px;margin-left: 5px;">
                                共${total}条记录，共${pages}页
                            </span>
                        </ul>
                    </nav>
                </div>
            </td>
        </tr>
    </table>
</div>
</body>
</html>