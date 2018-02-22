<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-han">
<head>
    <meta charset="UTF-8">
    <!-- Page Setting-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="description" content="北美ACG爱好者俱乐部">
    <meta name="keywords" content="ACG 北美 华人 社区 番剧 初雪樱 Galgame cnm">
    <meta name="author" content="3otakus">
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width,user-scalable=yes">
    <meta name="mobile-web-app-capable" content="yes">
    <title>3otakus</title>
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

    <link rel="stylesheet" href="/font/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="/css/base.css">
    <link rel="stylesheet" href="">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">

    <style type="text/css">

        #mid {
            width: 1000px;
            margin: 0 auto;
            padding-top: 35px;
        }

        #waifu {
            margin: 0 auto;
            width: 600px;
        }

        #right {
            width: 350px;
            float: right;
            position: absolute;
            top: 8px;
            right: 0
        }

        #userinfo {
            width: 280px;
            height: 70px;
            padding: 5px;
            background: hsla(199, 98%, 98%, 0.5);

            border-top-left-radius: 3px;
            border-bottom-left-radius: 3px;
            right: -200px;
            position: relative;
            font-size: 15px;
        }

        #userinfo_wrapper {
            overflow: hidden;
            width: 80px;
            height: 70px;
            margin-top: 10px;
            margin-bottom: 20px;
            float: right;
        }

        #avatar {
            border-radius: 50%;
            border: lightgray 2px solid;
        }

        .user-oper {
            margin: 0 10px;
            color: #e62867;
        }

        .float-right {
            float: right;
        }

        .clear-float {
            clear: both;
        }

        #topics {
            position: absolute;
            right: 0;
            top: 250px;
            z-index: 5;
        }

        #rightann {

            width: 270px;
            height: 492px;
            position: absolute;
            right: 0;
            top: 290px;
            background-image: url(${pageContext.request.contextPath}/image/webpage/rightann.png);

        }

        #rightann1 {
            margin: 15px 20px 25px 20px;
            color: red;
        }

        #rightann2 {
            margin: 20px;
            color: red;
        }

        #change {
            margin: 0 auto;
            width: 200px;
        }

        #click {
            font-size: 15px;
            padding: 10px 20px;
        }

        #footer {
            margin-top: 25px;
            padding: 25px 0;
            text-align: center;
            background: #eee;
        }


    </style>
</head>
<body>
<div id="left">
    <div id="logo">
        <img src="/image/webpage/3otakus.png" width="300px">
    </div>
    <div id="news">
        <a href="http://3otakus.club:8000/hatuyuki">
            <img src="/image/webpage/news.png">
        </a>
    </div>
    <div id="menu">
        <img src="/image/webpage/menuicon.png">
    </div>
    <div id="menubook">
        <!--<img src="menulist.png">-->
        <div class="menuitem" style="margin-top: 24px">
            <a href="anime">
                <span class="glyphicon glyphicon-play-circle word-icon"></span> 动画 / Anime
            </a>
        </div>
        <div class="menuitem">
            <span class="glyphicon glyphicon-pencil word-icon"></span> 漫画 / Comic
        </div>
        <div class="menuitem">
            <i class="fa fa-gamepad word-icon" aria-hidden="true"></i> 游戏 / Game
        </div>
        <div class="menuitem">
            <span class="glyphicon glyphicon-book word-icon"></span> 轻小说/Novel
        </div>
        <div class="menuitem">
            <i class="fa fa-music word-icon" aria-hidden="true"></i> 音乐 / Music
        </div>
        <div class="menuitem">
            <span class="glyphicon glyphicon-picture word-icon"></span> 图片 / Picture
        </div>
        <div class="menuitem">
            <a href="http://3otakus.club:8000/hatuyuki">
                <i class="fa fa-desktop word-icon" aria-hidden="true"></i> Galgame online
            </a>
        </div>
    </div>
</div>
<div id="mid">
    <div id="waifu">
        <img src="/image/webpage/eriri.png" width="600px">
    </div>
</div>
<div id="right">
    <div id="userinfo_wrapper">
        <div id="userinfo" class="float-right">
            <img src="/image/webpage/duck.jpg" height="60" id="avatar">
            <span class="user-oper">个人中心</span>
            <span class="user-oper">收藏夹</span>
            <span class="user-oper">登出</span>
        </div>
        <div class="clear-float"></div>
    </div>
    <div class="clear-float"></div>
    <div id="rightnews" class="float-right">
        <img src="/image/webpage/rightnews.png">
    </div>
    <div id="topics">
        <img src="/image/webpage/topics.png">
    </div>
    <div id="rightann">
        <div id="rightann1">
            <div class="rightdate">
                <strong>2018/01/19</strong>
            </div>
            <div class="rightcontent">
                <div class="righttitle">
                    3otakus.club is built up today!
                </div>
                <div class="rightimg">
                    <img src="/image/webpage/right1.jpg" width="230px">
                </div>
            </div>
            <div class="divideline">
                <img src="/image/webpage/divideline.png">
            </div>
        </div>
        <div id="rightann2">
            <div class="rightdate">
                <strong>2018/01/19</strong>
            </div>
            <div class="rightcontent">
                <div class="righttitle">
                    3otakus.club is built up today!
                </div>
                <div class="rightimg">
                    <img src="/image/webpage/neko1.jpg" width="230px">
                </div>
            </div>
            <div class="divideline">
                <img src="/image/webpage/divideline.png">
            </div>
        </div>
    </div>
</div>
<div class="clear-float"></div>
<div id="change">
    <button id="click">
        一键换老婆！
    </button>
</div>
<footer id="footer">
    <p>
        <small>常用链接: <a href="/login">login</a> | <a href="/signup">signup</a>
            | <a href="/logout">logout</a> | <a href="/upload">upload</a></small>
    </p>
    <p>
        <small>3otakus.club, 2018</small>
    </p>
</footer>
<script type="text/javascript">
    var waifu = [{
        "bg": "/image/webpage/green.jpg",
        "figure": "/image/webpage/eriri.png"
    }, {"bg": "/image/webpage/pink.jpg",
        "figure": "/image/webpage/megumi.png"}];
    var waifu_idx = 0;
    var timeout;
    $("#click").click(function (event) {
        waifu_idx = (++waifu_idx) % waifu.length;
        $("body").css("background-image", "url(" + waifu[waifu_idx].bg + ")");
        $("#waifu>img").attr("src", waifu[waifu_idx].figure);
        scrollTo(0, 0);
    });

    $(document).ready(function () {
        $("#userinfo").hover(function (ev) {
            clearTimeout(timeout);
            timeout = setTimeout(function () {
                $("#userinfo").animate({right: 0});
                $("#userinfo_wrapper").animate({width: "280px"});
            }, 100);
        }, function () {
            clearTimeout(timeout);
            timeout = setTimeout(function () {
                $("#userinfo").animate({right: "-200px"});
                $("#userinfo_wrapper").animate({width: "80px"});
            }, 50);
        });

    });
</script>
</body>
</html>