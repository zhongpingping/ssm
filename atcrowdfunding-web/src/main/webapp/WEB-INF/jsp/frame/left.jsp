<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/8
  Time: 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<div class="left-main left-full">
    <div class="sidebar-fold"><span class="glyphicon glyphicon-menu-hamburger"></span></div>
    <div class="subNavBox">
        <div class="sBox">
            <div class="subNav sublist-down"><span class="title-icon glyphicon glyphicon-chevron-down"></span><span class="sublist-title">权限管理</span>
            </div>
            <ul class="navContent" style="display:block">
                <li class="active">
                    <div class="showtitle" style="width:100px;"><img src="${APP_PATH}/static/img/leftimg.png" />账号管理</div>
                    <a href="${APP_PATH}/user/index"><span class="sublist-icon glyphicon glyphicon-user"></span><span class="sub-title">账号管理</span></a> </li>
                <li>
                    <div class="showtitle" style="width:100px;"><img src="${APP_PATH}/static/img/leftimg.png" />角色管理</div>
                    <a href="${APP_PATH}/role/index"><span class="sublist-icon glyphicon glyphicon-asterisk"></span><span class="sub-title">角色管理</span></a> </li>
                <li>
                    <div class="showtitle" style="width:100px;"><img src="${APP_PATH}/static/img/leftimg.png" />短信</div>
                    <a href="smsInfo.html"><span class="sublist-icon glyphicon glyphicon-bullhorn"></span><span class="sub-title">短信</span></a></li>
                <li>
                    <div class="showtitle" style="width:100px;"><img src="${APP_PATH}/static/img/leftimg.png" />实名认证</div>
                    <a href="identify.html"><span class="sublist-icon glyphicon glyphicon-credit-card"></span><span class="sub-title">实名认证</span></a></li>
            </ul>
        </div>
        <div class="sBox">
            <div class="subNav sublist-up"><span class="title-icon glyphicon glyphicon-chevron-up"></span><span class="sublist-title">关于我们</span></div>
            <ul class="navContent" style="display:none">
                <li>
                    <div class="showtitle" style="width:100px;"><img src="${APP_PATH}/static/img/leftimg.png" />添加新闻</div>
                    <a href="#"><span class="sublist-icon glyphicon glyphicon-user"></span><span class="sub-title">添加新闻</span></a></li>
                <li>
                    <div class="showtitle" style="width:100px;"><img src="${APP_PATH}/static/img/leftimg.png" />添加新闻</div>
                    <a href="#"><span class="sublist-icon glyphicon glyphicon-user"></span><span class="sub-title">新闻管理</span></a></li>
                <li>
                    <div class="showtitle" style="width:100px;"><img src="${APP_PATH}/static/img/leftimg.png" />添加新闻</div>
                    <a href="#"><span class="sublist-icon glyphicon glyphicon-user"></span><span class="sub-title">添加新闻</span></a></li>
                <li>
                    <div class="showtitle" style="width:100px;"><img src="${APP_PATH}/static/img/leftimg.png" />新闻管理</div>
                    <a href="#"><span class="sublist-icon glyphicon glyphicon-user"></span><span class="sub-title">新闻管理</span></a></li>
            </ul>
        </div>
    </div>
</div>