package com.cxy.service;

import com.cxy.pojo.Project;
import com.github.pagehelper.PageInfo;

import java.math.BigInteger;

public interface ProjectService {
    void addProject(Project project,String picturePath);
    PageInfo<Project> getPageInfo(String keyword,Integer pageNum,Integer pageSize);
    PageInfo<Project> getPageInfoInExamine(String keyword,Integer pageNum,Integer pageSize);
    void changeStatus(String projectName);
    PageInfo<Project> getPageInfoInMyProject(String keyword,Integer pageNum,Integer pageSize,String account);
    void delProjectByName(String projectName);
    Project queryProjectByName(String projectName);
    Project queryProjectById(int id);
    void setSupportById(int id, int supportMoney);
    PageInfo<Project> getPageInfoInExamineAll(String keyword,Integer pageNum,Integer pageSize);
}
