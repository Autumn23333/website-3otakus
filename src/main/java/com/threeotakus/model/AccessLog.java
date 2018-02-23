package com.threeotakus.model;

import java.util.Date;

public class AccessLog {
    private int id;
    private String ip;
    private String session;
    private Date access_time;
    private Date block_time;

    public AccessLog() {
    }

    public AccessLog(String ip, String session, Date access_time, Date block_time) {
        this.ip = ip;
        this.session = session;
        this.access_time = access_time;
        this.block_time = block_time;
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

    @Override
    public String toString() {
        return "AccessLog{" +
                "id=" + id +
                ", ip='" + ip + '\'' +
                ", session='" + session + '\'' +
                ", access_time=" + access_time +
                ", block_time=" + block_time +
                '}';
    }
}
