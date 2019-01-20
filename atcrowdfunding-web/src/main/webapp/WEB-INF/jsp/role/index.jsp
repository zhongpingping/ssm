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
            <div class="col-md-12 " style="padding: 0px;">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 角色列表</h3>
                    </div>
                    <div class="panel-body">
                        <form class="form-inline" role="form" style="float:left;">
                            <div class="form-group has-feedback">
                                <div class="input-group">
                                    <div class="input-group-addon">查询条件</div>
                                    <input class="form-control has-success" type="text" placeholder="请输入查询条件">
                                </div>
                            </div>
                            <button type="button" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询</button>
                        </form>
                        <button type="button" class="btn btn-danger" style="float:right;margin-left:10px;" onclick="deleteSelect()"><i class=" glyphicon glyphicon-remove"></i> 删除</button>
                        <button type="button" class="btn btn-primary" style="float:right;" onclick="window.location.href='${APP_PATH}/role/add'"><i class="glyphicon glyphicon-plus"></i> 新增</button>
                        <br>
                        <hr style="clear:both;">
                        <div class="table-responsive">
                            <form id="roleForm">
                                <table class="table  table-bordered">
                                    <thead>
                                    <tr >
                                        <th width="30">#</th>
                                        <th width="30"><input type="checkbox"></th>
                                        <th>角色名</th>
                                        <th>状态</th>
                                        <th>创建时间</th>
                                        <th width="200">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="roleData">

                                    </tbody>
                                    <tfoot>
                                    <tr >
                                        <td colspan="7" align="center">
                                            <ul class="pagination">

                                            </ul>
                                        </td>
                                    </tr>

                                    </tfoot>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<style>

</style>
<script type="text/javascript" src="${APP_PATH}/static/js/role.js"></script>
<%@ include file="../frame/footer.jsp"%>
</body>
</html>