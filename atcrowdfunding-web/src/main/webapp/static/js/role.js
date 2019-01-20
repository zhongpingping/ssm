$(function () {
    pageQuery(1);
    
    $("#addRole").click(function () {
        var inputRoleName = $("#inputRolename").val();
        var inputRoleStatus = $("#inputRoleStatus").val();

        if (inputRoleName == "") {
            layer.msg("角色名称不能为空, 请输入", {time:1000, icon:5, shift:6}, function () {

            });
            return false;
        }

        var loadingIndex = null;

        $.ajax({
            type:"post",
            url:"insert",
            data:{
                name:inputRoleName,
                status:inputRoleStatus,
            },
            beforeSend:function () {
                loadingIndex = layer.msg('处理中', {icon: 16});
            },
            success : function(result) {
                layer.close(loadingIndex);
                if ( result.success ) {
                    layer.msg("角色信息保存成功", {time:1000, icon:6}, function(){
                        window.location.href = "index";
                    });
                } else {
                    layer.msg("角色信息保存失败，请重新操作", {time:2000, icon:5, shift:6}, function(){

                    });
                }
            }
        });
    });

    $("#saveRole").click(function () {
        var inputRoleName = $("#inputRolename").val();
        var inputRoleStatus = $("#inputRoleStatus").val();
        var inputId = $("#inputId").val();

        if (inputRoleName == "") {
            layer.msg("角色名称不能为空, 请输入", {time:1000, icon:5, shift:6}, function () {

            });
            return false;
        }

        var loadingIndex = null;

        $.ajax({
            type:"post",
            url:"update",
            data:{
                id:inputId,
                name:inputRoleName,
                status:inputRoleStatus,
            },
            beforeSend:function () {
                loadingIndex = layer.msg('处理中', {icon: 16});
            },
            success : function(result) {
                layer.close(loadingIndex);
                if ( result.success ) {
                    layer.msg("角色信息修改成功", {time:1000, icon:6}, function(){
                        window.location.href = "index";
                    });
                } else {
                    layer.msg("角色信息修改失败，请重新操作", {time:2000, icon:5, shift:6}, function(){

                    });
                }
            }
        });
    });
});


function pageQuery(pageno) {
    var loadingIndex = null;


    var jsonData = {"pageno" : pageno, "pagesize" : 2};

    $.ajax({
        type : "POST",
        url  : "pageQuery",
        data : jsonData,
        beforeSend : function(){
            loadingIndex = layer.msg('处理中', {icon: 16});
        },
        success : function(result) {
            layer.close(loadingIndex);
            if ( result.success ) {
                // 局部刷新页面数据
                var tableContent = "";
                var pageContent = "";

                var rolePage = result.data;
                var roles = rolePage.datas;

                $.each(roles, function(i, role){
                    tableContent += '<tr>';
                    tableContent += '  <td>'+(i+1)+'</td>';
                    tableContent += '  <td><input type="checkbox" name="roleids" value="'+role.id+'"></td>';
                    tableContent += '  <td>'+role.name+'</td>';
                    if(role.status == 1)
                        tableContent += '  <td>启用</td>';
                    else
                        tableContent += '  <td>禁用</td>'
                    tableContent += '  <td>'+role.createTime+'</td>';
                    tableContent += '  <td>';
                    tableContent += '      <button type="button" onclick="goUpdatePage('+role.id+')" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>';
                    tableContent += '	  <button type="button" onclick="deleteRole('+role.id+', \''+role.name+'\')" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>';
                    tableContent += '  </td>';
                    tableContent += '</tr>';
                });

                if ( pageno > 1 ) {
                    pageContent += '<li><a href="#" onclick="pageQuery('+(pageno-1)+')">上一页</a></li>';
                }

                for ( var i = 1; i <= rolePage.totalno; i++ ) {
                    if ( i == pageno ) {
                        pageContent += '<li class="active"><a  href="#">'+i+'</a></li>';
                    } else {
                        pageContent += '<li ><a href="#" onclick="pageQuery('+i+')">'+i+'</a></li>';
                    }
                }

                if ( pageno < rolePage.totalno ) {
                    pageContent += '<li><a href="#" onclick="pageQuery('+(pageno+1)+')">下一页</a></li>';
                }

                $("#roleData").html(tableContent);
                $(".pagination").html(pageContent);
            } else {
                layer.msg("用户信息分页查询失败", {time:2000, icon:5, shift:6}, function(){

                });
            }
        }
    });
}

function deleteSelect() {
    var boxes = $("#roleData:checked");
    if(boxes.length == 0) {
        layer.msg("请选择需要删除的角色信息", {time:2000, icon:5, shift:6}, function(){

        });
    } else {
        layer.confirm("删除选择的角色信息, 是否继续",  {icon: 3, title:'提示'}, function(cindex){
            // 删除选择的用户信息
            $.ajax({
                type : "POST",
                url  : "deletes",
                data : $("#roleForm").serialize(),
                success : function(result) {
                    if ( result.success ) {
                        pageQuery(1);
                    } else {
                        layer.msg("角色信息删除失败", {time:2000, icon:5, shift:6}, function(){

                        });
                    }
                }
            });

            layer.close(cindex);
        }, function(cindex){
            layer.close(cindex);
        });
    }
}

function deleteRole(roleId, roleName) {
    layer.confirm("准备删除 【" + roleName+"】 角色的信息, 是否继续",  {icon: 3, title:'提示'}, function(cindex){
        // 删除选择的用户信息
        $.ajax({
            type : "POST",
            url  : "delete",
            data : {
                roleId:roleId
            },
            success : function(result) {
                if ( result.success ) {
                    pageQuery(1);
                } else {
                    layer.msg("角色信息删除失败", {time:2000, icon:5, shift:6}, function(){

                    });
                }
            }
        });

        layer.close(cindex);
    }, function(cindex){
        layer.close(cindex);
    });
}

function goUpdatePage(roleId) {
    window.location.href = "edit?roleid=" + roleId;
}