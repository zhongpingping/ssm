package com.atguigu.atcrowdfunding.service.impl;

import com.atguigu.atcrowdfunding.bean.Role;
import com.atguigu.atcrowdfunding.bean.User;
import com.atguigu.atcrowdfunding.dao.RoleDao;
import com.atguigu.atcrowdfunding.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;

    public List<Role> queryPageData(Map<String, Object> map) {
        return roleDao.queryPageData(map);
    }

    public int queryPageCount(Map<String, Object> map) {
        return roleDao.queryPageCount(map);
    }

    public void insert(Role role) {
        roleDao.insert(role);
    }

    public void deleteRoles(Map<String, Object> map) {
        roleDao.deleteRoles(map);
    }

    public Role queryRoleById(Integer roleid) {
        return roleDao.queryRoleById(roleid);
    }

    public void updateRole(Role role) {
        roleDao.updateRole(role);
    }

    public void deleteRoleById(Integer roleId) {
        roleDao.deleteRoleById(roleId);
    }


}
