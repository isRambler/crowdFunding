package com.cxy.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Admin {
    private int id;
    private String account;
    private String adminPwd;
    private String email;
    private String createTime;
}
