package com.cxy.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigInteger;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Project {
    private int id;
    private String projectName;
    private String projectDescription;
    private BigInteger money;
    private int day;
    private int status;
    private String deployDate;
    private int supportMoney;
    private int supporter;
    private String memberName;
    private String createDate;
    private String picturePath;
}
