package com.service.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ShopcarDao;
import com.entity.Shopcar;
import com.service.IShopcarService;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@MapperScan(basePackages = "com.dao")
@Service("shopcarService")
public class ShopcarService implements IShopcarService {
     @Autowired
	 private ShopcarDao dao;
     
	@Override
	public Shopcar selectByPrimaryKey(Long carid) {
		// TODO Auto-generated method stub
		return dao.selectByPrimaryKey(carid);
	}

	@Override
	public List<Shopcar> selectByUid(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return dao.selectByUid(map);
	}

	@Override
	public int deleteByif(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.deleteByif(map);
	}

	@Override
	public int insert(Shopcar scar) {
		// TODO Auto-generated method stub
		return dao.insert(scar);
	}

	@Override
	public int updateByUPid(Shopcar scar) {
		// TODO Auto-generated method stub
		return dao.updateByUPid(scar);
	}
}
