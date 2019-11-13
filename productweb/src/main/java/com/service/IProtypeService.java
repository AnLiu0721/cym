package com.service;

import java.util.List;

import com.entity.Protype;

public interface IProtypeService {
	Protype selectByPrimaryKey(Long ptid);
	int deleteByPrimaryKey(Long ptid);
	int insert(Protype p);
	int updateByPrimaryKey(Protype p);
	//根据父级id查询类别名称
	List<Protype> selectByParentid(Long ptid);
}
