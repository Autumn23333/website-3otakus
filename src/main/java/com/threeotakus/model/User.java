package com.threeotakus.model;

import java.util.Date;

public class User {
    private int uid;
    private String username;
    private String password;
    private Date ctime;
    private int permission;
    private String email;

    public User() {
    }

    public User(int uid, String username, String password, Date ctime, String email) {
        this.uid = uid;
        this.username = username;
        this.password = password;
        this.ctime = ctime;
        this.email = email;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getCtime() {
        return ctime;
    }

    public void setCtime(Date ctime) {
        this.ctime = ctime;
    }

    public int getPermission() {
        return permission;
    }

    public void setPermission(int permission) {
        this.permission = permission;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", ctime=" + ctime +
                ", permission=" + permission +
                ", email='" + email + '\'' +
                '}';
    }
}
