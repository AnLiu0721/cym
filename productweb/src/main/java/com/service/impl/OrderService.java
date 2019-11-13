package com.service.impl;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CollectDao;
import com.dao.OrderDao;
import com.entity.Order;
import com.service.IOrderService;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@MapperScan(basePackages = "com.dao")
@Service(value="orderService")
public class OrderService implements IOrderService {

	 @Autowired
	  private OrderDao dao;
	  
	public int insert(Order o) {
		// TODO Auto-generated method stub
		return dao.insert(o);
	}

	@Override
	public int updateByPrimaryKeySelective(Order o) {
		// TODO Auto-generated method stub
		return dao.updateByPrimaryKeySelective(o);
	}
	
}
