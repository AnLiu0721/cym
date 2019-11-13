package com.entity;

import java.io.Serializable;

public class Picture implements Serializable {
    private Long phId;

    private Long phProid;

    private Integer phKind;

    private String phAdress;

    public Picture() {
    }

    public Picture(Long phId, Long phProid, Integer phKind, String phAdress) {
        this.phId = phId;
        this.phProid = phProid;
        this.phKind = phKind;
        this.phAdress = phAdress;
    }

    public Long getPhId() {
        return phId;
    }

    public void setPhId(Long phId) {
        this.phId = phId;
    }

    public Long getPhProid() {
        return phProid;
    }

    public void setPhProid(Long phProid) {
        this.phProid = phProid;
    }

    public Integer getPhKind() {
        return phKind;
    }

    public void setPhKind(Integer phKind) {
        this.phKind = phKind;
    }

    public String getPhAdress() {
        return phAdress;
    }

    public void setPhAdress(String phAdress) {
        this.phAdress = phAdress == null ? null : phAdress.trim(); }

    @Override
	public String toString() {
		return "Picture [phId=" + phId + ", phProid=" + phProid + ", phKind="
				+ phKind + ", phAdress=" + phAdress + "]";
	}
}