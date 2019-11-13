package com.entity;

import java.io.Serializable;

public class Readdress implements Serializable {
    private Long readdressId;

    private Long readdressUserid;

    private String readdressName;

    private String readdressPhone;

    private String readdressAddress;

    private Integer readdressIsdefault;

    private String readdressPostcode;

    public Readdress() {
    }

    public Readdress(Long readdressId, Long readdressUserid, String readdressName, String readdressPhone, String readdressAddress, Integer readdressIsdefault, String readdressPostcode) {
        this.readdressId = readdressId;
        this.readdressUserid = readdressUserid;
        this.readdressName = readdressName;
        this.readdressPhone = readdressPhone;
        this.readdressAddress = readdressAddress;
        this.readdressIsdefault = readdressIsdefault;
        this.readdressPostcode = readdressPostcode;
    }

    public Long getReaddressId() {
        return readdressId;
    }

    public void setReaddressId(Long readdressId) {
        this.readdressId = readdressId;
    }

    public Long getReaddressUserid() {
        return readdressUserid;
    }

    public void setReaddressUserid(Long readdressUserid) {
        this.readdressUserid = readdressUserid;
    }

    public String getReaddressName() {
        return readdressName;
    }

    public void setReaddressName(String readdressName) {
        this.readdressName = readdressName == null ? null : readdressName.trim();
    }

    public String getReaddressPhone() {
        return readdressPhone;
    }

    public void setReaddressPhone(String readdressPhone) {
        this.readdressPhone = readdressPhone == null ? null : readdressPhone.trim();
    }

    public String getReaddressAddress() {
        return readdressAddress;
    }

    public void setReaddressAddress(String readdressAddress) {
        this.readdressAddress = readdressAddress == null ? null : readdressAddress.trim();
    }

    public Integer getReaddressIsdefault() {
        return readdressIsdefault;
    }

    public void setReaddressIsdefault(Integer readdressIsdefault) {
        this.readdressIsdefault = readdressIsdefault;
    }

    public String getReaddressPostcode() {
        return readdressPostcode;
    }

    public void setReaddressPostcode(String readdressPostcode) {
        this.readdressPostcode = readdressPostcode == null ? null : readdressPostcode.trim();
    }

    @Override
    public String toString() {
        return "Readdress{" +
                "readdressId=" + readdressId +
                ", readdressUserid=" + readdressUserid +
                ", readdressName='" + readdressName + '\'' +
                ", readdressPhone='" + readdressPhone + '\'' +
                ", readdressAddress='" + readdressAddress + '\'' +
                ", readdressIsdefault=" + readdressIsdefault +
                ", readdressPostcode='" + readdressPostcode + '\'' +
                '}';
    }
}