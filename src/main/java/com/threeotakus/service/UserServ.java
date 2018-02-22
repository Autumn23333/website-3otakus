package com.threeotakus.service;

import com.threeotakus.model.User;


public interface UserServ {
    User selectUserByName(String name) throws Exception;
    int insertUser(String username, String password) throws Exception;
    User checkUserLogin(String username, String password) throws Exception;
    User checkUserDirectLogin(String username, String password) throws Exception;
}
