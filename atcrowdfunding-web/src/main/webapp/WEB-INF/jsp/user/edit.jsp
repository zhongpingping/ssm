<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<html>
<%@ include file="../frame/header.jsp"%>
<body>
<%@ include file="../frame/nav.jsp"%>
<div class="down-main">
    <%@ include file="../frame/left.jsp"%>
    <div class="right-product my-index right-full">
        <div class="manage account-manage info-center">
            <div class="col-md-12" style="padding: 0px;">
                <ol class="breadcrumb">
                    <li><a href="#">用户管理</a></li>
                    <li><a href="#">用户列表</a></li>
                    <li class="active">修改</li>
                </ol>
                <div class="panel panel-default">
                    <div class="panel-heading">修改用户信息<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
                    <div class="panel-body">
                        <form role="form">
                            <div class="form-group">
                                <label for="inputUsername">编号</label>
                                <input type="text" class="form-control" id="inputId" readonly value="${user.id}">
                            </div>
                            <div class="form-group">
                                <label for="inputUsername">登陆账号</label>
                                <input type="text" class="form-control" id="inputUsername" value="${user.username}">
                            </div>
                            <div class="form-group">
                                <label for="inputActualname">用户名称</label>
                                <input type="text" class="form-control" id="inputActualname" value="${user.actualName}">
                            </div>
                            <div class="form-group">
                                <label for="inputPassword">登录密码</label>
                                <input type="text" class="form-control" id="inputPassword" value="${user.password}">
                            </div>
                            <div class="form-group">
                                <label for="inputEmail">邮箱地址</label>
                                <input type="email" class="form-control" id="inputEmail" value="${user.email}">
                                <br/>
                                <p class="help-block label label-warning">请输入合法的邮箱地址, 格式为： xxxx@xxxx.com</p>
                            </div>
                            <button type="button" class="btn btn-success" id="saveUser"><i class="glyphicon glyphicon-save"></i> 保  存</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<script type="text/javascript" src="${APP_PATH}/static/js/user.js"></script>
<%@ include file="../frame/footer.jsp"%>
</body>
</html>