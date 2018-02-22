package com.threeotakus.utils;

public class LoginTool {
    public static String cookiep2pwd(String cookiep) {
        return "$2a$10$"+cookiep;
    }

    public static String pwd2cookiep(String pwd) {
        return pwd.substring(7);
    }
}
