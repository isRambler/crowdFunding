package com.cxy.crowd;

import com.cxy.pojo.Admin;
import com.cxy.pojo.User;
import com.cxy.service.AdminService;
import com.cxy.service.UserService;
import com.cxy.util.CrowdUtil;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CrowdTest {

    @Test
    public void testInsertAdmin(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        AdminService adminServiceImpl = (AdminService) context.getBean("AdminServiceImpl");

        Admin admin;
        String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        String password="123123";
        String md5 = CrowdUtil.md5(password);
        Admin cxy = new Admin(1, "cxy", md5, "1295423769@qq.com", date);
        int i = adminServiceImpl.addAdmin(cxy);
        if (i>0){
            System.out.println("success");
        }
    }

//    @Test
//    public void testInsertUser(){
//        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//        UserService userServiceImpl = (UserService) context.getBean("UserServiceImpl");
//
//        Admin admin;
//        String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
//        String password="123123";
//        String md5 = CrowdUtil.md5(password);
//        User cxy = new User("1", "tom", md5, "1295423768@qq.com", date);
//        int i = userServiceImpl.addUser(cxy);
//        if (i>0){
//            System.out.println("success");
//        }
//    }
}
