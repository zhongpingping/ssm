package com.atguigu.atcrowdfunding.dao;

import com.atguigu.atcrowdfunding.bean.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserDao {

    @Select("select * from t_user")
    public List<User> queryAll();

    @Select("select id, username, actual_name actualName, email from t_user where username=#{username} and password=#{password}")
    User query4Login(User user);
}
