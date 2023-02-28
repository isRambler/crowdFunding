package com.cxy.service;

import com.cxy.constant.CrowdConstant;
import com.cxy.dao.UserMapper;
import com.cxy.exception.LoginAcctAlreadyInUseException;
import com.cxy.exception.LoginFailedException;
import com.cxy.pojo.Admin;
import com.cxy.pojo.User;
import com.cxy.util.CrowdUtil;
import com.cxy.util.PageResult;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.UUID;


public class UserServiceImpl implements UserService{

    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public int addUser(String account,String password,String email) {
        int i=0;
        String userPwdByMd5 = CrowdUtil.md5(password);
        String id = UUID.randomUUID().toString();
        String createTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        User user = new User(id, account, userPwdByMd5, email, createTime);
        try {
            i = userMapper.addUser(user);
        }catch (Exception e){
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public int addUserByAdmin(User user) {
        int i=0;
        String userPwd = user.getUserPwd();
        String userPwdByMd5 = CrowdUtil.md5(userPwd);
        user.setUserPwd(userPwdByMd5);
        String id = UUID.randomUUID().toString();
        user.setId(id);
        String createTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        user.setCreateTime(createTime);
        try {
            i = userMapper.addUser(user);
        }catch (Exception e){
            e.printStackTrace();
            if (e instanceof DuplicateKeyException){
                throw new LoginAcctAlreadyInUseException(CrowdConstant.MESSAGE_LOGIN_ACCT_ALREADY_IN_USE);
            }
        }
        return i;
    }

    @Override
    public void deleteUserByAccount(String account) {
        userMapper.deleteUserByAccount(account);
    }

    @Override
    public void updateUser(User user) {
        try{
            userMapper.updateUser(user);
        }catch (Exception e){
            if (e instanceof DuplicateKeyException){
                throw new LoginAcctAlreadyInUseException(CrowdConstant.MESSAGE_LOGIN_ACCT_ALREADY_IN_USE);
            }
        }
    }

    @Override
    public User queryUserByAccount(String account,String password) {
        User user = userMapper.queryUserByAccount(account);
        if (user==null){
            throw new LoginFailedException(CrowdConstant.MESSAGE_LOGIN_FAILED);
        }
        String userPwd = user.getUserPwd();
        String passwordByMd5 = CrowdUtil.md5(password);
        if (!Objects.equals(userPwd,passwordByMd5)){
            throw new LoginFailedException(CrowdConstant.MESSAGE_LOGIN_FAILED);
        }
        return user;
    }

    @Override
    public List<User> queryAllUser() {
        return userMapper.queryAllUser();
    }

    @Override
    public User showUserByAccount(String account) {
        return userMapper.queryUserByAccount(account);
    }

    @Override
    public PageInfo<User> getPageInfo(String keyword, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<User> userList = userMapper.selectUserByKeyword(keyword);
        return new PageInfo<>(userList);
    }

    @Override
    public PageInfo getPageInfoAll(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<User> userList = userMapper.selectAllUserByPageHelper();
        PageInfo pageInfo = new PageInfo(userList,5);
        return pageInfo;
    }

}
