package com.cxy.interceptor;

import com.cxy.constant.CrowdConstant;
import com.cxy.exception.AccessForbiddenException;
import com.cxy.pojo.User;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptorOfUser extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 1.通过request对象获取Session对象
        HttpSession session = request.getSession();
        // 2.尝试从Session域获取User对象
        User user = (User) session.getAttribute(CrowdConstant.ATTR_NAME_LOGIN_USER);
        // 3.判断User对象是否为空
        if (user == null) {
            // 4.抛出异常
            throw new AccessForbiddenException(CrowdConstant.MESSAGE_ACCESS_FORBIDDEN);
        }
        // 5. 若user不为空，则返回true放行
        return true;
    }
}
