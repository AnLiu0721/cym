package com.entity;

import java.io.Serializable;

public class Orelation implements Serializable {
    private Long orderrelationId;

    private Long orderrelationOrderid;

    private Long orderrelationProid;

    private Long orderrelationPronum;

    public Orelation() {
    }

    public Orelation(Long orderrelationId, Long orderrelationOrderid, Long orderrelationProid, Long orderrelationPronum) {
        this.orderrelationId = orderrelationId;
        this.orderrelationOrderid = orderrelationOrderid;
        this.orderrelationProid = orderrelationProid;
        this.orderrelationPronum = orderrelationPronum;
    }

    public Long getOrderrelationId() {
        return orderrelationId;
    }

    public void setOrderrelationId(Long orderrelationId) {
        this.orderrelationId = orderrelationId;
    }

    public Long getOrderrelationOrderid() {
        return orderrelationOrderid;
    }

    public void setOrderrelationOrderid(Long orderrelationOrderid) {
        this.orderrelationOrderid = orderrelationOrderid;
    }

    public Long getOrderrelationProid() {
        return orderrelationProid;
    }

    public void setOrderrelationProid(Long orderrelationProid) {
        this.orderrelationProid = orderrelationProid;
    }

    public Long getOrderrelationPronum() {
        return orderrelationPronum;
    }

    public void setOrderrelationPronum(Long orderrelationPronum) {
        this.orderrelationPronum = orderrelationPronum;
    }

    @Override
    public String toString() {
        return "Orelation{" +
                "orderrelationId=" + orderrelationId +
                ", orderrelationOrderid=" + orderrelationOrderid +
                ", orderrelationProid=" + orderrelationProid +
                ", orderrelationPronum=" + orderrelationPronum +
                '}';
    }
}