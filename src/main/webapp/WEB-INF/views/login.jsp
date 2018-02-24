<%--
  Created by IntelliJ IDEA.
  User: lichenghong
  Date: 2/11/18
  Time: 3:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="true" %>
<html>
<head>
    <title>Login - 3otakus</title>
    <style type="text/css">
        body {
            background: url(/image/webpage/login.jpg) no-repeat center top;
            background-size: cover;
        }

        #loginwindow {
            position: relative;
            opacity: 0.9;
            width: 400px;
            height: 530px;
            background-color: white;
            margin: 0 auto;
            left: -300px;
            top: 50px;
            text-align: center;
        }

        .enterbox {
            height: 40px;
            width: 350px;
            margin: 0 0 40px 0;
            border-radius: 5px;
            border: 1px solid #B2B2B4;
        }

        #answer {
            width: 200px;
            margin: 0 0 40px 25px;
            float: left;
        }

        #remember_div {
            text-align: left;
            position: relative;
            left: 30px;
            color: grey;
            width: 150px;
            float: left;
        }

        #remember {
            position: relative;
            margin: 5px 0 40px 0;
        }

        #forgetpassword {
            float: right;
            width: 150px;
        }

        a:link {
            color: grey;
            text-decoration: none;
        }

        a:visited {
            color: grey;
            text-decoration: none;
        }

        a:hover {
            color: #424242;
        }

        #login_button {
            background-color: #f09cb8;
            width: 350px;
            height: 40px;
            color: white;
            font-size: 22px;
            border-radius: 5px;
            border: 1px solid white;
            font-family: Microsoft YaHei;
        }

        #login_button:hover {
            background-color: #f4d26c;
            outline: none;
        }
    </style>
</head>
<body>
<c:if test="${not empty msg}">
    <p>${msg}</p>
</c:if>
<div id="loginwindow">
    <div>
        <img src="image/webpage/3otakus.png" width="300">
    </div>
    <form method="post" id="form" action="login_check">
        <div>
            <input type="text" placeholder="请输入账号" id="username" name="username" class="enterbox">
        </div>
        <div>
            <input type="password" placeholder="请输入密码" id="password" name="password" class="enterbox">
        </div>
        <div>
            <input type="text" placeholder="请输入验证码" id="answer" name="answer" class="enterbox">
        </div>

        <div style="clear: both"></div>
        <div id="remember_div">
            <input type="checkbox" id="remember">记住密码
        </div>
        <div id="forgetpassword">
            <a href="">忘记密码</a>
        </div>
        <div>
            <input type="submit" value="登        录" id="login_button">
        </div>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous">
</script>
<script>
    $("#loginwindow").css("top", (($(document).height() - $("#loginwindow").height()) / 2) + "px");
</script>
</body>
</html>
