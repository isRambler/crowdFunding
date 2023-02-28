package com.cxy.controller;

import com.cxy.constant.CrowdConstant;
import com.cxy.pojo.User;
import com.cxy.service.UserService;
import com.cxy.util.PageResult;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.UUID;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/loginJudge")
    public String login(HttpSession httpSession,@Param("account") String account,@Param("password") String password){
        User user = userService.queryUserByAccount(account, password);
        httpSession.setAttribute(CrowdConstant.ATTR_NAME_LOGIN_USER,user);
        return "redirect:/project/show";
    }

    @RequestMapping("/setReg")
    public String reg(@Param("account") String account,@Param("password") String password,@Param("email") String email){
        int i = userService.addUser(account, password, email);
        return "login";
    }

    @ResponseBody
    @RequestMapping("/a1")
    public String a1(String account){
        String msg="";
        User user = userService.showUserByAccount(account);
        if (user!=null){
            msg="The username is incorrect";
        }else {
            msg="OK";
        }
        return msg;
    }

    @RequestMapping("/out")
    public String out(HttpSession httpSession){
        httpSession.removeAttribute(CrowdConstant.ATTR_NAME_LOGIN_USER);
        return "redirect:/index.jsp";
    }
}
