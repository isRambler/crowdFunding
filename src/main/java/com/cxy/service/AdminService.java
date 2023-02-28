package com.cxy.service;

import com.cxy.pojo.Admin;
import com.cxy.pojo.User;
import com.cxy.util.PageResult;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminService {
    int addAdmin(Admin admin);
    int deleteAdminByAccount(@Param("account") String account);
    int updateAdmin(Admin admin);
    Admin queryAdminByAccount(String account,String password);
    List<Admin> queryAllAdmin();


}
