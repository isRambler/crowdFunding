<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
    <title>login</title>
    <link rel="stylesheet" href="css/login.css">
    <script src="jquery/jquery-3.6.3.js"></script>
    <script>
        function onFucus() {
            let owl = document.getElementById('owl')
            owl.classList.add("owl-close")
        }

        function onBlur() {
            let owl = document.getElementById('owl')
            owl.classList.remove("owl-close")

        }

        function a1(){
            $.post({
                url:"http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/user/a1",
                data:{"account":$("#account").val()},
                success:function (data){
                    if (data.toString()==="OK"){
                        $("#userInfo").css("color","green");
                    }else {
                        $("#userInfo").css("color","red");
                    }
                    $("#userInfo").html(data);
                }
            })
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
        <form action="user/setReg" method="post">
            <div class="content">
                <div style="text-align: center">用户注册</div>
                <div class="item">
                    <input id="account" type="text" placeholder="account" name="account" onblur="a1()">
                    <span id="userInfo"></span>
                </div>
                <div class="item">
                    <input type="password" placeholder="password" name="password" onfocus="onFucus()" onblur="onBlur()">
                </div>
                <div class="item">
                    <input type="text" placeholder="email" name="email">
                </div>
                <div class="item">
                    <button>注册</button>
                </div>
            </div>
        </form>

    </div>
</div>
</body>

</html>