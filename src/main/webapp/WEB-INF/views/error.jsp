<%--
  Created by IntelliJ IDEA.
  User: lichenghong
  Date: 2/18/18
  Time: 8:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>出错了 - 3otakus</title>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="/font/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="/css/base.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <base href="/image/webpage/">
    <style type="text/css">
        body {
            background: url(bg1.png) repeat center -600px;
            margin: 0px;
            font-family: Roboto, STKaiti, sans-serif;
            /*overflow-x: hidden;*/
            min-width: 1060px;
        }
        #right {
            position: absolute;
            right:0;
            /*overflow: hidden;*/
        }
        #mid {
            width: 980px;
            margin: 0 auto;
            padding-left: 180px;
            position: relative;
            top: 220px;
        }

        @media screen and (max-width: 1160px) {
            #mid {
                width: 980px;
                margin-left: 160px;
                padding-left: 100px;
            }
        }

        @media screen and (max-width: 1060px) {
            #mid {
                width: 980px;
                margin-left: 160px;
                padding-left: 100px;
            }
        }

        .title {
            font-size: 25px;
            letter-spacing: 2px;
            text-align: center;
            margin: 20px;
            color: #606060;
        }
        #title {
            position: relative;
            top: -40px;
            right: 16px;
            z-index: -10;
            color: #dde0e4;
            font-size: 151px;
            font-weight: 100;
            letter-spacing: -0.5px;
            -webkit-transform: skewX(-10deg);
            -ms-transform: skewX(-10deg);
            transform: skewX(-10deg);
            font-family: sans-serif;
            height: 180px;
        }

    </style>
</head>
<body>
<div id="left">
    <div id="logo">
        <a href="/"><img src="3otakus.png" width="300px"></a>
    </div>
    <div id="news">
        <a href="/hatuyuki/">
            <img src="news.png">
        </a>
    </div>
    <div id="menu">
        <img src="menuicon.png">
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
            <a href="/hatuyuki">
                <i class="fa fa-desktop word-icon" aria-hidden="true"></i> Galgame online
            </a>
        </div>
    </div>
</div>
<div id="right">
    <div id="title">Error</div>
</div>
<div class="clear-float"></div>
<div id="mid">
    <div class="title">
        ${err}
    </div>

    <div class="col clear-float" id="video_list">

    </div>
    <div class="clear-float"></div>
</div>

</body>
</html>
