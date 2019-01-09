<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/8
  Time: 13:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/public.css" />
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/page.css" />
    <script type="text/javascript" src="${APP_PATH}/static/script/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="${APP_PATH}/static/layer/layer.js"></script>

</head>
<body>

<!-- 登录body -->
<div class="logDiv">
    <img class="logBanner" src="${APP_PATH}/static/img/background.png" />
    <div class="logGet">
        <!-- 头部提示信息 -->
        <div class="logD logDtip">
            <p class="p1">登录</p>
        </div>
        <!-- 输入框 -->
        <div class="lgD">
            <img class="img1" src="${APP_PATH}/static/img/logName.png" />
            <input type="text" placeholder="输入用户名" name="username"/>
        </div>
        <div class="lgD">
            <img class="img1" src="${APP_PATH}/static/img/logPwd.png" />
            <input type="password"  placeholder="输入用户密码" name="password"/>
        </div>
        <%--<div class="lgD">--%>
            <%--<input type="password"  placeholder="输入验证码" name="code" style="width: 160px;"/>--%>
            <%--<img src="${APP_PATH}/static/img/logYZM.png">--%>
        <%--</div>--%>
        <div class="logC">
            <button id="loginBtn">登 录</button>
        </div>
    </div>
</div>
<!-- 登录body  end -->

<!-- 登录页面底部 -->
<div class="logFoot">
    <p class="p1" style="color: #079ed3">版权所有: 深圳博览天下票务服务有限公司</p>
    <p class="p2"></p>
</div>
<!-- 登录页面底部end -->
<script>
    $(function () {
        $("#loginBtn").click(function () {
            var username = $("input[name=username]").val();
            if( username == "") {
                layer.msg("用户名不能为空, 请输入", {time:2000, icon:5, shift:6}, function () {
                    
                });
                return false;
            }

            var password = $("input[name=password]").val();
            if(password == "") {
                layer.msg("用户密码不能为空, 请输入", {time:2000, icon:5, shift:6}, function () {

                });
                return false;
            }
            var loadingIndex = null;
            $.ajax({
                type:"post",
                url:"doLogin",
                data:{
                    "username":username,
                    "password":password,
                },
                beforeSend:function () {
                    loadingIndex = layer.msg('正在登录，请稍后...', {icon: 16});
                },
                success:function (result) {
                    layer.close(loadingIndex);
                    if(result.success) {
                        window.location.href = "index"
                    } else {
                        layer.msg(result.data, {time:1000, icon:5, shift:6}, function () {

                        });
                    }
                }
                
            });

        });
    })
</script>

</body>
</html>
