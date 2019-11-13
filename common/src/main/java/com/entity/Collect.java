package com.entity;

import java.io.Serializable;
import java.util.Date;

public class Collect implements Serializable{
    private Long collectId;

    private Long collectUserid;

    private Long collectProid;

    private Date collectData;

    public Collect() {
    }

    public Collect(Long collectId, Long collectUserid, Long collectProid, Date collectData) {
        this.collectId = collectId;
        this.collectUserid = collectUserid;
        this.collectProid = collectProid;
        this.collectData = collectData;
    }

    public Long getCollectId() {
        return collectId;
    }

    public void setCollectId(Long collectId) {
        this.collectId = collectId;
    }

    public Long getCollectUserid() {
        return collectUserid;
    }

    public void setCollectUserid(Long collectUserid) {
        this.collectUserid = collectUserid;
    }

    public Long getCollectProid() {
        return collectProid;
    }

    public void setCollectProid(Long collectProid) {
        this.collectProid = collectProid;
    }

    public Date getCollectData() {
        return collectData;
    }

    public void setCollectData(Date collectData) {
        this.collectData = collectData;
    }


    public String toString() {
        return "Collect{" +
                "collectId=" + collectId +
                ", collectUserid=" + collectUserid +
                ", collectProid=" + collectProid +
                ", collectData=" + collectData +
                '}';
    }
}