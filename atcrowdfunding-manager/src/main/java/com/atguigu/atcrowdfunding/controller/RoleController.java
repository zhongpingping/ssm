package com.atguigu.atcrowdfunding.controller;

import com.atguigu.atcrowdfunding.bean.AJAXResult;
import com.atguigu.atcrowdfunding.bean.Page;
import com.atguigu.atcrowdfunding.bean.Role;
import com.atguigu.atcrowdfunding.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @RequestMapping("index")
    public String index() {
        return "role/index";
    }

    @ResponseBody
    @RequestMapping("/pageQuery")
    public Object pageQuery(Integer pageno, Integer pagesize) {
        AJAXResult result = new AJAXResult();
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("start", (pageno-1)*pagesize);
            map.put("size", pagesize);
            List<Role> roles = roleService.queryPageData(map);

            int totalsize = roleService.queryPageCount(map);
            // 最大页码（总页码）
            int totalno = 0;
            if ( totalsize % pagesize == 0 ) {
                totalno = totalsize / pagesize;
            } else {
                totalno = totalsize / pagesize + 1;
            }

            Page<Role> rolePage = new Page<Role>();
            rolePage.setDatas(roles);
            rolePage.setPageno(pageno);
            rolePage.setTotalno(totalno);
            rolePage.setTotalsize(totalsize);

            result.setData(rolePage);
            result.setSuccess(true);

        } catch (Exception e) {
            result.setSuccess(true);
        }

        return result;
    }

    @RequestMapping("/add")
    public String add() {
        return "role/add";
    }

    @ResponseBody
    @RequestMapping("/insert")
    public Object insert(Role role) {
        AJAXResult result = new AJAXResult();
        try {
            long createTime = System.currentTimeMillis()/1000;
            role.setCreateTime(createTime);
            roleService.insert(role);
            result.setSuccess(true);
        } catch (Exception e) {
            result.setSuccess(false);
        }

        return result;
    }

    @ResponseBody
    @RequestMapping("/deletes")
    public Object deletes(Integer[] roleids) {
        AJAXResult result = new AJAXResult();
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("roleids", roleids);
            roleService.deleteRoles(map);
            result.setSuccess(true);
        }catch (Exception e) {
            result.setSuccess(false);
        }

        return result;
    }

    @RequestMapping("/edit")
    public String edit(Integer roleid, Model model) {
        Role role = roleService.queryRoleById(roleid);
        model.addAttribute("role", role);
        return "role/edit";
    }

    @ResponseBody
    @RequestMapping("/update")
    public Object update(Role role) {
        AJAXResult result = new AJAXResult();
        try{
            long createTime = System.currentTimeMillis()/1000;
            role.setCreateTime(createTime);
            roleService.updateRole(role);
            result.setSuccess(true);
        } catch (Exception e) {
            result.setSuccess(false);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Object delete(Integer roleId) {
        AJAXResult result = new AJAXResult();

        try {
            roleService.deleteRoleById(roleId);
            result.setSuccess(true);
        } catch ( Exception e) {
            result.setSuccess(false);
        }
        return result;
    }
}
