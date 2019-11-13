package com.service.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.PictureDao;
import com.entity.Picture;
import com.service.IPictureService;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@MapperScan(basePackages = "com.dao")
@Service("pictureService")
public class PictureService implements IPictureService{
   @Autowired
	private PictureDao dao;
	public List<Picture> selectByPKid(Map<String, Object> map) {
		return dao.selectByPKid(map);
	}
	
}
