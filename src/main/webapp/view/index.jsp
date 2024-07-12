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
    <h1>商品列表</h1>
    <table border="2" style="font-size: 25px;">
        <tr>
            <td colspan="4">
                <form action="${pageContext.request.contextPath}/product/indexPage" method="get">
                    商品名称：<input type="text" id="name" name="name" value="${query.name}">
                    <input type="submit" class="button" value="搜索">
                </form>
                <button><a href="${pageContext.request.contextPath}/product/savePage">添加商品</a></button>
                <button><a href="javascript:void(0);" id="delSelected">删除选中</a></button>
            </td>
        </tr>
        <tr>
            <th><input type="checkbox" id="all"></th>
            <th>商品名称</th>
            <th>价格</th>
            <th>操作</th>
        </tr>
        <c:forEach var="product" items="${productList}">
            <tr align="center">
                <td><input type="checkbox" name="productId"  value="${product.id}"></td>
                <td>${product.name}</td>
                <td>￥${product.price}</td>
                <td>
                    <button><a href="${pageContext.request.contextPath}/product/savePage?id=${product.id}">修改</a></button>
                    <button><a href="${pageContext.request.contextPath}/product/delete?id=${product.id}">删除</a></button>
                    <button><a href="${pageContext.request.contextPath}/product/buy?id=${product.id}">购买</a></button>
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
                                    <a href="${pageContext.request.contextPath}/product/indexPage?pageNum=${pageNum - 1}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:forEach begin="1" end="${pages}" var="i">
                                <c:if test="${pageNum == i}">
                                    <li class="active"><a href="${pageContext.request.contextPath}/product/indexPage?pageNum=${i}">${i}</a>
                                    </li>
                                </c:if>
                                <c:if test="${pageNum != i}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/product/indexPage?pageNum=${i}">${i}</a>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <c:if test="${pages == 1}">
                                <li class="disabled">
                                </li>
                            </c:if>
                            <c:if test="${pages != 1}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/product/indexPage?pageNum=${pageNum + 1}" aria-label="Next">
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

<script type="text/javascript">
    window.onload=function() {
        //给删除选中按钮添加点击事件
        document.getElementById("delSelected").onclick = function () {
            var deletedIds = [];
            var cbs = document.getElementsByName("productId");
            for (var i = 0; i < cbs.length; i++) {
                if (cbs[i].checked) {  //一旦有被选的项，就停止循环
                    deletedIds.push(cbs[i].value);
                }
            }
            window.location.href="deleteBatch?ids="+deletedIds;
        };

        document.getElementById("all").onclick=function () {
            var  cbs = document.getElementsByName("productId");
            for (var i = 0;i < cbs.length; i++){
                cbs[i].checked = this.checked;
            }
        }
    }
</script>