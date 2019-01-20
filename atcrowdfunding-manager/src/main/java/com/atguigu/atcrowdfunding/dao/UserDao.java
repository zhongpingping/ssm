package com.atguigu.atcrowdfunding.dao;

import com.atguigu.atcrowdfunding.bean.User;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface UserDao {

    @Select("select id, username, actual_name actualName, email, create_time createTime from t_user")
    List<User> queryAll();

    @Select("select id, username, actual_name actualName, email from t_user where username=#{username} and password=#{password}")
    User query4Login(User user);

    void insertUser(User user);

    List<User> queryPageData(Map<String,Object> map);

    int queryPageCount(Map<String, Object> map);

    void deleteUsers(Map<String,Object> userids);

    void deleteUser(Integer userid);

    User queryByUserid(Integer userid);

    void updateUser(User user);
}
