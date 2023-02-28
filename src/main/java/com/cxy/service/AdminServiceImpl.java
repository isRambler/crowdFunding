package com.cxy.service;

import com.cxy.constant.CrowdConstant;
import com.cxy.dao.AdminMapper;
import com.cxy.exception.LoginFailedException;
import com.cxy.pojo.Admin;
import com.cxy.util.CrowdUtil;

import java.util.List;
import java.util.Objects;


public class AdminServiceImpl implements AdminService{

    private AdminMapper adminMapper;

    public void setAdminMapper(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    @Override
    public int addAdmin(Admin admin) {
        return adminMapper.addAdmin(admin);
    }

    @Override
    public int deleteAdminByAccount(String account) {
        return adminMapper.deleteAdminByAccount(account);
    }

    @Override
    public int updateAdmin(Admin admin) {
        return adminMapper.updateAdmin(admin);
    }

    @Override
    public Admin queryAdminByAccount(String account,String password) {
        Admin admin = adminMapper.queryAdminByAccount(account);
        if (admin==null){
            throw new LoginFailedException(CrowdConstant.MESSAGE_LOGIN_FAILED);
        }
        String adminPwd = admin.getAdminPwd();
        String passwordByMd5 = CrowdUtil.md5(password);
        if(!Objects.equals(adminPwd,passwordByMd5)){
            throw new LoginFailedException(CrowdConstant.MESSAGE_LOGIN_FAILED);
        }
        return admin;

    }

    @Override
    public List<Admin> queryAllAdmin() {
        return adminMapper.queryAllAdmin();
    }


}
