package com.cxy.dao;

import com.cxy.pojo.Admin;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface AdminMapper {
    int addAdmin(Admin admin);
    int deleteAdminByAccount(@Param("account") String account);
    int updateAdmin(Admin admin);
    Admin queryAdminByAccount(String account);
    List<Admin> queryAllAdmin();
}
