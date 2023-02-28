package com.cxy.controller;

import com.cxy.constant.CrowdConstant;
import com.cxy.pojo.Admin;
import com.cxy.pojo.Project;
import com.cxy.pojo.User;
import com.cxy.service.AdminService;
import com.cxy.service.AdminServiceImpl;
import com.cxy.service.ProjectService;
import com.cxy.service.UserService;
import com.cxy.util.PageResult;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.jws.soap.SOAPBinding;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;
    @Autowired
    private UserService userService;

    @Autowired
    private ProjectService projectService;

    @RequestMapping("/login")
    public String login(HttpSession httpSession,ModelMap modelMap, @RequestParam("account") String account, @RequestParam("password") String password){
        Admin admin = adminService.queryAdminByAccount(account, password);
        httpSession.setAttribute(CrowdConstant.ATTR_NAME_LOGIN_ADMIN,admin);
        modelMap.addAttribute("adminName",admin.getAccount());
        return "admin-main";
    }

    @RequestMapping("/showUser")
    public String getPageInfo(@RequestParam(value = "keyword",defaultValue = "")String keyword,@RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum, @RequestParam(value = "pageSize",defaultValue = "5")Integer pageSize, ModelMap modelMap){
        PageInfo<User> pageInfo = userService.getPageInfo(keyword, pageNum, pageSize);
        modelMap.addAttribute(CrowdConstant.ATTR_NAME_PAGE_INFO,pageInfo);
        return "admin-user";
    }

    @RequestMapping("/remove/{userAccount}/{pageNum}")
    public String remove(@PathVariable("userAccount")String userAccount,@PathVariable("pageNum")Integer pageNum){
        userService.deleteUserByAccount(userAccount);
        return "redirect:/admin/showUser?pageNum="+pageNum;
    }

    @RequestMapping("/save")
    public String save(User user){
        userService.addUserByAdmin(user);
        return "redirect:/admin/showUser?pageNum="+Integer.MAX_VALUE;
    }

    @RequestMapping("/edit/{userAccount}/{pageNum}")
    public String toEditPage(@PathVariable("userAccount")String userAccount,@PathVariable("pageNum")Integer pageNum,ModelMap modelMap){
        User user = userService.showUserByAccount(userAccount);
        modelMap.addAttribute("user",user);
        modelMap.addAttribute("pageNum",pageNum);
        return "admin-edit";
    }

    @RequestMapping("/update/{pageNum}")
    public String update(User user,@PathVariable("pageNum")Integer pageNum){
        userService.updateUser(user);
        return "redirect:/admin/showUser?pageNum="+pageNum;
    }

    @RequestMapping("/check")
    public String getPageInfoInExamine(@RequestParam(value = "keyword",defaultValue = "")String keyword, @RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum, @RequestParam(value = "pageSize",defaultValue = "3")Integer pageSize, ModelMap modelMap){
        PageInfo<Project> pageInfo = projectService.getPageInfoInExamine(keyword, pageNum, pageSize);
        modelMap.addAttribute(CrowdConstant.ATTR_NAME_PAGE_INFO,pageInfo);
        return "admin-check";
    }

    @RequestMapping("/success/{projectName}/{pageNum}")
    public String success(@PathVariable("projectName")String projectName, @PathVariable("pageNum")Integer pageNum){
        projectService.changeStatus(projectName);
        return "redirect:/admin/check";
    }

    @RequestMapping("/out")
    public String out(HttpSession httpSession){
        httpSession.removeAttribute(CrowdConstant.ATTR_NAME_LOGIN_ADMIN);
        return "redirect:/index.jsp";
    }

    @RequestMapping("/fail/{projectName}/{pageNum}")
    public String fail(@PathVariable("projectName")String projectName,@PathVariable("pageNum")Integer pageNum){
        projectService.delProjectByName(projectName);
        return "redirect:/admin/check?pageNum="+pageNum;
    }

    @RequestMapping("/checkAll")
    public String getPageInfoInExamineAll(@RequestParam(value = "keyword",defaultValue = "")String keyword, @RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum, @RequestParam(value = "pageSize",defaultValue = "3")Integer pageSize, ModelMap modelMap){
        PageInfo<Project> pageInfo = projectService.getPageInfoInExamineAll(keyword, pageNum, pageSize);
        modelMap.addAttribute(CrowdConstant.ATTR_NAME_PAGE_INFO,pageInfo);
        return "admin-checkAll";
    }

    @RequestMapping("delete/{projectName}/{pageNum}")
    public String delete(@PathVariable("projectName")String projectName,@PathVariable("pageNum")Integer pageNum){
        projectService.delProjectByName(projectName);
        return "redirect:/admin/checkAll?pageNum="+pageNum;
    }
}
