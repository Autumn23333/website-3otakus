package com.threeotakus.service;

import com.threeotakus.model.User;


public interface UserServ {
    User selectUserByName(String name) throws Exception;
    User selectUserByEmail(String email) throws Exception;
    int insertUser(String username, String password, String email) throws Exception;
    User checkUserLogin(String username_email, String password) throws Exception;
    User checkUserDirectLogin(String username, String password) throws Exception;
    String checkUnameExisted(String uname) throws Exception;
    String checkEmailExisted(String email) throws Exception;
}
