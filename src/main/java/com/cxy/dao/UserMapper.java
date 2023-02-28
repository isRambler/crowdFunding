package com.cxy.dao;

import com.cxy.pojo.Admin;
import com.cxy.pojo.User;
import com.cxy.util.PageResult;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface UserMapper {
    int addUser(User user);
    int deleteUserByAccount(@Param("account") String account);
    int updateUser(User user);
    User queryUserByAccount(String account);
    List<User> queryAllUser();
    List<User> selectUserByKeyword(String keyword);
    List<User> selectAllUserByPageHelper();

}
