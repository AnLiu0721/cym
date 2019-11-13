package com.entity;

import java.io.Serializable;
import java.util.Date;

public class Users implements Serializable {
    private Long userId;

    private Long userNumber;

    private String userNickname;

    private String userPwd;

    private String userPhone;

    private String userEmail;

    private Date userData;

    private String userImg;

    public Users() {
    }

    public Users(Long userId, Long userNumber, String userNickname, String userPwd, String userPhone, String userEmail, Date userData, String userImg) {
        this.userId = userId;
        this.userNumber = userNumber;
        this.userNickname = userNickname;
        this.userPwd = userPwd;
        this.userPhone = userPhone;
        this.userEmail = userEmail;
        this.userData = userData;
        this.userImg = userImg;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getUserNumber() {
        return userNumber;
    }

    public void setUserNumber(Long userNumber) {
        this.userNumber = userNumber;
    }

    public String getUserNickname() {
        return userNickname;
    }

    public void setUserNickname(String userNickname) {
        this.userNickname = userNickname == null ? null : userNickname.trim();
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd == null ? null : userPwd.trim();
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone == null ? null : userPhone.trim();
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail == null ? null : userEmail.trim();
    }

    public Date getUserData() {
        return userData;
    }

    public void setUserData(Date userData) {
        this.userData = userData;
    }

    public String getUserImg() {
        return userImg;
    }

    public void setUserImg(String userImg) {
        this.userImg = userImg == null ? null : userImg.trim();
    }

    @Override
    public String toString() {
        return "Users{" +
                "userId=" + userId +
                ", userNumber=" + userNumber +
                ", userNickname='" + userNickname + '\'' +
                ", userPwd='" + userPwd + '\'' +
                ", userPhone='" + userPhone + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", userData=" + userData +
                ", userImg='" + userImg + '\'' +
                '}';
    }
}