package com.dao;

import com.entity.Order;

public interface OrderDao {
	int insert(Order o);
	int updateByPrimaryKeySelective(Order o);
}
