package com.atguigu.atcrowdfunding.service.impl;

import com.atguigu.atcrowdfunding.bean.User;
import com.atguigu.atcrowdfunding.dao.UserDao;
import com.atguigu.atcrowdfunding.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    public List<User> queryAll() {
        return userDao.queryAll();
    }

    public User query4Login(User user) {
        return userDao.query4Login(user);
    }

    public void insertUser(User user) {
        userDao.insertUser(user);
    }

    public List<User> queryPageData(Map<String, Object> map) {
        return userDao.queryPageData(map);
    }

    public int queryPageCount(Map<String, Object> map) {
        return userDao.queryPageCount(map);
    }

    public void deleteUsers(Map<String, Object> map) {
        userDao.deleteUsers(map);
    }

    public void deleteUser(Integer userid) {
        userDao.deleteUser(userid);
    }

    public User queryByUserid(Integer userid) {
        return userDao.queryByUserid(userid);
    }

    public void updateUser(User user) {
        userDao.updateUser(user);
    }
}
