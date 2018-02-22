package com.threeotakus.model;

import java.util.Date;

public class Video {
    private int oid;
    private String title;
    private int author;
    private String description;
    private String cover;
    private String permission;
    private Date ctime;

    public Video(int oid, String title, int author, String description, String cover, String permission, Date ctime) {
        this.oid = oid;
        this.title = title;
        this.author = author;
        this.description = description;
        this.cover = cover;
        this.permission = permission;
        this.ctime = ctime;
    }

    public Video(String title, int author, String description, String cover, String permission) {
        this.oid = -1;
        this.title = title;
        this.author = author;
        this.description = description;
        this.cover = cover;
        this.permission = permission;
        this.ctime = new Date();
    }

    public Video() {
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getAuthor() {
        return author;
    }

    public void setAuthor(int author) {
        this.author = author;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public Date getCtime() {
        return ctime;
    }

    public void setCtime(Date ctime) {
        this.ctime = ctime;
    }

    @Override
    public String toString() {
        return "Video{" +
                "oid=" + oid +
                ", title='" + title + '\'' +
                ", author=" + author +
                ", description='" + description + '\'' +
                ", cover='" + cover + '\'' +
                ", permission=" + permission +
                '}';
    }
}
