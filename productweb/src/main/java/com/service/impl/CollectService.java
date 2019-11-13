package com.service.impl;

import java.util.List;
import java.util.Map;

import com.dao.*;
import com.entity.Collect;
import com.service.ICollectService;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Transactional
@MapperScan(basePackages = "com.dao")
@Service(value="collectService")
public class CollectService implements ICollectService{
    @Autowired
    private CollectDao cdao;

	public Collect selectByPrimaryKey(Long cid) {
		return cdao.selectByPrimaryKey(cid);
	}

	public List<Collect> selectByUid(Long uid) {
		return cdao.selectByUid(uid);
	}

	public Collect selectByUPid(Map<String, Object> map) {
		return cdao.selectByUPid(map);
	}

	@Override
	public List<Collect> selectAll() {
		// TODO Auto-generated method stub
		return cdao.selectAll();
	}

	@Override
	public int deleteByPrimaryKey(Long cid) {
		// TODO Auto-generated method stub
		return cdao.deleteByPrimaryKey(cid);
	}

	@Override
	public int deleteByUPid(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return cdao.deleteByUPid(map);
	}

	@Override
	public int deleteByUid(Long uid) {
		// TODO Auto-generated method stub
		return cdao.deleteByUid(uid);
	}

	@Override
	public int insert(Collect c) {
		// TODO Auto-generated method stub
		return cdao.insert(c);
	}

	@Override
	public int selectByPid(Long pid) {
		
		return cdao.selectByPid(pid);
	}

}
