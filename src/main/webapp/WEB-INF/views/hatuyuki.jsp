<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="zh-han">
<head>
    <meta charset="UTF-8">
    <title>はつゆきさくら　テストぺジー</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script
            src="https://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous">
    </script>
    <script src="/js/hatuyuki/snowfall.jquery.js"></script>
    <script src="/js/hatuyuki/base64.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <style rel="stylesheet" type="text/css">
        body {
            padding: 0;
            margin: 0;
        }

        .not-show {
            display: none;
        }

        #main {
            width: 1280px;
            height: 720px;
            margin: 0 auto;
            font-family: "Lucinda Grande", "Lucinda Sans Unicode", Helvetica, Arial, Verdana, sans-serif;
        }

        #background {
            position: absolute;
            z-index: 1;
        }

        #background_cover {
            position: absolute;
            z-index: 2;
            display: none;
            background-color: rgba(255, 255, 255, 1);
        }

        #text_background {
            position: relative;
            top: 507px;
            z-index: 4;
            width: 1280px;
        }

        #speaker_div {
            position: relative;
            /*width:50px;
            height:20px;
            background-color: #999999;*/
            z-index: 5;
            top: 300px;
            margin: 0 150px;

        }

        #speaker {
            color: ghostwhite;
            height: 20px;
            font-weight: normal;
        }

        #text_div {
            position: relative;
            top: 300px;
            padding: 0 200px;
            z-index: 6;
        }

        #text {
            color: ghostwhite;
            font-size: 1.2em;
            font-weight: normal;
        }

        #op_div {
            display: none;
            width: 1280px;
            margin: 0 auto;
        }

        .person {
            position: absolute;
            z-index: 2;
            top: 0px;
            left: 400px;
            margin: 0 auto;
        }

        .face {
            position: absolute;
            z-index: 3;
            top: 0px;
            left: 400px;
        }

        #person_wraper {
            display: block;
        }

        #title {
            width: 1280px;
            margin: 0 auto;
        }

        #menu {
            width: 1280px;
            height: 720px;
            margin: 0 auto;
        }

        #menu_prologue {
            position: absolute;
            top: 640px;
            left: 0;
        }

        #save {
            background: url("/image/hatuyuki/_save/_SAVE_BASE_NAKA.png") no-repeat center;
            opacity: 0.9;
            width: 1280px;
            height: 720px;
            position: relative;
        }

        .save-header {
            opacity: 1;
            position: absolute;
            top: 40px;
        }

        .save-footer {
            opacity: 1;
            display: block;
            position: absolute;
            bottom: 18px;
        }

        #save1 {
            position: relative;

        }

        .save-bar {
            position: relative;
            top: 120px;
            left: 50px;
            width: 570px;
            height: 100px;
            background-color: skyblue;
            margin: 10px 10px;
            float: left;
            border: skyblue 2px solid;
            border-radius: 2px;
        }

        .save-bar:hover {
            background-color: #7ffff0;
        }

        .save-bar img {
            position: relative;
            margin: 5px 10px;
            width: 160px;
            height: 90px;
            float: left;
        }

        .save-bar p {
            color: #175ce6;
            margin: 0px;
            width: 360px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .save-bar input {
            width: 350px;
            border: 0 transparent solid;
            font-size: 14px;
        }

        .clear-float {
            clear: both;
        }
    </style>
</head>
<body>
<div id="main" class="not-show">
    <div id="background">
        <img src="" width="'1280px">
    </div>
    <div id="background_cover"></div>

    <div id="person_wraper">
        <div>
            <img id="person1" class="person" src="" height="720px">
            <img id="face1" class="face" src="" height="720px">
        </div>
        <div>
            <img id="person2" class="person" src="" height="720px">
            <img id="face2" class="face" src="" height="720px">
        </div>

        <div>
            <img id="person3" class="person" src="" height="720px">
            <img id="face3" class="face" src="" height="720px">
        </div>

        <div>
            <img id="person4" class="person" src="" height="720px">
            <img id="face4" class="face" src="" height="720px">
        </div>

        <div>
            <img id="person5" class="person" src="" height="720px">
            <img id="face5" class="face" src="" height="720px">
        </div>

    </div>
    <div id="text_wrapper">
        <div id="text_background">
            <img src="" width="1280px">
        </div>
        <div id="speaker_div">
            <h3 id="speaker"></h3>
        </div>
        <div id="text_div">
            <h3 id="text"></h3>
        </div>
    </div>
</div>
<!-- Loading OP if necessary -->
<div id="op_div">
    <video id="op" width="1280" autoplay>
        <source src="" type="video/mp4">
        您的浏览器不支持Video标签。
    </video>
</div>

<!-- Loading menu if necessary -->
<div id="menu">
    <div id="menu_bg">
        <img src="/image/hatuyuki/title/0002.png" width="1280px">
    </div>
    <div id="menu_prologue" class="not-show">
        <img src="/image/hatuyuki/_menu_btn_pr/0000.png" width="">
    </div>
</div>

<!-- Loading Load page if necessary -->
<div id="save" class="not-show">
    <img class="save-header" src="/image/hatuyuki/_save/_SAVE_BASE_UE.png">
    <div id="save1" class="save-bar">
        <div>
            <img id="save1_img" class="save-bar-img" src="">
            <div class="save-bar-word">
                <p id="save1_title" style="font-size: 18px;"></p>
                <p id="save1_content"></p>
                <input id="save1_desc" class="save-desc" value="">
                <p id="save1_date"></p>
            </div>
        </div>
    </div>
    <div id="save5" class="save-bar">
        <div>
            <img id="save5_img" class="save-bar-img" src="">
            <div class="save-bar-word">
                <p id="save5_title" style="font-size: 18px;"></p>
                <p id="save5_content"></p>
                <input id="save5_desc" class="save-desc" value="">
                <p id="save5_date"></p>
            </div>
        </div>
    </div>

    <div id="save2" class="save-bar clear-float">
        <div>
            <img id="save2_img" class="save-bar-img" src="">
            <div class="save-bar-word">
                <p id="save2_title" style="font-size: 18px;"></p>
                <p id="save2_content"></p>
                <input id="save2_desc" class="save-desc" value="">
                <p id="save2_date"></p>
            </div>
        </div>
    </div>
    <div id="save6" class="save-bar">
        <div>
            <img id="save6_img" class="save-bar-img" src="">
            <div class="save-bar-word">
                <p id="save6_title" style="font-size: 18px;"></p>
                <p id="save6_content"></p>
                <input id="save6_desc" class="save-desc" value="">
                <p id="save6_date"></p>
            </div>
        </div>
    </div>
    <div id="save3" class="save-bar clear-float">
        <div>
            <img id="save3_img" class="save-bar-img" src="">
            <div class="save-bar-word">
                <p id="save3_title" style="font-size: 18px;"></p>
                <p id="save3_content"></p>
                <input id="save3_desc" class="save-desc" value="">
                <p id="save3_date"></p>
            </div>
        </div>
    </div>
    <div id="save7" class="save-bar">
        <div>
            <img id="save7_img" class="save-bar-img" src="">
            <div class="save-bar-word">
                <p id="save7_title" style="font-size: 18px;"></p>
                <p id="save7_content"></p>
                <input id="save7_desc" class="save-desc" value="">
                <p id="save7_date"></p>
            </div>
        </div>
    </div>
    <div id="save4" class="save-bar clear-float">
        <div>
            <img id="save4_img" class="save-bar-img" src="">
            <div class="save-bar-word">
                <p id="save4_title" style="font-size: 18px;"></p>
                <p id="save4_content"></p>
                <input id="save4_desc" class="save-desc" value="">
                <p id="save4_date"></p>
            </div>
        </div>
    </div>
    <div id="save8" class="save-bar">
        <div>
            <img id="save8_img" class="save-bar-img" src="">
            <div class="save-bar-word">
                <p id="save8_title" style="font-size: 18px;"></p>
                <p id="save8_content"></p>
                <input id="save8_desc" class="save-desc" value="">
                <p id="save8_date"></p>
            </div>
        </div>
    </div>

    <img class="save-footer" src="/image/hatuyuki/_save/_SAVE_BASE_SITA.png">
</div>

<div id="title">
    <p></p>
</div>
自动播放<input type="checkbox" id="autoplay" checked>

<div id="pretext" style="display: none"></div>
<!-- Loading bgm and voice if necessary -->
<div>
    <audio id="bgm" autoplay loop>
        <source src="" type="audio/mpeg">
        您的浏览器不支持 audio 元素。
    </audio>
    <audio id="voice" autoplay>
        <source src="" type="audio/mpeg">
        您的浏览器不支持 audio 元素。
    </audio>
    <audio id="se1" autoplay>
        <source src="" type="audio/mpeg">
        您的浏览器不支持 audio 元素。
    </audio>
    <audio id="se2" autoplay>
        <source src="" type="audio/mpeg">
        您的浏览器不支持 audio 元素。
    </audio>
</div>

<div id="help_message" title="使用说明">
    <p>操作说明</p>
    <ul>
        <li>切换下一场景：鼠标左键单击/屏幕点击一下(触屏)</li>
        <li>快进场景：鼠标左键长按/屏幕长按(触屏)</li>
    </ul>
    <p>应用仍在开发中，现有内容为初雪樱序章中的第一章</p>
</div>
</body>
<script>
    var img_pathbase = "/image/hatuyuki/";
    var voice_pathbase = "/voice/hatuyuki/";
    var bgm_pathbase = "/bgm/hatuyuki/";
    var text_bkgd = img_pathbase + "_sys_winwaku_bk.png";
    var frame = ${ frame };
    var section = "${ section }";
    var type_idx = 0;
    // var t = unescapeHTML('${ data }');
    var data = null;//JSON.parse(t.slice(1, -1));
    var position_id_table = {"31": "1", "21": "2", "32": "3", "11": "3", "22": "4", "33": "5"};
    var position_offsetx_table = {"31": 340, "21": 440, "32": 640, "11": 640, "22": 840, "33": 940};
    var main_width = 1280;
    var last_frame = 2;
    var bgm = "";
    var episode = null;//data["episode"];
    var animation_type = undefined;
    var last_time = Date.now();
    var save_input_lock = false;
    var settings = {"auto": true};
    var auto_timeout = undefined;

    $(document).ready(onReady);
    $(window).resize(calcFigureSize);

    function onReady() {
        setInterval(type, 50);
        menuSetup();
        for (var i = 1; i <= 8; i++)
            displayProgress("save" + i);

        $(".save-bar").click(function (ev) {
            console.log(ev);
            if (ev.target.className !== "save-desc" && !save_input_lock)
                saveProgress(this.id);
        });

        $(".save-desc").change(function (ev) {
            var id = this.id.substring(0, 5);//save1~save8
            var progress64 = getCookie(id);

            if (progress64 !== "") {
                save_input_lock = true;
                var progress_json = Base64.decode(progress64);
                var progress = JSON.parse(progress_json);
                progress.desc = this.value;
                progress_json = JSON.stringify(progress);
                progress64 = Base64.encode(progress_json);
                setCookie(id, progress64);
            }
            setTimeout(function () {
                save_input_lock = false;
            }, 1000);

        });

        $("#help_message").dialog({
            modal: true,
            buttons: {
                Ok: function () {
                    $(this).dialog("close");
                }
            },
            open: function (event, ui) {
                document.getElementById("bgm").volume = 0.2;
            },
            close: function (event, ui) {
                document.getElementById("bgm").volume = 0.6;
            }
        });

        $("#autoplay").click(function () {
            console.log(this.checked);
            if (this.checked) {
                settings.auto = true;
                mainOnClick();
            } else {
                settings.auto = false;
                if (auto_timeout !== undefined) {
                    clearTimeout(auto_timeout);
                    auto_timeout = undefined;
                }
            }
        });
    }

    function menuSetup() {
        $("#title>p").html("はつゆきさくら(初雪樱) v0.0.1 Menu");
        $("#menu_prologue").css('left', ($("body").width() / 2 - 61) + "px");
        $("#menu_prologue").removeClass("not-show");
        $("#menu_prologue").hover(
            function (ev) {
                $("#menu_prologue>img").attr("src", "/image/hatuyuki/_menu_btn_pr/0001.png");
                $("#se1>source").attr("src", bgm_pathbase + "_SE_SELECT.mp3");
                try {
                    if (Date.now() - last_time >= 100) {
                        document.getElementById("se1").load();
                        // document.getElementById("se1").play();
                        document.getElementById("se1").loop = false;
                        last_time = Date.now();
                    }
                } catch (err) {
                    console.log("Load audio error:" + err.message);
                }
            },
            function (ev) {
                $("#menu_prologue>img").attr("src", "/image/hatuyuki/_menu_btn_pr/0000.png");
                document.getElementById("se1").pause();
            }
        );
        $("#menu_prologue").click(function (ev) {
            $("#se1>source").attr("src", bgm_pathbase + "_SE_OK.mp3");
            try {
                if (Date.now() - last_time >= 100) {
                    document.getElementById("se1").load();
                    // document.getElementById("se1").play();
                    document.getElementById("se1").loop = false;
                    last_time = Date.now();
                }
            } catch (err) {
                console.log("Load audio error:" + err.message);
            }


            $("#menu").fadeOut(500, function () {
                $("#main").fadeIn(500);

            });
            document.getElementById("bgm").pause();
            $("#menu").snowfall("clear");
            // getData(0);
            getGameData(section);

            frame = ${ frame } -1;


        });
        sakura("#menu");
        $("#bgm>source").attr("src", bgm_pathbase + "BGM99.mp3");

        document.getElementById("bgm").load();
        /*setInterval(function () {
            document.getElementById("bgm").play();
        }, 100);*/
        document.getElementById("bgm").loop = true;
        document.getElementById("bgm").volume = 0.6;
        bgm = bgm_pathbase + "BGM99.mp3";

    }

    function calcFigureSize(ev) {
        var scr_width = parseInt($("body").css("width"));
        var margin_left = (scr_width - main_width) / 2;
        $("#menu_prologue").css('left', (scr_width / 2 - 61) + "px");

        /*$("#person1").css("left", (20 + margin_left) + "px");
        $("#person2").css("left", (120 + margin_left) + "px");
        $("#person3").css("left", (330 + margin_left) + "px");
        $("#person4").css("left", (660 + margin_left) + "px");
        $("#person5").css("left", (660 + margin_left) + "px");
        $("#face1").css("left", (20 + margin_left) + "px");
        $("#face2").css("left", (120 + margin_left) + "px");
        $("#face3").css("left", (330 + margin_left) + "px");
        $("#face4").css("left", (660 + margin_left) + "px");
        $("#face5").css("left", (660 + margin_left) + "px");*/
        var f = ["31", "21", "32", "22", "33"];
        for (var i = 1; i <= 5; i++) {
            var base_pos = position_offsetx_table[f[i - 1]];
            var img_obj = new Image();
            img_obj.src = $("#person" + i).attr("src");
            var nwidth = img_obj.width / img_obj.height * 720;
            $("#person" + i).css("left", (base_pos - nwidth / 2 + margin_left) + "px");
            $("#face" + i).css("left", (base_pos - nwidth / 2 + margin_left) + "px");
        }

    }


    function load_frame(ev) {
        if (frame + 1 < last_frame) {
            if (episode[frame].speaker === null)
                $('#pretext').text(episode[frame].content);
            else
                $('#pretext').text("「" + episode[frame].content + "」");
            $("#speaker").text(episode[frame].speaker);
            displayText();
            $('#background>img').attr('src', img_pathbase + episode[frame].bg);
            $('#text_background>img').attr('src', text_bkgd);
            displayFigures(episode[frame].figures);
            $("#title>p").html(episode[frame].title);
            var timeout = 0;
            if (episode[frame].voice == null || tinterval != undefined) {
                $("#voice>source").attr("src", "");
                if (settings.auto) {
                    timeout = 0.05 * episode[frame].content.length + 1;
                    console.log(timeout);
                    auto_timeout = setTimeout(function () {
                        auto_timeout = undefined;
                        mainOnClick();
                    }, timeout * 1000);
                }
            }
            else {
                $("#voice>source").attr("src", voice_pathbase + episode[frame].voice);
                document.getElementById("voice").load();
                console.log(settings.auto);

                document.getElementById("voice").oncanplay = function (ev2) {
                    timeout = document.getElementById("voice").duration + 0.5;
                    if (settings.auto) {
                        console.log(timeout);
                        auto_timeout = setTimeout(function () {
                            auto_timeout = undefined;
                            mainOnClick();
                        }, timeout * 1000);
                    }
                };

                // document.getElementById("voice").play();
            }
            if (episode[frame].bgm == null) {
                $("#bgm>source").attr("src", "");
                document.getElementById("bgm").pause();
            } else if (episode[frame].bgm != bgm) {
                $("#bgm>source").attr("src", bgm_pathbase + episode[frame].bgm);
                document.getElementById("bgm").load();
                if (episode[frame].voice == null || tinterval != undefined)
                    document.getElementById("bgm").volume = 0.6;
                else
                    document.getElementById("bgm").volume = 0.5;
                /*setInterval(function () {
                    document.getElementById("bgm").play();
                }, 100);*/
                // document.getElementById("bgm").loop = true;
                bgm = episode[frame].bgm;
            }

        }
    }

    $("#main").click(function () {
        if (auto_timeout !== undefined) {
            clearTimeout(auto_timeout);
            auto_timeout = undefined;
        }
        // console.log(episode[frame].transitions);
        if (episode[frame].transitions === 1) {
            $('#background>img').fadeOut(500);
            $('#text-background>img').fadeOut(500);
            $('#person_wraper').fadeOut(500, function () {
                mainOnClick();
                $('#background>img').fadeIn(500);
                $('#text-background>img').fadeIn(500);
                $('#person_wraper').fadeIn(500);
            });
        }
        else {
            mainOnClick();
        }
    });

    function mainOnClick(ev) {
        if (frame + 1 < last_frame) {
            if (type_idx < $("#pretext").text().length) {
                type_idx = $("#pretext").text().length;
                return;
            }
            frame++;
            $("#text_wrapper").removeClass("not-show");
            $("#background_cover").css({"display": "none"});

            if (episode[frame].type === 1) {
                // OP
                //alert('loading op');
                document.getElementById("op").setAttribute('src', episode[frame].url);
                document.getElementById("op").load();
                $("#op_div").fadeIn();
                $("#main").fadeOut();
                $("#title>p").html(episode[frame].title);
                $("#bgm>source").attr("src", "");
                document.getElementById("bgm").load();
                // document.getElementById("op").play();
                document.getElementById("op").onended = function () {
                    //alert('op ended');
                    $("#op_div").fadeOut();
                    $("#main").fadeIn();
                    //frame++;
                    load_frame();
                    $("#main").click();
                };
                document.getElementById("op").onclick = function () {
                    video1 = document.getElementById("op");
                    video1.pause();
                    video1.controls = true;
                    video1.currentTime = 0;
                    $("#op_div").fadeOut();
                    $("#main").fadeIn();
                    //frame++;
                    load_frame();
                    $("#main").click()
                }
            }
            else if (episode[frame].type === 2) {
                // Menu
                $("#main").fadeOut(function () {
                    $("#menu").fadeIn();
                });
                menuSetup();
            }
            else if (episode[frame].type === 3) {
                // Initial bg of chapter, not show text editing
                $("#text_wrapper").addClass("not-show");
                $('#background>img').attr('src', img_pathbase + episode[frame].bg);
                displayFigures([]);
                setTimeout(function () {
                    // $("#text_wrapper").removeClass("not-show");
                    $("#main").click();
                }, 2000);

            }
            else if (episode[frame].type === 4) {
                // Transition, mostly for morning and dawn
                $("#text_wrapper").addClass("not-show");
                $('#background>img').attr('src', img_pathbase + episode[frame].bg);
                setTimeout(function () {
                    $("#background_cover").css({
                        "width": "0",
                        "height": "720px",
                        "display": "block"
                    })
                        .animate({"width": "1280px"},
                            1500, "linear",
                            function () {
                                $("#main").click();
                            });
                }, 1000);
            }

            else {
                load_frame();
            }

            if (episode[frame].animation !== null &&
                episode[frame].animation !== undefined) {
                if (episode[frame].animation.type !== 0 && animation_type === 0)
                    $('#main').snowfall('clear');
                if (!(episode[frame].animation.type & 0x1) &&
                    animation_type & 0x1)
                    $('#main').snowfall('clear');

                if (episode[frame].animation.type === 0 &&
                    (animation_type !== 0 || animation_type === undefined))
                    snowfall1("#main");

                if (episode[frame].animation.type & 0x1 && (!(animation_type & 0x1) || animation_type === undefined))
                    snowfall2("#main");

                if (!(episode[frame].animation.type & 0x2) &&
                    animation_type & 0x2) {
                    $("#person1").finish().css("top", 0);
                    $("#face1").finish().css("top", 0);
                    $("#person2").finish().css("top", 0);
                    $("#face2").finish().css("top", 0);
                    $("#person3").finish().css("top", 0);
                    $("#face3").finish().css("top", 0);
                    $("#person4").finish().css("top", 0);
                    $("#face4").finish().css("top", 0);
                    $("#person5").finish().css("top", 0);
                    $("#face5").finish().css("top", 0);

                }
                animation_type = episode[frame].animation.type;
            } else {
                if (animation_type === 0)
                    $('#main').snowfall('clear');
                else if (animation_type & 0x1) {
                    $('#main').snowfall('clear');
                }
                else if (animation_type & 0x2) {
                    $("#person1").finish().css("top", 0);
                    $("#face1").finish().css("top", 0);
                    $("#person2").finish().css("top", 0);
                    $("#face2").finish().css("top", 0);
                    $("#person3").finish().css("top", 0);
                    $("#face3").finish().css("top", 0);
                    $("#person4").finish().css("top", 0);
                    $("#face4").finish().css("top", 0);
                    $("#person5").finish().css("top", 0);
                    $("#face5").finish().css("top", 0);
                }
                animation_type = undefined;
            }
        }
        else {
            // alert("Finished!");
            if (data.next.menu === true) {
                $("#main").fadeOut(500, function () {
                    $("#menu").fadeIn(500);
                });
                menuSetup();
            }
        }

    }

    function displayText() {
        type_idx = 0;
//        setInterval(type, 50);
    }

    function type() {
        var text = $('#pretext').text();
        $('#text').text(text.substring(0, type_idx++));
    }

    function displayFigures(flist) {
        var l = flist.length;
        if (l === 0) {
            $(".person").css('display', 'none');
            $(".face").css('display', 'none');
        } else {
            $(".person").css('display', 'none');
            $(".face").css('display', 'none');
            for (var i = 0; i < l; i++) {
                var id = position_id_table[flist[i].position];
                var scr_width = parseInt($("body").css("width"));
                var margin_left = (scr_width - main_width) / 2;

                if (id === undefined)
                    id = "face3";
                // Calculate base position

                $("#person" + id).css('display', 'block');
                $("#face" + id).css('display', 'block');
                $("#person" + id).attr("src", img_pathbase + flist[i].base);
                $("#face" + id).attr("src", img_pathbase + flist[i].face);

                document.getElementById("person" + id).onload = calcFigureSize;

                // Calculate position plus offset if being specified
                if (flist[i].offset !== undefined && flist[i].offset !== null) {
                    var l = parseInt($("#face" + id).css('left'));
                    var t = parseInt($("#face" + id).css('top'));
                    $("#person" + id).css({
                        'left': (l + flist[i].offset[0]) + 'px',
                        'top': (t + flist[i].offset[1]) + 'px'
                    });
                    $("#face" + id).css({
                        'left': (l + flist[i].offset[0]) + 'px',
                        'top': (t + flist[i].offset[1]) + 'px'
                    });
                }
                if (flist[i].jump !== undefined && flist[i].jump === true &&
                    !(animation_type & 0x2)) {
                    function jumpup(id) {
                        $("#person" + id).animate({
                            'top': '-=50px'
                        }, 200);
                        $("#face" + id).animate({
                            'top': '-=50px'
                        }, 200, function () {
                            jumpdown(id);
                        });
                    }

                    function jumpdown(id) {
                        $("#person" + id).animate({
                            'top': '+=50px'
                        }, 200);
                        $("#face" + id).animate({
                            'top': '+=50px'
                        }, 200, function () {
                            jumpup(id);
                        });
                    }

                    jumpup(id);
                }

                if (flist[i].move !== undefined) {
                    var left = parseInt($("#person" + id).css("left"));
                    if (flist[i].move[0] === "r") {
                        $("#person" + id).animate({"left": "+=" + flist[i].move[1] + "px"}, flist[i].move[2], function () {
                            $("#person" + id).css({"left": left + "px", "display": "none"});
                        });
                        $("#face" + id).animate({"left": "+=" + flist[i].move[1] + "px"}, flist[i].move[2], function () {
                            $("#face" + id).css({"left": left + "px", "display": "none"});
                        });
                    }
                }

            }
        }
    }

    function sakura(ele) {
        $(ele).snowfall({
            image: "/image/hatuyuki/ele/sakura0.png",
            minSize: 8, maxSize: 16, flakeCount: 2, maxSpeed: 4, minSpeed: 3, type: 1
        });
        $(ele).snowfall({
            image: "/image/hatuyuki/ele/sakura1.png",
            minSize: 8, maxSize: 16, flakeCount: 2, maxSpeed: 4, minSpeed: 3, type: 1
        });
        $(ele).snowfall({
            image: "/image/hatuyuki/ele/sakura2.png",
            minSize: 8, maxSize: 16, flakeCount: 2, maxSpeed: 4, minSpeed: 3, type: 1
        });
        $(ele).snowfall({
            image: "/image/hatuyuki/ele/sakura3.png",
            minSize: 8, maxSize: 16, flakeCount: 2, maxSpeed: 4, minSpeed: 3, type: 1
        });

    }

    function snowfall1(ele) {
        $(ele).snowfall({
            round: true, shadow: true, flakeIndex: 2,
            minSize: 1, maxSize: 4, flakeCount: 10, maxSpeed: 2, minSpeed: 1, type: 2
        });
    }

    function snowfall2(ele) {
        $(ele).snowfall({
            round: true, shadow: true, flakeIndex: 2,
            minSize: 1, maxSize: 4, flakeCount: 10, maxSpeed: 2, minSpeed: 1
        });
    }

    var ttimeout, tinterval;

    $("#main").mousedown(function () {
        ttimeout = setTimeout(function () {
            tinterval = setInterval(function () {
                $("#main").click();
            }, 100);
        }, 1000);
    });

    $("#main").mouseup(function () {
        clearTimeout(ttimeout);
        clearInterval(tinterval);
        tinterval = undefined;
    });

    $("#main").mouseout(function () {
        clearTimeout(ttimeout);
        clearInterval(tinterval);
        tinterval = undefined;
    });

    function unescapeHTML(a) {
        a = "" + a;
        return a.replace(/&lt;/g, "<").replace(/&gt;/g, ">").replace(/&amp;/g, "&").replace(/&quot;/g, '"').replace(/&apos;/g, "'");
    }

    function getGameData(sect) {
        console.log(sect);
        $.get("/hatuyuki_data?section=" + encodeURIComponent(sect), function (data0, status) {
            if (status === "success") {
                console.log(data0);
                data = JSON.parse(data0);
                episode = data["episode"];
                last_frame = episode.length;
                calcFigureSize();
                // load_frame();
                mainOnClick();
            } else {
                alert("未找到游戏资源。\n资源名: " + sect);
            }
        });
    }

    /*function displayProgress(cname) {
        var progress64 = getCookie("qsave");
        if (progress64 === "")
            $("#q_progress").html("无");
        else {
            var progress_json = Base64.decode(progress64);
            var progress = JSON.parse(progress_json);
            var date = new Date(progress.date);
            $("#q_progress").html("Title:" + progress.title + ";" + progress.speaker + ": " + progress.content + date.toString());
        }
    }*/

    function setCookie(cname, cvalue, exdays) {
        var d = new Date();
        d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
        var expires = "expires=" + d.toGMTString();
        document.cookie = cname + "=" + cvalue + "; " + expires;
    }

    function getCookie(cname) {
        var name = cname + "=";
        var ca = document.cookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i].trim();
            if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
        }
        return "";
    }

    function displayProgress(id) {
        var progress64 = getCookie(id);
        var day = ["日", "月", "火", "水", "木", "金", "土"];
        if (progress64 !== "") {
            var progress_json = Base64.decode(progress64);
            var progress = JSON.parse(progress_json);
            $("#" + id + "_img").attr("src", img_pathbase + progress.img);
            $("#" + id + "_title").html(progress.title);
            var content = "";
            if (progress.speaker !== null)
                content = progress.speaker;
            $("#" + id + "_content").html(content + ": " + progress.content);
            $("#" + id + "_desc").val(progress.desc).css("display", "block");
            var date = new Date(progress.date);
            $("#" + id + "_date").text("Date: " + date.getFullYear() + "年" +
                date.getMonth() + "月" + date.getDate() + "日 " +
                date.toLocaleTimeString() + " (" + day[date.getDay()] + ")");
        } else {
            $("#" + id + "_img").attr("src", "/image/hatuyuki/_save/_SAVE_THUMNAIL.png");
            $("#" + id + "_title").html(" ");
            $("#" + id + "_content").html(" ");
            $("#" + id + "_desc").text("").css("display", "none");
            $("#" + id + "_date").text(" ");

        }
    }

    function saveProgress(id) {
        var progress = {
            "section": section,
            "frame": frame,
            "date": Date.now(),
            "speaker": episode[frame].speaker,
            "content": episode[frame].content,
            "title": episode[frame].title.substring(episode[frame].title.indexOf("Chapter"), episode[frame].title.length),
            "img": episode[frame].bg,
            "desc": ""
        };
        var progress_json = JSON.stringify(progress);
        var progress64 = Base64.encode(progress_json);
        console.log(progress64);
        setCookie(id, progress64, 1);
        displayProgress(id);

    }
</script>
</html>