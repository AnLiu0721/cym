package com.service.impl;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.OrderDao;
import com.dao.OrelationDao;
import com.entity.Orelation;
import com.service.IOrelationService;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@MapperScan(basePackages = "com.dao")
@Service("orelationService")
public class OrelationService implements IOrelationService {
      @Autowired
      private OrelationDao dao;

	@Override
	public int insert(Orelation o) {
		// TODO Auto-generated method stub
		return dao.insert(o);
	}
	
	

	
	
}
