package com.entity;

import java.io.Serializable;

public class Manager implements Serializable {
    private Long managerId;

    private String managerUsername;

    private String managerPassword;

    private String managerName;

    private String managerPhone;

    public Manager(Long managerId, String managerUsername, String managerPassword, String managerName, String managerPhone) {
        this.managerId = managerId;
        this.managerUsername = managerUsername;
        this.managerPassword = managerPassword;
        this.managerName = managerName;
        this.managerPhone = managerPhone;
    }

    public Long getManagerId() {
        return managerId;
    }

    public void setManagerId(Long managerId) {
        this.managerId = managerId;
    }

    public String getManagerUsername() {
        return managerUsername;
    }

    public void setManagerUsername(String managerUsername) {
        this.managerUsername = managerUsername == null ? null : managerUsername.trim();
    }

    public String getManagerPassword() {
        return managerPassword;
    }

    public void setManagerPassword(String managerPassword) {
        this.managerPassword = managerPassword == null ? null : managerPassword.trim();
    }

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName == null ? null : managerName.trim();
    }

    public String getManagerPhone() {
        return managerPhone;
    }

    public void setManagerPhone(String managerPhone) {
        this.managerPhone = managerPhone == null ? null : managerPhone.trim();
    }
}