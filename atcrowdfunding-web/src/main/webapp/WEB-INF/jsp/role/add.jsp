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
                    <li><a href="#">角色管理</a></li>
                    <li><a href="#">角色列表</a></li>
                    <li class="active">新增</li>
                </ol>
                <div class="panel panel-default">
                    <div class="panel-heading">添加新角色<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
                    <div class="panel-body">
                        <form role="form">
                            <div class="form-group">
                                <label for="inputRolename">角色名称</label>
                                <input type="text" class="form-control" id="inputRolename" placeholder="请输入角色名称">
                            </div>
                            <div class="form-group">
                                <label for="inputRoleStatus">是否禁用</label>
                                <select id="inputRoleStatus" class="form-control">
                                    <option value="1" selected>启用</option>
                                    <option value="0">禁用</option>
                                </select>
                            </div>

                            <button type="button" class="btn btn-success" id="addRole"><i class="glyphicon glyphicon-plus"></i> 新增</button>
                            <button type="button" class="btn btn-danger"><i class="glyphicon glyphicon-refresh"></i> 重置</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<script type="text/javascript" src="${APP_PATH}/static/js/role.js"></script>
<%@ include file="../frame/footer.jsp"%>
</body>
</html>