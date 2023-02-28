<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: cxy
  Date: 2023/2/25
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="GB18030">
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
    <link rel="stylesheet" href="css/pagination.css">
    <script type="text/javascript" src="jquery/jquery.pagination.js"></script>
    <script src="jquery/jquery-2.1.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="script/docs.min.js"></script>
    <script src="script/back-to-top.js"></script>
    <script type="text/javascript">
        $('#myTab a').click(function (e) {
            e.preventDefault()
            $(this).tab('show')
        })
        $('#myTab1 a').click(function (e) {
            e.preventDefault()
            $(this).tab('show')
        })

        $(function (){
            // 调用后面声明的函数对我们的页码导航条进行初始化操作
            initPagination();
        })
        // 生成页码导航条的函数
        function initPagination(){
            //     获取总记录数
            var totalRecord=${requestScope.pageInfo.total};
            //     声明一个json对象去存储pagination要设置的属性
            var properties={
                num_edge_entries:3,                 //边缘页数
                num_display_entries: 5,             //主体页数
                callback: pageSelectCallback,       //指定用户点击翻页的按钮时跳转页面的回调函数
                items_per_page:${pageInfo.pageSize},//每页要显示的数据的数量
                current_page: ${pageInfo.pageNum-1},
                prev_text: "上一页",                 //按钮上的文本
                next_text: "下一页"                  //按钮上的文本
            }
            //     生成页面导航条
            $("#Pagination").pagination(totalRecord,properties);
        }

        // 调用这个函数实现页面跳转
        function pageSelectCallback(pageIndex,jQuery){
            // 根据pageIndex计算得到pageNum
            var pageNum=pageIndex+1;
            //     跳转页面
            window.location.href="admin/showUser?pageNum="+pageNum+"&keyword=${param.keyword}";
            //     由于每个页码按钮都是超链接，所以在这个函数的最后取消超链接的关联行为
            return false;
        }
    </script>
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
<div class="container">
    <div class="row clearfix">
        <div class="col-sm-3 col-md-3 column">
            <div class="list-group">
                <div class="list-group-item active">
                    我的众筹<span class="badge"></span>
                </div>
            </div>
        </div>
        <div class="col-sm-9 col-md-9 column">
            <ul id="myTab" style="" class="nav nav-pills" role="tablist">
                <li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">我的众筹</a></li>
            </ul>
            <div id="myTabContent" class="tab-content" style="margin-top:10px;">
                <div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">

                    <ul id="myTab1" class="nav nav-tabs">
                        <li role="presentation"><a href="#add">我发起的</a></li>
                        <li class=" pull-right">
                            <button type="button" class="btn btn-warning" onclick="window.location.href='project/submit'">发起众筹</button>
                        </li>
                    </ul>
                    <div id="myTab2" class="tab-content" style="margin-top:10px;">
                        <div role="tabpanel" class="tab-pane fade active in" id="support" aria-labelledby="home-tab">
                            <div class="container-fluid">
                                <div class="row clearfix">
                                    <div class="col-md-12 column">
                                        <span class="label label-warning">全部</span>
                                    </div>
                                    <div class="col-md-12 column" style="margin-top:10px;padding:0;">
                                        <table class="table table-bordered" style="text-align:center;">
                                            <thead>
                                            <tr style="background-color:#ddd;">
                                                <td>项目信息</td>
                                                <td width="90">发布日期</td>
                                                <td width="120">支持金额（元）</td>
                                                <td width="80">支持人数</td>
                                                <td width="120">操作</td>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:if test="${empty pageInfo.list}">
                                                <tr>
                                                    <td colspan="12" align="center">您还未发布任何筹资项目哦！</td>
                                                </tr>
                                            </c:if>
                                            <C:if test="${!empty pageInfo.list}">
                                                <c:forEach items="${pageInfo.list}" var="project" varStatus="myStatus">
                                                    <tr>
                                                        <td style="vertical-align:middle;">
                                                            <div class="thumbnail">
                                                                <div class="caption">
                                                                    <h3>
                                                                        ${project.projectName}
                                                                    </h3>
                                                                    <p>
                                                                    <div style="float:left;"> 目标金额 ${project.money} </div>
                                                                    </p>
                                                                    <br>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td style="vertical-align:middle">${project.deployDate}</td>
                                                        <td style="vertical-align:middle">${project.supportMoney}</td>
                                                        <td style="vertical-align:middle">${project.supporter}</td>
                                                        <td style="vertical-align:middle">
                                                            <a href="project/remove/${project.projectName}/${pageInfo.pageNum}" class="btn btn-danger btn-xs">删除项目</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </C:if>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="12" align="center">
                                                        <div id="Pagination" class="pagination"><!--这里显示分页--></div>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
