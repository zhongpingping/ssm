<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <li class="active">修改</li>
                </ol>
                <div class="panel panel-default">
                    <div class="panel-heading">修改角色<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
                    <div class="panel-body">
                        <form role="form">
                            <div class="form-group">
                                <label for="inputRolename">角色名称</label>
                                <input type="text" class="form-control" id="inputId" readonly value="${role.id}">
                            </div>
                            <div class="form-group">
                                <label for="inputRolename">角色名称</label>
                                <input type="text" class="form-control" id="inputRolename" value="${role.name}">
                            </div>
                            <div class="form-group">
                                <label for="inputRoleStatus">是否禁用</label>
                                <select id="inputRoleStatus" class="form-control">
                                    <c:choose>
                                        <c:when test="${role.status == 1}">
                                            <option value="1" selected>启用</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="1">启用</option>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${role.status == 0}">
                                            <option value="0" selected>禁用</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="0">禁用</option>
                                        </c:otherwise>
                                    </c:choose>
                                </select>
                            </div>

                            <button type="button" class="btn btn-success" id="saveRole"><i class="glyphicon glyphicon-save"></i> 保  存</button>
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