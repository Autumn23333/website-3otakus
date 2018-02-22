<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Video Player</title>
    <style>
        #mid {
            width: 1000px;
            margin: 0 auto;
        }
    </style>
</head>

<body>
<div id="left"></div>
<div id="mid">
    <video width="572px" height="860px" controls>
        <source src="${vaddr}" type="video/mp4">
    </video>
    <p>${title} <c:if test="${not empty ptitle}"> - ${ptitle}</c:if></p>
</div>
<div id="right"></div>
</body>
</html>
