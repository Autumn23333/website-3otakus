package com.threeotakus.model;

public class VideoPage {
    private int oid;
    private int pid;
    private String ptitle;
    private int ispub;

    public VideoPage() {
    }

    public VideoPage(int oid, int pid, String ptitle) {
        this.oid = oid;
        this.pid = pid;
        this.ptitle = ptitle;
        this.ispub = 0;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPtitle() {
        return ptitle;
    }

    public void setPtitle(String ptitle) {
        this.ptitle = ptitle;
    }

    public int getIspub() {
        return ispub;
    }

    public void setIspub(int ispub) {
        this.ispub = ispub;
    }

    @Override
    public String toString() {
        return "VideoPage{" +
                "oid=" + oid +
                ", pid=" + pid +
                ", ptitle='" + ptitle + '\'' +
                ", ispub=" + ispub +
                '}';
    }
}
