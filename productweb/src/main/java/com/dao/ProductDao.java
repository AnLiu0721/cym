package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Product;

public interface ProductDao {
	Product selectByPrimaryKey(Long proid);
	List<Product> selectByIf(Map<String, Object> map);
	List<Product> selectByKind(Long parentid);
	List<Product> selectByMoName(Map<String, Object> map);
	int  updateByPrimaryKeySelective(Product p);
}
