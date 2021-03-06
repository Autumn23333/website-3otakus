package com.threeotakus.model;

import java.util.Date;

public class AccessLog {
    private int id;
    private String ip;
    private String session;
    private Date access_time;
    private Date block_time;
    private String access_url;
    private String access_para;
    private String access_method;

    public AccessLog() {
    }

    public AccessLog(String ip, String session, Date access_time, Date block_time,
                     String access_url, String access_para, String access_method) {
        this.ip = ip;
        this.session = session;
        this.access_time = access_time;
        this.block_time = block_time;
        this.access_url = access_url;
        this.access_para = access_para;
        this.access_method = access_method;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getSession() {
        return session;
    }

    public void setSession(String session) {
        this.session = session;
    }

    public Date getAccess_time() {
        return access_time;
    }

    public void setAccess_time(Date access_time) {
        this.access_time = access_time;
    }

    public Date getBlock_time() {
        return block_time;
    }

    public void setBlock_time(Date block_time) {
        this.block_time = block_time;
    }

    public String getAccess_url() {
        return access_url;
    }

    public void setAccess_url(String access_url) {
        this.access_url = access_url;
    }

    public String getAccess_para() {
        return access_para;
    }

    public void setAccess_para(String access_para) {
        this.access_para = access_para;
    }

    public String getAccess_method() {
        return access_method;
    }

    public void setAccess_method(String access_method) {
        this.access_method = access_method;
    }

    @Override
    public String toString() {
        return "AccessLog{" +
                "id=" + id +
                ", ip='" + ip + '\'' +
                ", session='" + session + '\'' +
                ", access_time=" + access_time +
                ", block_time=" + block_time +
                ", access_url='" + access_url + '\'' +
                ", access_para='" + access_para + '\'' +
                ", access_method='" + access_method + '\'' +
                '}';
    }
}
