<%--
  Created by IntelliJ IDEA.
  User: cxy
  Date: 2023/2/26
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="GB18030">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <base href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/theme.css">
    <style>
        #typeList  :not(:first-child) {
            margin-top:20px;
        }
        .panel {
            border-radius:0;
        }

        .progress-bar-default {
            background-color: #ddd;
        }
    </style>
</head>
<body>
<div class="navbar-wrapper">
    <div class="container">
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="project/show" style="font-size:32px;">创意筹————让你的创意闪闪发光</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse" style="float:right;">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="user/out"> 退出系统</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>

<div class="container theme-showcase" role="main">

    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <nav class="navbar navbar-default" role="navigation">
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li >
                                <a rel="nofollow" href="project/show"> 项目总览</a>
                            </li>
                            <li class="active">
                                <a rel="nofollow" href="project/submit"> 发起项目</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="project/myCenter"> 我的众筹</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>


    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="panel panel-default" >
                    <div class="panel-heading" style="text-align:center;">
                        <div class="container-fluid">
                            <div class="row clearfix">
                                <div class="col-md-6 column">
                                    <div class="progress" style="height:50px;border-radius:0;    position: absolute;width: 75%;right:49px;">
                                        <div class="progress-bar progress-bar-default" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;height:50px;">
                                            <div style="font-size:16px;margin-top:15px;">1. 项目及发起人信息</div>
                                        </div>
                                    </div>
                                    <div style="right: 0;border:10px solid #ddd;border-left-color: #88b7d5;border-width: 25px;position: absolute;
                                             border-left-color: rgba(92, 184, 92, 1);
                                             border-top-color: rgba(92, 184, 92, 0);
                                             border-bottom-color: rgba(92, 184, 92, 0);
                                             border-right-color: rgba(92, 184, 92, 0);
                                        ">
                                    </div>
                                </div>
                                <div class="col-md-6 column">
                                    <div class="progress" style="height:50px;border-radius:0;">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;height:50px;">
                                            <div style="font-size:16px;margin-top:15px;">2. 完成</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="container-fluid">
                            <div class="row clearfix">
                                <div class="col-md-12 column">
                                    <div class="page-header" style="    border-bottom-style: dashed;">
                                        <h3>
                                            上传一张图片让你的项目闪闪发光吧
                                        </h3>
                                    </div>
                                    <form class="form-horizontal" action="project/submit_2" method="post" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">项目图片</label>
                                            <div class="col-sm-10">
                                                <input type="file" name="picture" style="display: none">
                                                <button id="uploadBtn" type="button" class="btn btn-primary btn-lg active">上传图片</button>
                                                <label class="control-label">图片上无文字,支持jpg、jpeg、png、gif格式，大小不超过2M，建议尺寸：858*420px</label>
                                                <br>
                                                <img style="display: none">
                                            </div>
                                        </div>
                                        <div class="panel-footer" style="text-align:center;">
                                            <input type="submit" class="btn  btn-warning btn-lg" value="提交申请">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div> <!-- /container -->
<script src="jquery/jquery-2.1.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="script/docs.min.js"></script>
<script src="script/back-to-top.js"></script>
<script>
    $('#myTab a').click(function (e) {
        e.preventDefault()
        $(this).tab('show')
    })

    $("#uploadBtn").click(function (){
        $("[name=picture]").click();
    });
    $("[name=picture]").change(function (event){
        var files=event.target.files;
        var file=files[0];
        var url=window.url ||window.webkitURL;
        var path=url.createObjectURL(file);
        $(this).next().next().next().next().attr("src",path).show();
    })
</script>
</body>
</html>

