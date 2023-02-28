<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="GB18030">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <base href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/carousel.css">
    <link rel="stylesheet" href="css/wave.css">
    <style>
        h3 {
            font-weight:bold;
        }
        .sideBox .hd{height:30px; line-height:30px; background:#f60; padding:0 10px;text-align:center;overflow:hidden;}
        .sideBox .hd .more{color:#fff;}
        .sideBox .hd h3 span{font-weight:bold; font-size:14px;color:#fff;}
        .sideBox .bd{padding:5px 0 0;}

        #sideMenu .bd li{margin-bottom:2px; height:30px; line-height:30px;text-align:center; overflow:hidden;}
        #sideMenu .bd li a{display:block;background:#EAE6DD;}
        #sideMenu .bd li a:hover{background:#D5CFBF;}

        #mainBox .mHd{border-bottom:2px solid #09c;height:30px;line-height:30px;}
        #mainBox .mHd h3{display:initial;*display:inline;zoom:1;padding:0 15px;background:#09c;color:#fff;}
        #mainBox .mHd h3 span{color:#fff;font-size:14px;font-weight:bold;}
        #mainBox .path{float:right;}

        .path a,.path span{ margin:0 5px;}

        .picList li{margin:0 5px;height:190px;}

        h3.break {
            font-size:16px;
            display: block;
            white-space: nowrap;
            word-wrap: normal;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        h3.break>a {
            text-decoration:none;
        }

    </style>
</head>
<body>
<div class="navbar-wrapper">
    <div class="container">
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.jsp" style="font-size:32px;">创意筹————让你的创意闪闪发光</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse" style="float:right;">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="user/login">登录</a></li>
                        <li><a href="user/reg">注册</a></li>
                        <li><a>|</a></li>
                        <li><a href="admin/admin-login">管理员入口</a></li>
                    </ul>
                </div>
            </div>
        </nav>

    </div>
</div>


<!-- Carousel
================================================== -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
        <div class="item active" onclick="window.location.href='index.jsp'" style="cursor:pointer;">
            <img src="img/carousel-1.jpg" alt="First slide">
        </div>
        <div class="item" onclick="window.location.href='index.jsp'" style="cursor:pointer;">
            <img src="img/carousel-2.jpg" alt="Second slide">
        </div>
        <div class="item" onclick="window.location.href='index.jsp'" style="cursor:pointer;">
            <img src="img/carousel-3.jpg" alt="Third slide">
        </div>
    </div>
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<div class="wave">
    <div class="wave-item wave1"></div>
    <div class="wave-item wave2"></div>
    <div class="wave-item wave3"></div>
</div>


<script src="jquery/jquery-2.1.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="script/docs.min.js"></script>
<script src="script/back-to-top.js"></script>
</body>
</html>