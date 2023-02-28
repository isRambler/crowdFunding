<%--
  Created by IntelliJ IDEA.
  User: cxy
  Date: 2023/2/27
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <base href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/theme.css">
    <style>
        .nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover {
            border-bottom-color: #ddd;
        }
        .nav-tabs>li>a {
            border-radius: 0;
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
                                <a rel="nofollow" href="project/show"> 众筹项目</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="project/submit"> 发起众筹</a>
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
                <div class="jumbotron nofollow" style="    padding-top: 10px;">
                    <h3>
                        ${requestScope.project.projectName}
                    </h3>
                    <div style="float:left;width:70%;">
                        ${requestScope.project.projectDescription}
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="row clearfix">
                    <div class="col-md-8 column">
                        <img alt="140x140" width="740" src="${requestScope.project.picturePath}" />
                    </div>
                    <div class="col-md-4 column">
                        <div class="panel panel-default" style="border-radius: 0px;">
                            <div class="panel-heading" style="background-color: #fff;border-color: #fff;">
                                <span class="label label-success"> 众筹中</span>
                            </div>
                            <div class="panel-body">
                                <h3 >
                                    已筹资金：${requestScope.project.supportMoney}
                                </h3>
                                <div class="progress" style="height:10px; margin-bottom: 5px;">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;"></div>
                                </div>
                                <div>
                                    <p><span>已有${requestScope.project.supporter}人支持该项目</span></p>
                                    <button type="button" class="btn  btn-warning btn-lg btn-block" data-toggle="modal" data-target="#myModal">立即支持</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> <!-- /container -->


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
    <div class="modal-dialog "  style="width:960px;height:400px;" role="document">
        <div class="modal-content" data-spy="scroll" data-target="#myScrollspy">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">选择支持项</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row clearfix">
                        <div id="navList" class="col-sm-12 col-md-12 column" style="height:400px;overflow-y:auto;">
                            <form class="form-horizontal" action="project/support/${project.id}" method="post">
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">支持金额数</label>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" name="supportMoney">
                                    </div>
                                </div>
                                <input type="submit" class="btn  btn-warning btn-lg " style="display:block;margin:0 auto" value="支持">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<script src="jquery/jquery-2.1.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="script/docs.min.js"></script>
<script src="script/back-to-top.js"></script>
</body>
</html>
