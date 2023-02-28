<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<!DOCTYPE html>--%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
    <title>login</title>
    <link rel="stylesheet" href="css/login.css">
    <script>
        function onFucus() {
            let owl = document.getElementById('owl')
            owl.classList.add("owl-close")
        }

        function onBlur() {
            let owl = document.getElementById('owl')
            owl.classList.remove("owl-close")

        }
    </script>
</head>

<body>
<div class="login">
    <div class="card">
        <div id="owl" class="owl">
            <div class="eyes"></div>
            <div class="arm-up-right"></div>
            <div class="arm-up-left"></div>
            <div class="arm-down-left"></div>
            <div class="arm-down-right"></div>
        </div>
        <form action="admin/login" method="post">
            <div class="content">
                <div style="text-align: center">管理员登录界面</div>
                <p>${requestScope.exception.message}</p>
                <div class="item">
                    <img class="icon" src="images/account.png" alt="">
                    <input type="text" placeholder="account" name="account" required>
                </div>
                <div class="item">
                    <img class="icon" src="images/pwd.png" alt="">
                    <input type="password" placeholder="password"
                           onfocus="onFucus()" onblur="onBlur()" name="password" required>
                </div>
                <div class="item">
                    <button>登陆</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>

</html>