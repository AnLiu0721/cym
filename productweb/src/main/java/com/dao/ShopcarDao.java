package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Shopcar;

public interface ShopcarDao {
	Shopcar selectByPrimaryKey(Long carid);
	//根据用户id,产品id查购物车
	List<Shopcar> selectByUid(Map<String, Object> map);
	//根据用户和商品id删除购物车
	int deleteByif(Map<String, Object> map);
	int insert(Shopcar scar);
	int updateByUPid(Shopcar scar);
}
