package com.threeotakus.service;

import com.threeotakus.dao.UserDAO;
import com.threeotakus.model.User;
import com.threeotakus.utils.LoginTool;
import com.threeotakus.utils.StringTable;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class UserServImpl implements UserServ {
    @Autowired
    private UserDAO userDAO;

    @Override
    public User selectUserByName(String username) throws Exception {
        User user = userDAO.selectUserByName(username);
        return user;
    }

    @Override
    public int insertUser(String username, String password, String email) throws Exception {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String hashedPassword = passwordEncoder.encode(password);
        User newuser = new User(-1, username, hashedPassword, new Date(), email);
        int rs;
        rs = userDAO.insertUser(newuser);
        System.out.println("rs="+rs);
        return rs;
    }

    @Override
    public User checkUserLogin(String username_email, String password) throws Exception {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        User user = userDAO.selectUserByNameEmail(username_email, username_email);
        if (user != null && passwordEncoder.matches(password, user.getPassword()))
            return user;
        else
            return null;
    }

    @Override
    public User checkUserDirectLogin(String username, String password) throws Exception {
        User user = userDAO.selectUserByName(username);
        if (user != null && password.equals(user.getPassword()))
            return user;
        else
            return null;

    }

    @Override
    public String checkUnameExisted(String uname) throws Exception {
        JSONObject obj = LoginTool.getAPITemplate();
        User user = selectUserByName(uname);
        if (user == null) {
            obj.put("code", -1);
            obj.put("state", StringTable.getValue("UsernameExisted"));
        } else {
            obj.put("code", 0);
            obj.put("state", StringTable.getValue("Success"));
        }
        return obj.toString();
    }

    @Override
    public User selectUserByEmail(String email) throws Exception {
        return userDAO.selectUserByEmail(email);
    }

    @Override
    public String checkEmailExisted(String email) throws Exception {
        JSONObject obj = LoginTool.getAPITemplate();
        User user = selectUserByEmail(email);
        if (user == null) {
            obj.put("code", -1);
            obj.put("state", StringTable.getValue("EmailExisted"));
        } else {
            obj.put("code", 0);
            obj.put("state", StringTable.getValue("Success"));
        }
        return obj.toString();
    }
}
