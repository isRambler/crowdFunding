package com.cxy.service;

import com.cxy.dao.ProjectMapper;
import com.cxy.pojo.Project;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class ProjectServiceImpl implements ProjectService{
    private ProjectMapper projectMapper;

    public void setProjectMapper(ProjectMapper projectMapper) {
        this.projectMapper = projectMapper;
    }

    @Override
    public void addProject(Project project,String picturePath) {
        project.setPicturePath(picturePath);
        project.setStatus(0);
        String createTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        project.setCreateDate(createTime);
        project.setSupportMoney(0);
        projectMapper.addProject(project);
    }

    @Override
    public PageInfo<Project> getPageInfo(String keyword, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Project> projectList = projectMapper.selectProjectByKeyword_1(keyword);
        return new PageInfo<>(projectList);
    }

    @Override
    public PageInfo<Project> getPageInfoInExamine(String keyword, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Project> projectList = projectMapper.selectProjectByKeyword_0(keyword);
        return new PageInfo<>(projectList);
    }

    @Override
    public void changeStatus(String projectName) {
        Project project = projectMapper.queryProjectByName(projectName);
        String deployDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        project.setDeployDate(deployDate);
        projectMapper.changeStatusToOne(project);
    }

    @Override
    public PageInfo<Project> getPageInfoInMyProject(String keyword, Integer pageNum, Integer pageSize, String account) {
        PageHelper.startPage(pageNum,pageSize);
        List<Project> projectList = projectMapper.selectProjectByKeywordInMyProject(keyword, account);
        return new PageInfo<>(projectList);
    }

    @Override
    public void delProjectByName(String projectName) {
        projectMapper.delProjectByProjectName(projectName);
    }

    @Override
    public Project queryProjectByName(String projectName) {
        Project project = projectMapper.queryProjectByName(projectName);
        return project;
    }

    @Override
    public Project queryProjectById(int id) {
        return projectMapper.queryProjectById(id);
    }

    @Override
    public void setSupportById(int id, int supportMoney) {
        projectMapper.setSupportById(id, supportMoney);
    }

    @Override
    public PageInfo<Project> getPageInfoInExamineAll(String keyword, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Project> projectList = projectMapper.selectProjectByKeyword_10(keyword);
        return new PageInfo<>(projectList);
    }
}
