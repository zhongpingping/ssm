package com.atguigu.atcrowdfunding.service;

import com.atguigu.atcrowdfunding.bean.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    public List<User> queryAll();

    User query4Login(User user);


    void insertUser(User user);

    List<User> queryPageData(Map<String,Object> map);

    int queryPageCount(Map<String, Object> map);

    void deleteUsers(Map<String,Object> map);

    void deleteUser(Integer userid);
}
