<%--
  Created by IntelliJ IDEA.
  User: lichenghong
  Date: 2/11/18
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh-han">
<head>
    <title>注册 - 3otakus</title>
    <meta charset="UTF-8">
</head>
<body>
<p></p>
<c:if test="${not empty msg}">
    <p>注册失败，请重试</p>
</c:if>
<form method="post" id="form" action="submitsignup">
    <input type="text" placeholder="Username" id="username" name="username">
    <input type="password" placeholder="Password" id="password" name="password">
    <input type="submit" value="注册">
</form>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous">
</script>

</body>
</html>
