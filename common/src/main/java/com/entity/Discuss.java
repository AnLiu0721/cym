package com.entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Discuss implements Serializable {
    private Long discussId;

    private Long discussUserid;

    private Long discussProid;

    private String discussContect;

    private Date discussTime;

    private Integer discussMayi;

    private String discussdtimes;

    private Users users;
    public Discuss() {
    }

    public Discuss(Long discussId, Long discussUserid, Long discussProid, String discussContect, Date discussTime, Integer discussMayi) {
        this.discussId = discussId;
        this.discussUserid = discussUserid;
        this.discussProid = discussProid;
        this.discussContect = discussContect;
        this.discussTime = discussTime;
        this.discussMayi = discussMayi;
    }

    public Long getDiscussId() {
        return discussId;
    }

    public void setDiscussId(Long discussId) {
        this.discussId = discussId;
    }

    public Long getDiscussUserid() {
        return discussUserid;
    }

    public void setDiscussUserid(Long discussUserid) {
        this.discussUserid = discussUserid;
    }

    public Long getDiscussProid() {
        return discussProid;
    }

    public void setDiscussProid(Long discussProid) {
        this.discussProid = discussProid;
    }

    public String getDiscussContect() {
        return discussContect;
    }

    public void setDiscussContect(String discussContect) {
        this.discussContect = discussContect == null ? null : discussContect.trim();
    }

    public Date getDiscussTime() {
        return discussTime;
    }

    public void setDiscussTime(Date discussTime) {
        this.discussTime = discussTime;
    }

    public Integer getDiscussMayi() {
        return discussMayi;
    }

    public void setDiscussMayi(Integer discussMayi) {
        this.discussMayi = discussMayi;
    }

    public String getDiscussdtimes() {
        if(discussTime!=null){
            SimpleDateFormat sm=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            return sm.format(discussTime);
        }else{
            return "";
        }
    }
    public Users getUsers() {
        return users;
    }
    public void setUsers(Users users) {
        this.users = users;
    }

    @Override
    public String toString() {
        return "Discuss{" +
                "discussId=" + discussId +
                ", discussUserid=" + discussUserid +
                ", discussProid=" + discussProid +
                ", discussContect='" + discussContect + '\'' +
                ", discussTime=" + discussTime +
                ", discussMayi=" + discussMayi +
                ", discussdtimes='" + discussdtimes + '\'' +
                ", users=" + users +
                '}';
    }

    public void setDiscussdtimes(String discussdtimes) {
        this.discussdtimes = discussdtimes;
    }
}