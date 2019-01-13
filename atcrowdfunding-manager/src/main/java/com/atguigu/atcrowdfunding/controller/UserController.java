package com.atguigu.atcrowdfunding.controller;

import com.atguigu.atcrowdfunding.bean.AJAXResult;
import com.atguigu.atcrowdfunding.bean.Page;
import com.atguigu.atcrowdfunding.bean.User;
import com.atguigu.atcrowdfunding.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/index")
    public String index(Model model) {

        List<User> users = userService.queryAll();
        model.addAttribute("users", users);
        return "user/index";
    }

    @RequestMapping("/add")
    public String add() {
        return "user/add";
    }

    @ResponseBody
    @RequestMapping("/insert")
    public Object insert(User user) {
        AJAXResult result = new AJAXResult();
        try {
            long createTime = System.currentTimeMillis()/1000;
            user.setCreateTime(createTime);
            userService.insertUser(user);
            result.setSuccess(true);
        } catch (Exception e) {
            result.setSuccess(false);
        }

        return result;
    }

    @ResponseBody
    @RequestMapping("/pageQuery")
    public Object pageQuery(Integer pageno, Integer pagesize) {
        AJAXResult result = new AJAXResult();
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("start", (pageno-1)*pagesize);
            map.put("size", pagesize);
            List<User> users = userService.queryPageData(map);

            int totalsize = userService.queryPageCount(map);
            // 最大页码（总页码）
            int totalno = 0;
            if ( totalsize % pagesize == 0 ) {
                totalno = totalsize / pagesize;
            } else {
                totalno = totalsize / pagesize + 1;
            }

            Page<User> userPage = new Page<User>();
            userPage.setDatas(users);
            userPage.setPageno(pageno);
            userPage.setTotalno(totalno);
            userPage.setTotalsize(totalsize);

            result.setData(userPage);
            result.setSuccess(true);

        } catch (Exception e) {
            result.setSuccess(true);
        }

        return result;
    }

    @ResponseBody
    @RequestMapping("/deletes")
    public Object deletes(Integer[] userids) {
        AJAXResult result = new AJAXResult();
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("userids", userids);
            userService.deleteUsers(map);
            result.setSuccess(true);
        } catch (Exception e) {
            result.setSuccess(false);
        }

        return result;
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Object delete(Integer userid) {
        AJAXResult result = new AJAXResult();

        try {
            userService.deleteUser(userid);
            result.setSuccess(true);
        } catch (Exception e) {
            result.setSuccess(false);
        }

        return result;
    }

}
