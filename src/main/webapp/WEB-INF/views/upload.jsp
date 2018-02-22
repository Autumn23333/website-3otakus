<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lichenghong
  Date: 2/12/18
  Time: 11:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="zh-han">
    <meta charset="UTF-8">
    <title>上传 - 3otakus</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <script
            src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous">
    </script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="shortcut icon" href="../static/favicon.ico" type="image/x-icon"/>
    <style type="text/css">
        body {
            margin: 5px 10%;
        }

        .icon-margin {
            margin-right: 5px;
        }
    </style>
</head>
<body>
<c:if test="${not empty error}">
    <p>${error}</p>
</c:if>

<c:if test="${not empty msg}">
    <p>${msg}</p>
</c:if>

<c:if test="${not empty username}">
    <h1>上传视频</h1>
    <p>用户名：${username}</p>
    <form id="uploadForm" enctype="multipart/form-data" method="post" action="/upload_video">

        <ul id="myTab" class="nav nav-tabs">
            <li class="active">
                <a href="#normal" data-toggle="tab" id="tab1">
                    上传并建立新的视频
                </a>
            </li>
            <li><a href="#addpart" data-toggle="tab" id="tab2">为现有视频添加新的部分</a></li>
        </ul>
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade in active" id="normal">
                <!-- Video -->
                <div class="form-group">
                    <div class="row">
                        <div class="col-xs-10 col-sm-6 col-md-4 col-lg-3">
                            <input type="file" id="video1" style="position:absolute;clip:rect(0 0 0 0);" name="video">

                            <label class="btn btn-info btn-block" id="upload_btn1" for="video1">
                                <span class="glyphicon glyphicon-cloud-upload icon-margin"></span>选择视频(必需)
                            </label>

                        </div>
                        <div class="col-xs-4 col-sm-6 col-md-4 col-lg-3">
                            <span id="video_name1"></span>
                        </div>
                    </div>
                </div>

                <!-- Title -->
                <div class="form-group">
                    <label for="title">视频标题，必填</label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="视频标题，不超过200个字符">
                </div>

                <!-- Author -->
                <div class="form-group">
                    <label for="author">上传者</label>
                    <input type="text" class="form-control" value="${username}" disabled>
                    <input type="hidden" class="form-control" id="author" name="author" value="${username}">
                </div>

                <!-- Description -->
                <div class="form-group">
                    <label for="desciption">视频简介，选填</label>
                    <textarea class="form-control" rows="3" id="desciption" name="description"
                              placeholder="视频简介，不超过200字符"></textarea>
                </div>

                <!-- Part Title -->
                <div class="form-group">
                    <label for="title">小标题，选填；主要用在一个视频有多个部分的情况</label>
                    <input type="text" class="form-control" id="ptitle1" name="ptitle1" placeholder="小标题不超过20个字符">
                </div>

                <!-- Cover -->
                <div class="form-group">
                    <div class="row">
                        <div class="col-xs-8 col-sm-6 col-md-4 col-lg-3">
                            <input type="file" id="cover" style="position:absolute;clip:rect(0 0 0 0);" name="cover">

                            <label class="btn btn-info btn-block" id="cover_btn" for="cover">
                                <span class="glyphicon glyphicon-cloud-upload icon-margin"></span>选择封面图片(必需)
                            </label>

                        </div>
                        <div class="col-xs-4 col-sm-6 col-md-4 col-lg-3">
                            <span id="cover_name"></span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="tab-pane fade" id="addpart">
                <!-- Video -->
                <div class="form-group">
                    <div class="row">
                        <div class="col-xs-10 col-sm-6 col-md-4 col-lg-3">
                            <input type="file" id="video2" style="position:absolute;clip:rect(0 0 0 0);" name="video">

                            <label class="btn btn-info btn-block" id="upload_btn2" for="video2">
                                <span class="glyphicon glyphicon-cloud-upload icon-margin"></span>选择视频(必需)
                            </label>

                        </div>
                        <div class="col-xs-4 col-sm-6 col-md-4 col-lg-3">
                            <span id="video_name2"></span>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="vlist">请选择要添加到的视频</label>
                    <select class="form-control" id="vlist" name="partvideo">
                        <option selected>未选择</option>
                        <c:forEach items="${vlist}" var="v">
                            <option>${v.oid} - ${v.title} - ${v.ctime}</option>
                        </c:forEach>
                    </select>
                </div>
                <!-- Part Title -->
                <div class="form-group">
                    <label for="title">小标题，选填；主要用在一个视频有多个部分的情况</label>
                    <input type="text" class="form-control" id="ptitle2" name="ptitle2" placeholder="小标题不超过20个字符">
                </div>
            </div>

        </div>
        <input type="submit" value="提交">
        <!-- This is used to indicate type of operation -->
        <input type="hidden" id="type" name="type" value="1">
    </form>

    <script>
        $(document).ready(function (ev) {
            $("#cover").change(function (ev) {
                var fakepath = $("#cover").val();
                $("#cover_name").html(fakepath.substring(fakepath.lastIndexOf("\\") + 1));
            });

            $("#video1").change(function (ev) {
                var fakepath = $("#video1").val();
                $("#video_name1").html(fakepath.substring(fakepath.lastIndexOf("\\") + 1));
            });

            $("#video2").change(function (ev) {
                var fakepath = $("#video2").val();
                $("#video_name2").html(fakepath.substring(fakepath.lastIndexOf("\\") + 1));
            });

            $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
                if ($(e.target).text() === $("#tab1").text()) {
                    // Normal upload
                    $("#type").val("1");
                    $("#video2").attr("disabled", "disabled");
                    $("#video1").removeAttr("disabled");
                } else if ($(e.target).text() === $("#tab2").text()) {
                    // Add new part
                    $("#type").val("2");
                    $("#video1").attr("disabled", "disabled");
                    $("#video2").removeAttr("disabled");
                } else {
                    // Strange case
                    $("#type").val("1");
                    $("#video2").attr("disabled", "disabled");
                    $("#video1").removeAttr("disabled");
                }

            })
        });
    </script>
</c:if>


</body>
</html>
