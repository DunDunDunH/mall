<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>商城系统-注册</title>
</head>
<body style="margin:0px;background: url(${pageContext.request.contextPath}/static/images/login.jpg) no-repeat;background-size:100% 100%;background-attachment:fixed;">
<div align="center" style="padding-top: 100px">
    <h1>注册</h1>
    <form action="${pageContext.request.contextPath}/user/save" method="post"
          style="border:3px solid black;width: 25%;padding-bottom: 20px">
        <p>&nbsp&nbsp用户名:&nbsp&nbsp<input id="username" name="username" type="text" value="${user.username}">&nbsp&nbsp</p>
        <p>&nbsp&nbsp&nbsp密码:&nbsp&nbsp&nbsp<input id="password" name="password" type="password" value="${user.password}"></p>
        <p>确认密码:<input id="confirmPassword" name="confirmPassword" type="password" value="${user.confirmPassword}"></p>
        <p>&nbsp手机号:&nbsp&nbsp<input id="phone" name="phone" type="text" value="${user.phone}"></p>
        <input type="submit" class="button" value="确定">
        <button><a href="${pageContext.request.contextPath}/user/loginPage">登录</a></button><br><br>
        <span style="color:red;font-size:20px;font-weight: bold">${msg}</span>
    </form>
</div>
</body>
</html>

