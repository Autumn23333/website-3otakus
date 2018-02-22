package com.threeotakus.controller;

import com.threeotakus.model.User;
import com.threeotakus.service.UserServ;
import com.threeotakus.utils.LoginTool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 注解标注此类为springmvc的controller，url映射为""
@Controller
@RequestMapping("")
public class UserController {
    @Autowired
    private UserServ userServ;

    final static int LOGIN_MAX_TIME = 1 * 24 * 60 * 60; // MAX login time is 1 day for test

    //映射一个action
    @RequestMapping("/signup")
    public String signup() {
        return "signup";
    }

    @RequestMapping(value = "/submitsignup", method = RequestMethod.POST)
    public ModelAndView user
            (@RequestParam(value = "username") String username, @RequestParam(value = "password") String password) {
        ModelAndView model = new ModelAndView("signup_success");
        try {
            int rs = userServ.insertUser(username, password);
            if (rs == 0) {
                model.setViewName("signup");
                model.addObject("msg", "Sign up failed. Please try again later");
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.setViewName("signup");
            model.addObject("msg", "Sign up failed. Please try again later");
        }

        return model;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(HttpServletRequest request) {
        ModelAndView model = new ModelAndView();
        User loginUser = (User) request.getSession().getAttribute("loginUser");
        if (loginUser == null)
            model.setViewName("login");
        else
            model.setViewName("login_success");
        return model;
    }

    @RequestMapping(value = "/login_check", method = RequestMethod.POST)
    public ModelAndView login_check
            (@RequestParam(value = "username") String username, @RequestParam(value = "password") String password,
             HttpServletResponse response, HttpServletRequest request) {
        ModelAndView model = new ModelAndView();
        model.setViewName("login_success");
        User user = null;
        // Execute database query
        try {
            user = userServ.checkUserLogin(username, password);
        } catch (Exception e) {
            e.printStackTrace();
            model.setViewName("login");
            model.addObject("msg", "There is something wrong with server. Please try again later.");
        }

        // user==null => login failed
        if (user == null) {
            model.setViewName("login");
            model.addObject("msg", "Username or password is wrong.");
        } else {
            //自动登录cookie
            Cookie userNameCookie = new Cookie("uname", user.getUsername());
            Cookie passwordCookie = new Cookie("upid", LoginTool.pwd2cookiep(user.getPassword()));
            userNameCookie.setMaxAge(LOGIN_MAX_TIME);
            userNameCookie.setPath("/");
            passwordCookie.setMaxAge(LOGIN_MAX_TIME);
            passwordCookie.setPath("/");
            response.addCookie(userNameCookie);
            response.addCookie(passwordCookie);

            request.getSession().setAttribute("loginUser", user);
        }
        return model;
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        User loginUser = (User) request.getSession().getAttribute("loginUser");

        //删除登录cookie
        Cookie userNameCookie = new Cookie("uname", loginUser.getUsername());
        Cookie passwordCookie = new Cookie("upid", loginUser.getPassword());
        userNameCookie.setMaxAge(0);
        userNameCookie.setPath("/");
        passwordCookie.setMaxAge(0);
        passwordCookie.setPath("/");
        response.addCookie(userNameCookie);
        response.addCookie(passwordCookie);

        request.getSession().removeAttribute("loginUser");

        return "redirect:index";
    }
}