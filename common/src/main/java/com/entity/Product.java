package com.entity;

import org.apache.solr.client.solrj.beans.Field;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Product implements Serializable {
	private Long proId;

	@Field("id")
	private  String id;

    private String proCode;
	@Field("pro_name1")
    private String proName;

    private Long proKind;

    private Integer proNewpro;

    private Integer proPut;

    private Date proDate;

    private Long proImgid;
	@Field("pro_decrition1")
    private String proDecrition;
	@Field("pro_price1")
    private Double proPrice;
	@Field("pro_num1")
    private Integer proNum;

    private List<Picture> jpitlist;
    
    private List<Picture> xpitlist;

    public Product() {
    }

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Product(Long proId, String proCode, String proName, Long proKind, Integer proNewpro, Integer proPut, Date proDate, Long proImgid, String proDecrition, Double proPrice, Integer proNum) {
        this.proId = proId;
        this.proCode = proCode;
        this.proName = proName;
        this.proKind = proKind;
        this.proNewpro = proNewpro;
        this.proPut = proPut;
        this.proDate = proDate;
        this.proImgid = proImgid;
        this.proDecrition = proDecrition;
        this.proPrice = proPrice;
        this.proNum = proNum;
    }

    public Long getProId() {
        return proId;
    }

    public void setProId(Long proId) {
        this.proId = proId;
    }

    public String getProCode() {
        return proCode;
    }

    public void setProCode(String proCode) {
        this.proCode = proCode == null ? null : proCode.trim();
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName == null ? null : proName.trim();
    }

    public Long getProKind() {
        return proKind;
    }

    public void setProKind(Long proKind) {
        this.proKind = proKind;
    }

    public Integer getProNewpro() {
        return proNewpro;
    }

    public void setProNewpro(Integer proNewpro) {
        this.proNewpro = proNewpro;
    }

    public Integer getProPut() {
        return proPut;
    }

    public void setProPut(Integer proPut) {
        this.proPut = proPut;
    }

    public Date getProDate() {
        return proDate;
    }

    public void setProDate(Date proDate) {
        this.proDate = proDate;
    }

    public Long getProImgid() {
        return proImgid;
    }

    public void setProImgid(Long proImgid) {
        this.proImgid = proImgid;
    }

    public String getProDecrition() {
        return proDecrition;
    }

    public void setProDecrition(String proDecrition) {
        this.proDecrition = proDecrition == null ? null : proDecrition.trim();
    }

    public Double getProPrice() {
        return proPrice;
    }

    public void setProPrice(Double proPrice) {
        this.proPrice = proPrice;
    }

    public Integer getProNum() {
        return proNum;
    }

    public void setProNum(Integer proNum) {
        this.proNum = proNum;
    }

	public List<Picture> getJpitlist() {
		return jpitlist;
	}

	public void setJpitlist(List<Picture> jpitlist) {
		this.jpitlist = jpitlist;
	}

	public List<Picture> getXpitlist() {
		return xpitlist;
	}

	public void setXpitlist(List<Picture> xpitlist) {
		this.xpitlist = xpitlist;
	}

	@Override
	public String toString() {
		return "Product [proId=" + proId + ", proCode=" + proCode
				+ ", proName=" + proName + ", proKind=" + proKind
				+ ", proNewpro=" + proNewpro + ", proPut=" + proPut
				+ ", proDate=" + proDate + ", proImgid=" + proImgid
				+ ", proDecrition=" + proDecrition + ", proPrice=" + proPrice
				+ ", proNum=" + proNum + ", jpitlist=" + jpitlist
				+ ", xpitlist=" + xpitlist + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((jpitlist == null) ? 0 : jpitlist.hashCode());
		result = prime * result + ((proCode == null) ? 0 : proCode.hashCode());
		result = prime * result + ((proDate == null) ? 0 : proDate.hashCode());
		result = prime * result
				+ ((proDecrition == null) ? 0 : proDecrition.hashCode());
		result = prime * result + ((proId == null) ? 0 : proId.hashCode());
		result = prime * result
				+ ((proImgid == null) ? 0 : proImgid.hashCode());
		result = prime * result + ((proKind == null) ? 0 : proKind.hashCode());
		result = prime * result + ((proName == null) ? 0 : proName.hashCode());
		result = prime * result
				+ ((proNewpro == null) ? 0 : proNewpro.hashCode());
		result = prime * result + ((proNum == null) ? 0 : proNum.hashCode());
		result = prime * result
				+ ((proPrice == null) ? 0 : proPrice.hashCode());
		result = prime * result + ((proPut == null) ? 0 : proPut.hashCode());
		result = prime * result
				+ ((xpitlist == null) ? 0 : xpitlist.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Product other = (Product) obj;
		if (jpitlist == null) {
			if (other.jpitlist != null)
				return false;
		} else if (!jpitlist.equals(other.jpitlist))
			return false;
		if (proCode == null) {
			if (other.proCode != null)
				return false;
		} else if (!proCode.equals(other.proCode))
			return false;
		if (proDate == null) {
			if (other.proDate != null)
				return false;
		} else if (!proDate.equals(other.proDate))
			return false;
		if (proDecrition == null) {
			if (other.proDecrition != null)
				return false;
		} else if (!proDecrition.equals(other.proDecrition))
			return false;
		if (proId == null) {
			if (other.proId != null)
				return false;
		} else if (!proId.equals(other.proId))
			return false;
		if (proImgid == null) {
			if (other.proImgid != null)
				return false;
		} else if (!proImgid.equals(other.proImgid))
			return false;
		if (proKind == null) {
			if (other.proKind != null)
				return false;
		} else if (!proKind.equals(other.proKind))
			return false;
		if (proName == null) {
			if (other.proName != null)
				return false;
		} else if (!proName.equals(other.proName))
			return false;
		if (proNewpro == null) {
			if (other.proNewpro != null)
				return false;
		} else if (!proNewpro.equals(other.proNewpro))
			return false;
		if (proNum == null) {
			if (other.proNum != null)
				return false;
		} else if (!proNum.equals(other.proNum))
			return false;
		if (proPrice == null) {
			if (other.proPrice != null)
				return false;
		} else if (!proPrice.equals(other.proPrice))
			return false;
		if (proPut == null) {
			if (other.proPut != null)
				return false;
		} else if (!proPut.equals(other.proPut))
			return false;
		if (xpitlist == null) {
			if (other.xpitlist != null)
				return false;
		} else if (!xpitlist.equals(other.xpitlist))
			return false;
		return true;
	}
    

	
	
}