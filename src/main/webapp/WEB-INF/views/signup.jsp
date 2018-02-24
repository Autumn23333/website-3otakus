<%--
  Created by IntelliJ IDEA.
  User: lichenghong
  Date: 2/11/18
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-han">
<head>
    <title>注册 - 3otakus</title>
    <meta charset="UTF-8">
    <style type="text/css">
        body {
            background: url(/image/webpage/signup.jpg) no-repeat center top;
            background-size: cover;
        }

        #signupwindow {
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
            margin: 0 0 25px 0;
            border-radius: 5px;
            border: 1px solid #B2B2B4;
        }

        #answer {
            width: 200px;
            float: left;
            margin: 0 0 25px 25px;
        }

        #signup_button {
            background-color: #f09cb8;
            width: 350px;
            height: 40px;
            color: white;
            font-size: 22px;
            border-radius: 5px;
            border: 1px solid white;
            font-family: Microsoft YaHei;
        }

        #signup_button:hover {
            background-color: #f4d26c;
            outline: none;
        }
    </style>
</head>
<body>
<c:if test="${not empty msg}">
    <p>注册失败，请重试</p>
</c:if>
<div id="signupwindow">
    <div>
        <img src="image/webpage/3otakus.png" width="300">
    </div>
    <form method="post" id="form" action="submitsignup">
        <div>
            <input type="text" placeholder="请输入账号" id="username" name="username" class="enterbox">
        </div>
        <div>
            <input type="password" placeholder="请输入密码" id="password" name="password" class="enterbox">
        </div>
        <div>
            <input type="password" placeholder="请再次输入密码" id="check_password" name="check_password" class="enterbox">
        </div>
        <div>
            <input type="email" placeholder="请输入邮箱" id="email" name="email" class="enterbox">
        </div>
        <div>
            <input type="text" placeholder="请输入验证码" id="answer" name="answer" class="enterbox">
        </div>
        <div>
            <input type="submit" value="注        册" id="signup_button">
        </div>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous">
</script>
<script>
    $("#signupwindow").css("top", (($(document).height() - $("#signupwindow").height()) / 2) + "px");
</script>
</body>
</html>
