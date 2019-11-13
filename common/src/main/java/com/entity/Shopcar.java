package com.entity;

import java.io.Serializable;
import java.util.List;

public class Shopcar implements Serializable {
    private Long shopId;

    private Long shopUserid;

    private Long shopProid;

    private Integer shopPronum;

    private Product product;
    public Shopcar() {
    }

    public Shopcar(Long shopId, Long shopUserid, Long shopProid, Integer shopPronum) {
        this.shopId = shopId;
        this.shopUserid = shopUserid;
        this.shopProid = shopProid;
        this.shopPronum = shopPronum;
    }

    public Long getShopId() {
        return shopId;
    }

    public void setShopId(Long shopId) {
        this.shopId = shopId;
    }

    public Long getShopUserid() {
        return shopUserid;
    }

    public void setShopUserid(Long shopUserid) {
        this.shopUserid = shopUserid;
    }

    public Long getShopProid() {
        return shopProid;
    }

    public void setShopProid(Long shopProid) {
        this.shopProid = shopProid;
    }

    public Integer getShopPronum() {
        return shopPronum;
    }

    public void setShopPronum(Integer shopPronum) {
        this.shopPronum = shopPronum;
    }


	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "Shopcar [shopId=" + shopId + ", shopUserid=" + shopUserid
				+ ", shopProid=" + shopProid + ", shopPronum=" + shopPronum
				+ ", prolist=" + product + "]";
	}
}