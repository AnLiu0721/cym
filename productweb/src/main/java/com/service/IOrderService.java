package com.service;

import com.entity.Order;

public interface IOrderService {
	int insert(Order o);
	int updateByPrimaryKeySelective(Order o);
}
