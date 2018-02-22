package com.threeotakus.service;

import com.threeotakus.dao.UserDAO;
import com.threeotakus.model.User;
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
        System.out.print(user);
        return user;
    }

    @Override
    public int insertUser(String username, String password) throws Exception {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String hashedPassword = passwordEncoder.encode(password);
        User newuser = new User(-1, username, hashedPassword, new Date());
        int rs;
        rs = userDAO.insertUser(newuser);
        System.out.println("rs="+rs);
        return rs;
    }

    @Override
    public User checkUserLogin(String username, String password) throws Exception {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        User user = userDAO.selectUserByName(username);
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
}
