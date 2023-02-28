package com.cxy.dao;

import com.cxy.pojo.Project;
import org.apache.ibatis.annotations.Param;

import java.math.BigInteger;
import java.util.List;

public interface ProjectMapper {
    int addProject(Project project);
    int delProjectByName(int id);
    Project queryProjectById(int id);
    List<Project> queryAllProject();
    List<Project> selectProjectByKeyword_1(String keyword);
    List<Project> selectProjectByKeyword_0(String keyword);
    Project queryProjectByName(String projectName);
    int changeStatusToOne(Project project);
    List<Project> selectProjectByKeywordInMyProject(@Param("keyword") String keyword,@Param("account") String account);
    int delProjectByProjectName(String projectName);
    int setSupportById(@Param("id") int id, @Param("supportMoney") int supportMoney);
    List<Project> selectProjectByKeyword_10(String keyword);

}
