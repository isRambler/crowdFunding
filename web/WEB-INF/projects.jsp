<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="css/pagination.css">
    <script src="jquery/jquery-2.1.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="script/docs.min.js"></script>
    <script src="script/back-to-top.js"></script>
    <script type="text/javascript" src="jquery/jquery.pagination.js"></script>
    <script>
        $('#myTab a').click(function (e) {
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
            window.location.href="project/show?pageNum="+pageNum+"&keyword=${param.keyword}";
            //     由于每个页码按钮都是超链接，所以在这个函数的最后取消超链接的关联行为
            return false;
        }
    </script>
    <style>
        .panel {
            border-radius:0;
        }
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
                            <li class="active">
                                <a rel="nofollow" href="project/show"> 项目总览</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="project/submit"> 发起众筹</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="project/myCenter">我的众筹</a>
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
                <div class="panel panel-default">
                    <div class="panel-footer" style="height:50px;padding:0;">
                        <div style="float:right;">
                            <form class="navbar-form navbar-left" role="search" method="post" action="project/show">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="请输入搜索内容" name="keyword">
                                </div>
                                <button type="submit" class="btn btn-default"> 搜索</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="row">
                    <C:if test="${empty pageInfo.list}">
                        <tr>
                            <td colspan="12" align="center">抱歉，没有查询到数据</td>
                        </tr>
                    </C:if>
                    <C:if test="${!empty pageInfo.list}">
                        <C:forEach items="${pageInfo.list}" var="project" varStatus="myStatus">
                            <div class="col-md-12">
                                <div class="thumbnail">
                                    <img alt="图片怎么消失了..." src="${project.picturePath}" />
                                    <div class="caption">
                                        <h3 class="break">
                                            <a href="project/targetProject/${project.id}">${project.projectName}</a>
                                        </h3>
                                        <p>
                                        <div style="float:left;">目标金额 $${project.money} </div>
                                        <div style="float:right;">发起日期 ${project.deployDate} </div>
                                        </p>
                                        <br>
                                        <div><span style="float:right;"></span>  <span >支持人数： ${project.supporter}</span> </div>
                                    </div>
                                </div>
                            </div>
                        </C:forEach>
                    </C:if>
                </div>
                <tr>
                    <td colspan="4" align="center">
                        <div id="Pagination" class="pagination"><!--这里显示分页--></div>
                    </td>
                </tr>
            </div>
        </div>
    </div>


</div> <!-- /container -->



</body>
</html>