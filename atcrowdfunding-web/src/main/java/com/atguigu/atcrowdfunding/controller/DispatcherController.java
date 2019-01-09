package com.atguigu.atcrowdfunding.controller;

import com.atguigu.atcrowdfunding.bean.AJAXResult;
import com.atguigu.atcrowdfunding.bean.User;
import com.atguigu.atcrowdfunding.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class DispatcherController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login() {
        return "sys/login";
    }

    @RequestMapping("/index")
    public String index() {
        return "sys/index";
    }

    @ResponseBody
    @RequestMapping("/doLogin")
    public Object doLogin(User user, HttpSession session) {
        AJAXResult ajaxResult = new AJAXResult();

        User dbUser = userService.query4Login(user);
        if(dbUser != null) {
            session.setAttribute("loginUser", dbUser);
            ajaxResult.setSuccess(true);
        } else {
            ajaxResult.setSuccess(false);
            String data = "用户名或密码错误，请重新输入";
            ajaxResult.setData(data);
        }

        return ajaxResult;
    }

    @RequestMapping("/doLoginout")
    public String doLogout(HttpSession session) {
        session.invalidate();
        return "redirect:login";
    }
}