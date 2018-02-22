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
        body{
            background-image: url("");
        }
        #loginwindow{

        }
    </style>
</head>
<body>
<c:if test="${not empty msg}">
    <p>${msg}</p>
</c:if>
<div id="loginwindow">
    <form method="post" id="form" action="login_check">
        <input type="text" placeholder="Username" id="username" name="username">
        <input type="password" placeholder="password" id="password" name="password">
        <input type="submit" value="登录">
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous">
</script>
</body>
</html>
