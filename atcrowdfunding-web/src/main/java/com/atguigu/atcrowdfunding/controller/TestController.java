package com.atguigu.atcrowdfunding.controller;

import com.atguigu.atcrowdfunding.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import java.util.HashMap;
import java.util.Map;

@Controller
public class TestController {

    @Autowired
    private UserService userService;

    @ResponseBody
    @RequestMapping("/queryAll")
    public Object queryAll() {
        return userService.queryAll();
    }

//    @RequestMapping("/index")
//    public String index() {
//        return "sys/index";
//    }

    @ResponseBody
    @RequestMapping("/json")
    public Object json() {
        Map map = new HashMap();
        map.put("name", "zhongpingping");
        return map;
    }

//
//    @RequestMapping("/login")
//    public String login() {
//        return "sys/login";
//    }
}
