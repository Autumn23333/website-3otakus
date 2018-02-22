<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-han">
<head>
    <meta charset="UTF-8">
    <title>动画 - 3otakus</title>
    <base href="/image/webpage/">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <script
            src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous">
    </script>
<<<<<<< HEAD
=======
    <script src="/js/anime.js"></script>
>>>>>>> 8d712d304ca0f55b4b186ba23e9152661ef017bc

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>

    <link rel="stylesheet" href="/font/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="/css/base.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <style type="text/css">
        body {
            background: url(bg1.png) repeat center -600px;
            margin: 0px;
            font-family: Roboto, STKaiti, sans-serif;
            /*overflow-x: hidden;*/
            min-width: 1060px;
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

        .col {
            width: 980px;
            margin: 0 auto;
            text-align: center;
        }

        .ele {
            width: 380px;
            float: left;
            display: inline-block;
            position: relative;
            margin: 0 10px;
        }

        .ele .videoimg {
            display: block;
            position: relative;
        }

        .ele .videoimg:before, .ele .videoimg:after {
            pointer-events: none;
            position: absolute;
        }

        .ele .videoimg:before {
            background: #fd709f;
            content: "";
            width: 100%;
            height: 100%;
            opacity: 0.3;
            filter: alpha(opacity=50);
            top: 0;
            left: 0;
            z-index: 1;
        }

        .ele .videoimg:after {
            background: url(playicon.png) no-repeat 0 0;
            content: "";
            width: 100px;
            height: 100px;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: 2;
            margin: auto;

        }

        .cover {
            width: 380px;
            height: 214px;
        }

        .des {
            text-align: center;
            margin: 5px 0;
        }

        #right {
            position: absolute;
            right:0;
            /*overflow: hidden;*/
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
            /*margin-top: 10px;*/
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
    <div id="title">Anime</div>
    <div id="userinfo_wrapper">
        <div id="userinfo" class="float-right">
            <img src="duck.jpg" height="60" id="avatar">
            <span class="user-oper">个人中心</span>
            <span class="user-oper">收藏夹</span>
            <span class="user-oper">登出</span>
        </div>
        <div class="clear-float"></div>
    </div>
</div>
<div class="clear-float"></div>
<div id="mid">
    <div class="title">
        Anime / 动画
    </div>

    <div class="col clear-float" id="video_list">

    </div>
    <div class="clear-float"></div>
</div>
<script>
    (function ($) {
        $.fn.appendVideo = function (data) {
            var itemHTML =
                '<div class="ele">' +
                '<a href="/vplay?oid='+ data["oid"]+ '&pid=1" class="videoimg">'+
                '<img src="'+ data["cover"] +'" class="cover">'+
                '</a>' +
                '<a href="/vplay?oid='+ data["oid"] +'&pid=1">'+
                '<div class="des">'+data["title"]+'</div>'+
                '</a>' +
                '</div>';
            $("#video_list").append(itemHTML);

        };
    })(jQuery);

    var initialParam = '${vlist}';
    $(function() {
        parseVList(JSON.parse(initialParam));

    });

    function parseVList(vlistObj) {
        if (vlistObj["code"] < 0) {
            $("#video_list").html("什么都没找到");
        } else {
            for (var i=0; i<vlistObj["data"].length; i++)
                $("#video_list").appendVideo(vlistObj["data"][i]);
        }
    }

</script>
<script>
    var timeout;
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

    function getUA(){

        var ua = window.navigator.userAgent.toLowerCase();
        var ver = window.navigator.appVersion.toLowerCase();
        var name = 'unknown';

        if (ua.indexOf("msie") != -1){
            if (ver.indexOf("msie 6.") != -1){
                name = 'ie6';
            }else if (ver.indexOf("msie 7.") != -1){
                name = 'ie7';
            }else if (ver.indexOf("msie 8.") != -1){
                name = 'ie8';
            }else if (ver.indexOf("msie 9.") != -1){
                name = 'ie9';
            }else if (ver.indexOf("msie 10.") != -1){
                name = 'ie10';
            }else{
                name = 'ie';
            }
        }else if(ua.indexOf('trident/7') != -1){
            name = 'ie11';
        }else if (ua.indexOf('chrome') != -1){
            name = 'chrome';
        }else if (ua.indexOf('safari') != -1){
            name = 'safari';
        }else if (ua.indexOf('opera') != -1){
            name = 'opera';
        }else if (ua.indexOf('firefox') != -1){
            name = 'firefox';
        };

        $("body").addClass(name);

        if(ua.indexOf("android") != -1){
            $("body").addClass("Android");
        };

        return (function(u){

            var _is_ie = (u.indexOf('trident/7') > -1) || (u.indexOf('msie') > -1) && (u.indexOf('opera') == -1);

            return {
                Tablet:(u.indexOf("windows") != -1 && u.indexOf("touch") != -1)
                || u.indexOf("ipad") != -1
                || (u.indexOf("android") != -1 && u.indexOf("mobile") == -1)
                || (u.indexOf("firefox") != -1 && u.indexOf("tablet") != -1)
                || u.indexOf("kindle") != -1
                || u.indexOf("silk") != -1
                || u.indexOf("playbook") != -1,
                Mobile:(u.indexOf("windows") != -1 && u.indexOf("phone") != -1)
                || u.indexOf("iphone") != -1
                || u.indexOf("ipod") != -1
                || (u.indexOf("android") != -1 && u.indexOf("mobile") != -1)
                || (u.indexOf("firefox") != -1 && u.indexOf("mobile") != -1)
                || u.indexOf("blackberry") != -1,
                Android: (u.indexOf("android") != -1),
                iOS:(u.indexOf("iphone") != -1)
                || u.indexOf("ipod") != -1
                || u.indexOf("ipad") != -1,
                IE: _is_ie,
                IE_VERSION: ( !_is_ie )? -1 : parseInt( u.match(/((msie|MSIE)\s|rv:)([\d\.]+)/)[3] ),
                Chrome: (u.indexOf('chrome') > -1) && (u.indexOf('edge') == -1),
                Firefox: (u.indexOf('firefox') > -1),
                Safari: (u.indexOf('safari') > -1) && (u.indexOf('chrome') == -1),
                Opera: (u.indexOf('opera') > -1),
                Edge: (u.indexOf('edge') > -1)
            }
        })(ua);

    }
</script>
</body>
</html>
