package com.atguigu.atcrowdfunding.service;

import com.atguigu.atcrowdfunding.bean.Role;
import com.atguigu.atcrowdfunding.bean.User;

import java.util.List;
import java.util.Map;

public interface RoleService {
    List<Role> queryPageData(Map<String,Object> map);

    int queryPageCount(Map<String,Object> map);

    void insert(Role role);

    void deleteRoles(Map<String,Object> map);

    Role queryRoleById(Integer roleid);

    void updateRole(Role role);

    void deleteRoleById(Integer roleId);
}
