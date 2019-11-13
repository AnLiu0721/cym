package com.service.impl;
import java.util.List;

import com.dao.*;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.Protype;
import com.service.IProtypeService;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@MapperScan(basePackages = "com.dao")
@Service("protypeService")
public class ProtypeService implements IProtypeService{
    @Autowired
	private ProtypeDao pdao;
	  
	@Override
	public Protype selectByPrimaryKey(Long ptid) {
		return pdao.selectByPrimaryKey(ptid);
	}

	@Override
	public int deleteByPrimaryKey(Long ptid) {
		// TODO Auto-generated method stub
		return pdao.deleteByPrimaryKey(ptid);
	}

	@Override
	public int insert(Protype p) {
		// TODO Auto-generated method stub
		return pdao.insert(p);
	}

	@Override
	public int updateByPrimaryKey(Protype p) {
		// TODO Auto-generated method stub
		return pdao.updateByPrimaryKey(p);
	}

	@Override
	public List<Protype> selectByParentid(Long ptid) {
		// TODO Auto-generated method stub
		return pdao.selectByParentid(ptid);
	}
}
