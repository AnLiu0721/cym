package com.entity;

import java.io.Serializable;
import java.util.List;

public class Protype implements Serializable {
    private Long protypeId;

    private String protypeName;

    private Long protypeParentid;

    private Integer protypeType;
    
    private List<Protype> typelist;

    public Protype() {
    }

    public Protype(Long protypeId, String protypeName, Long protypeParentid, Integer protypeType) {
        this.protypeId = protypeId;
        this.protypeName = protypeName;
        this.protypeParentid = protypeParentid;
        this.protypeType = protypeType;
    }

    public Long getProtypeId() {
        return protypeId;
    }

    public void setProtypeId(Long protypeId) {
        this.protypeId = protypeId;
    }

    public String getProtypeName() {
        return protypeName;
    }

    public void setProtypeName(String protypeName) {
        this.protypeName = protypeName == null ? null : protypeName.trim();
    }

    public Long getProtypeParentid() {
        return protypeParentid;
    }

    public void setProtypeParentid(Long protypeParentid) {
        this.protypeParentid = protypeParentid;
    }

    public Integer getProtypeType() {
        return protypeType;
    }

    public void setProtypeType(Integer protypeType) {
        this.protypeType = protypeType;
    }
    
    public List<Protype> getTypelist() {
		return typelist;
	}

	public void setTypelist(List<Protype> typelist) {
		this.typelist = typelist;
	}

	@Override
    public String toString() {
        return "Protype{" +
                "protypeId=" + protypeId +
                ", protypeName='" + protypeName + '\'' +
                ", protypeParentid=" + protypeParentid +
                ", protypeType=" + protypeType +
                '}';
    }
}