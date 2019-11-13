package com.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Order implements Serializable {
    private Long orderId;

    private Long orderUserid;

    private String orderCode;

    private Integer orderPrice;

    private String orderRemarks;

    private Date orderTime;

    private Integer orderSend;

    private Integer orderSign;

    private Integer orderHandle;

    private List<Orelation> orelatlist;
    public Order() {
    }

    public Order( Long orderUserid, String orderCode, Integer orderPrice, String orderRemarks, Date orderTime, Integer orderSend, Integer orderSign, Integer orderHandle) {
        this.orderUserid = orderUserid;
        this.orderCode = orderCode;
        this.orderPrice = orderPrice;
        this.orderRemarks = orderRemarks;
        this.orderTime = orderTime;
        this.orderSend = orderSend;
        this.orderSign = orderSign;
        this.orderHandle = orderHandle;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getOrderUserid() {
        return orderUserid;
    }

    public void setOrderUserid(Long orderUserid) {
        this.orderUserid = orderUserid;
    }

    public String getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode == null ? null : orderCode.trim();
    }

    public Integer getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(Integer orderPrice) {
        this.orderPrice = orderPrice;
    }

    public String getOrderRemarks() {
        return orderRemarks;
    }

    public void setOrderRemarks(String orderRemarks) {
        this.orderRemarks = orderRemarks == null ? null : orderRemarks.trim();
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public Integer getOrderSend() {
        return orderSend;
    }

    public void setOrderSend(Integer orderSend) {
        this.orderSend = orderSend;
    }

    public Integer getOrderSign() {
        return orderSign;
    }

    public void setOrderSign(Integer orderSign) {
        this.orderSign = orderSign;
    }

    public Integer getOrderHandle() {
        return orderHandle;
    }

    public void setOrderHandle(Integer orderHandle) {
        this.orderHandle = orderHandle;
    }

    public List<Orelation> getOrelatlist() {
		return orelatlist;
	}

	public void setOrelatlist(List<Orelation> orelatlist) {
		this.orelatlist = orelatlist;
	}

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", orderUserid=" + orderUserid
				+ ", orderCode=" + orderCode + ", orderPrice=" + orderPrice
				+ ", orderRemarks=" + orderRemarks + ", orderTime=" + orderTime
				+ ", orderSend=" + orderSend + ", orderSign=" + orderSign
				+ ", orderHandle=" + orderHandle + ", orelatlist=" + orelatlist
				+ "]";
	}

}