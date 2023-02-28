package com.cxy.controller;

import com.cxy.constant.CrowdConstant;
import com.cxy.pojo.Project;
import com.cxy.pojo.User;
import com.cxy.service.ProjectService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.util.UUID;

@Controller
@RequestMapping("/project")
public class ProjectController {
    @Autowired
    private ProjectService projectService;

    @RequestMapping("/submit_1")
    public String savaProjectBasicInfo(Project project,HttpSession httpSession){
        httpSession.setAttribute("project",project);
        return "submit-success";
    }

    @RequestMapping("submit_2")
    public String saveProjectPicture(HttpSession httpSession,@RequestParam("picture")CommonsMultipartFile picture,HttpServletRequest request) throws IOException {
        String uploadFileName = picture.getOriginalFilename();
        String uploadPath = request.getServletContext().getRealPath("upload");
        File uploadfile = new File(uploadPath);
        if (!uploadfile.exists()){
            uploadfile.mkdir();
        }
        String fileName = uploadFileName.substring(uploadFileName.lastIndexOf("/") + 1);
        String fileExName = uploadFileName.substring(uploadFileName.lastIndexOf(".") + 1);
        String uuidPath= UUID.randomUUID().toString();
        String reaPath=uploadPath+"/"+uuidPath;
        File realPathFile = new File(reaPath);
        if (!realPathFile.exists()){
            realPathFile.mkdir();
        }
        InputStream is = picture.getInputStream();
        FileOutputStream os = new FileOutputStream(new File(reaPath, uploadFileName));

        int len=0;
        byte[] buffer = new byte[1024];
        while ((len=is.read(buffer))!=-1){
            os.write(buffer,0,len);
            os.flush();
        }
        os.close();
        is.close();

        String showPath="upload/"+uuidPath+"/"+fileName;
        Project project = (Project) httpSession.getAttribute("project");
        projectService.addProject(project,showPath);

        return "redirect:/project/myCenter";
    }

    @RequestMapping("/show")
    public String getPageInfo(@RequestParam(value = "keyword",defaultValue = "")String keyword, @RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum, @RequestParam(value = "pageSize",defaultValue = "3")Integer pageSize, ModelMap modelMap){
        PageInfo<Project> pageInfo = projectService.getPageInfo(keyword, pageNum, pageSize);
        modelMap.addAttribute(CrowdConstant.ATTR_NAME_PAGE_INFO,pageInfo);
        return "projects";
    }

    @RequestMapping("/myCenter")
    public String getPageInfoInMyProject(HttpSession httpSession,@RequestParam(value = "keyword",defaultValue = "")String keyword, @RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum, @RequestParam(value = "pageSize",defaultValue = "3")Integer pageSize, ModelMap modelMap){
        User user = (User) httpSession.getAttribute(CrowdConstant.ATTR_NAME_LOGIN_USER);
        String account = user.getAccount();
        PageInfo<Project> pageInfo = projectService.getPageInfoInMyProject(keyword, pageNum, pageSize, account);
        modelMap.addAttribute(CrowdConstant.ATTR_NAME_PAGE_INFO,pageInfo);
        return "myProject";
    }

    @RequestMapping("/remove/{projectName}/{pageNum}")
    public String delProjectByName(@PathVariable("projectName")String projectName,@PathVariable("pageNum")Integer pageNum){
        projectService.delProjectByName(projectName);
        return "redirect:/project/myCenter";
    }

    @RequestMapping("/targetProject/{id}")
    public String showTargetProject(ModelMap modelMap,@PathVariable("id")int id){
        Project project = projectService.queryProjectById(id);
        modelMap.addAttribute("project",project);
        return "targetProject";
    }

    @RequestMapping("/support/{id}")
    public String getSupport(@PathVariable("id")int id, @RequestParam(value = "supportMoney") int supportMoney){
        projectService.setSupportById(id, supportMoney);
        return "redirect:/project/targetProject/"+id;
    }

}
