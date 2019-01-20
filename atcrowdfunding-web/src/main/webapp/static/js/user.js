$(function () {
    pageQuery(1);

    $("#addUser").click(function () {
        var inputUsername = $("#inputUsername").val();
        var inputActualname = $("#inputActualname").val();
        var inputPassword = $("#inputPassword").val();
        var inputEmail = $("#inputEmail").val();

        if (inputUsername == "") {
            layer.msg("登录账号不能为空, 请输入", {time:1000, icon:5, shift:6}, function () {

            });
            return false;
        }

        if(inputActualname == "") {
            layer.msg("用户名称不能为空, 请输入", {time:1000, icon:5, shift:6}, function () {

            });
            return false;
        }

        if(inputPassword == "") {
            layer.msg("登录密码不能为空, 请输入", {time:1000, icon:5, shift:6}, function () {

            });
            return false;
        }

        var loadingIndex = null;

        $.ajax({
            type:"post",
            url:"insert",
            data:{
                username:inputUsername,
                actualName:inputActualname,
                password:inputPassword,
                email:inputEmail
            },
            beforeSend:function () {
                loadingIndex = layer.msg('处理中', {icon: 16});
            },
            success : function(result) {
                layer.close(loadingIndex);
                if ( result.success ) {
                    layer.msg("用户信息保存成功", {time:1000, icon:6}, function(){
                        window.location.href = "index";
                    });
                } else {
                    layer.msg("用户信息保存失败，请重新操作", {time:2000, icon:5, shift:6}, function(){

                    });
                }
            }
        });

    });


    $("#saveUser").click(function () {
        var inputId = $("#inputId").val();
        var inputUsername = $("#inputUsername").val();
        var inputActualname = $("#inputActualname").val();
        var inputPassword = $("#inputPassword").val();
        var inputEmail = $("#inputEmail").val();

        if (inputUsername == "") {
            layer.msg("登录账号不能为空, 请输入", {time:1000, icon:5, shift:6}, function () {

            });
            return false;
        }

        if(inputActualname == "") {
            layer.msg("用户名称不能为空, 请输入", {time:1000, icon:5, shift:6}, function () {

            });
            return false;
        }

        if(inputPassword == "") {
            layer.msg("登录密码不能为空, 请输入", {time:1000, icon:5, shift:6}, function () {

            });
            return false;
        }

        var loadingIndex = null;

        $.ajax({
            type:"post",
            url:"update",
            data:{
                id:inputId,
                username:inputUsername,
                actualName:inputActualname,
                password:inputPassword,
                email:inputEmail
            },
            beforeSend:function () {
                loadingIndex = layer.msg('处理中', {icon: 16});
            },
            success : function(result) {
                layer.close(loadingIndex);
                if ( result.success ) {
                    layer.msg("用户信息修改成功", {time:1000, icon:6}, function(){
                        window.location.href = "index";
                    });
                } else {
                    layer.msg("用户信息修改失败，请重新操作", {time:2000, icon:5, shift:6}, function(){

                    });
                }
            }
        });
    });

});

function deleteSelect() {
    var boxes = $("#userData :checked");
    if(boxes.length == 0) {
        layer.msg("请选择需要删除的用户信息", {time:2000, icon:5, shift:6}, function(){

        });
    } else {
        layer.confirm("删除选择的用户信息, 是否继续",  {icon: 3, title:'提示'}, function(cindex){
            // 删除选择的用户信息
            $.ajax({
                type : "POST",
                url  : "deletes",
                data : $("#userForm").serialize(),
                success : function(result) {
                    if ( result.success ) {
                        pageQuery(1);
                    } else {
                        layer.msg("用户信息删除失败", {time:2000, icon:5, shift:6}, function(){

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

                var userPage = result.data;
                var users = userPage.datas;

                $.each(users, function(i, user){
                    tableContent += '<tr>';
                    tableContent += '  <td>'+(i+1)+'</td>';
                    tableContent += '  <td><input type="checkbox" name="userids" value="'+user.id+'"></td>';
                    tableContent += '  <td>'+user.username+'</td>';
                    tableContent += '  <td>'+user.actualName+'</td>';
                    tableContent += '  <td>'+user.email+'</td>';
                    tableContent += '  <td>'+user.createTime+'</td>';
                    tableContent += '  <td>';
                    tableContent += '      <button type="button" onclick="goAssignPage('+user.id+')" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button>';
                    tableContent += '      <button type="button" onclick="goUpdatePage('+user.id+')" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>';
                    tableContent += '	  <button type="button" onclick="deleteUser('+user.id+', \''+user.username+'\')" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>';
                    tableContent += '  </td>';
                    tableContent += '</tr>';
                });

                if ( pageno > 1 ) {
                    pageContent += '<li><a href="#" onclick="pageQuery('+(pageno-1)+')">上一页</a></li>';
                }

                for ( var i = 1; i <= userPage.totalno; i++ ) {
                    if ( i == pageno ) {
                        pageContent += '<li class="active"><a  href="#">'+i+'</a></li>';
                    } else {
                        pageContent += '<li ><a href="#" onclick="pageQuery('+i+')">'+i+'</a></li>';
                    }
                }

                if ( pageno < userPage.totalno ) {
                    pageContent += '<li><a href="#" onclick="pageQuery('+(pageno+1)+')">下一页</a></li>';
                }

                $("#userData").html(tableContent);
                $(".pagination").html(pageContent);
            } else {
                layer.msg("用户信息分页查询失败", {time:2000, icon:5, shift:6}, function(){

                });
            }
        }
    });
}

function deleteUser(userid, username) {
    layer.confirm("准备删除 【" + username+"】 用户的信息, 是否继续",  {icon: 3, title:'提示'}, function(cindex){
        // 删除选择的用户信息
        $.ajax({
            type : "POST",
            url  : "delete",
            data : {
                userid:userid
            },
            success : function(result) {
                if ( result.success ) {
                    pageQuery(1);
                } else {
                    layer.msg("用户信息删除失败", {time:2000, icon:5, shift:6}, function(){

                    });
                }
            }
        });

        layer.close(cindex);
    }, function(cindex){
        layer.close(cindex);
    });
}

function goUpdatePage(userid) {
    window.location.href = "edit?userid=" + userid;
}