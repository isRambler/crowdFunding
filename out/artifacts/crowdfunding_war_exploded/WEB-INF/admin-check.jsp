<%--
  Created by IntelliJ IDEA.
  User: cxy
  Date: 2023/2/26
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/pagination.css">
    <style>
        .tree li {
            list-style-type: none;
            cursor:pointer;
        }
        table tbody tr:nth-child(odd){background:#F4F4F4;}
        table tbody td:nth-child(even){color:#C00;}
    </style>
    <script src="jquery/jquery-2.1.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="script/docs.min.js"></script>
    <script type="text/javascript" src="jquery/jquery.pagination.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".list-group-item").click(function(){
                if ( $(this).find("ul") ) {
                    $(this).toggleClass("tree-closed");
                    if ( $(this).hasClass("tree-closed") ) {
                        $("ul", this).hide("fast");
                    } else {
                        $("ul", this).show("fast");
                    }
                }
            });
        });

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
            window.location.href="admin/check?pageNum="+pageNum+"&keyword=${param.keyword}";
            //     由于每个页码按钮都是超链接，所以在这个函数的最后取消超链接的关联行为
            return false;
        }
    </script>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <div><a class="navbar-brand" style="font-size:32px;" href="#">创意筹平台 - 用户维护</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li style="padding-top:8px;">
                    <div class="btn-group">
                        <button type="button" class="btn btn-default btn-success dropdown-toggle" data-toggle="dropdown">
                            ${adminName} <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="admin/out"> 退出系统</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <div class="tree">
                <ul style="padding-left:0px;" class="list-group">
                    <li class="list-group-item tree-closed" >
                        <a href="admin/control"> 控制面板</a>
                    </li>
                    <li class="list-group-item tree-closed">
                        <span> 权限管理 <span class="badge" style="float:right">1</span></span>
                        <ul style="margin-top:10px;display:none;">
                            <li style="height:30px;">
                                <a href="admin/showUser"> 用户维护</a>
                            </li>
                        </ul>
                    </li>
                    <li class="list-group-item">
                        <span> 业务审核 <span class="badge" style="float:right">2</span></span>
                        <ul style="margin-top:10px;">
                            <li style="height:30px;">
                                <a href="admin/check" style="color:red;"> 项目审核</a>
                            </li>
                            <li style="height:30px;">
                                <a href="admin/checkAll"> 项目管理</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"> 数据列表</h3>
                </div>
                <div class="panel-body">
                    <form class="form-inline" role="form" style="float:left;" method="post" action="admin/check">
                        <div class="form-group has-feedback">
                            <div class="input-group">
                                <div class="input-group-addon">查询条件</div>
                                <input name="keyword" class="form-control has-success" type="text" placeholder="请输入查询条件">
                            </div>
                        </div>
                        <input type="submit" class="btn btn-warning" value="查询">
                    </form>
                    <br>
                    <hr style="clear:both;">
                    <div class="table-responsive">
                        <table class="table  table-bordered">
                            <thead>
                            <tr>
                                <th>项目名称</th>
                                <th>发起人</th>
                                <th>目标金额(元)</th>
                                <th>众筹天数</th>
                                <th>创建时间</th>
                                <th width="100">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <C:if test="${empty pageInfo.list}">
                                <tr>
                                    <td colspan="6" align="center">抱歉，没有查询到数据</td>
                                </tr>
                            </C:if>
                            <C:if test="${!empty pageInfo.list}">
                                <c:forEach items="${pageInfo.list}" var="project" varStatus="myStatus">
                                    <tr>
                                        <td>${project.projectName}</td>
                                        <td>${project.memberName}</td>
                                        <td>${project.money}</td>
                                        <td>${project.day}</td>
                                        <td>${project.createDate}</td>
                                        <td>
                                            <a href="admin/success/${project.projectName}/${pageInfo.pageNum}" class="btn btn-success btn-xs">通过</a>
                                            <a href="admin/fail/${project.projectName}/${pageInfo.pageNum}" class="btn btn-danger btn-xs">删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </C:if>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="6" align="center">
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


</body>
</html>
