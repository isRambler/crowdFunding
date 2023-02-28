package com.cxy.service;

import com.cxy.pojo.Admin;
import com.cxy.pojo.User;
import com.cxy.util.PageResult;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {
    int addUser(String account,String password,String email);
    int addUserByAdmin(User user);
    void deleteUserByAccount(String account);
    void updateUser(User user);
    User queryUserByAccount(String account,String password);
    List<User> queryAllUser();
    User showUserByAccount(String account);
    PageInfo<User> getPageInfo(String keyword,Integer pageNum,Integer pageSize);
    PageInfo getPageInfoAll(Integer pageNum,Integer pageSize);
}
