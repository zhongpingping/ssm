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
    <link rel="stylesheet" type="text/css" href="static/css/public.css" />
    <link rel="stylesheet" type="text/css" href="static/css/page.css" />
    <script type="text/javascript" src="static/script/jquery-1.11.1.min.js"></script>
</head>
<body>

<!-- 登录body -->
<div class="logDiv">
    <img class="logBanner" src="static/img/background.png" />
    <div class="logGet">
        <!-- 头部提示信息 -->
        <div class="logD logDtip">
            <p class="p1">登录</p>
        </div>
        <!-- 输入框 -->
        <div class="lgD">
            <img class="img1" src="static/img/logName.png" />
            <input type="text" placeholder="输入用户名" name="username"/>
        </div>
        <div class="lgD">
            <img class="img1" src="static/img/logPwd.png" />
            <input type="password"  placeholder="输入用户密码" name="password"/>
        </div>
        <div class="lgD">
            <input type="password"  placeholder="输入验证码" name="code" style="width: 160px;"/>
            <img src="static/img/logYZM.png">
        </div>
        <div class="logC">
            <a href="index.html" target="_self"><button>登 录</button></a>
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

</body>
</html>
