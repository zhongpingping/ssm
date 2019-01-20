package com.atguigu.atcrowdfunding.dao;

import com.atguigu.atcrowdfunding.bean.Role;
import com.atguigu.atcrowdfunding.bean.User;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface RoleDao {

    List<Role> queryPageData(Map<String,Object> map);

    int queryPageCount(Map<String,Object> map);

    void insert(Role role);

    void deleteRoles(Map<String,Object> map);

    Role queryRoleById(Integer roleid);

    void updateRole(Role role);

    void deleteRoleById(Integer roleId);
}
