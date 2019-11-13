package com.service.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ProductDao;
import com.entity.Product;
import com.service.IProductService;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@MapperScan(basePackages = "com.dao")
@Service("productService")
public class ProductService implements IProductService {
	@Autowired
   private ProductDao dao;
	
	@Override
	public Product selectByPrimaryKey(Long proid) {
		// TODO Auto-generated method stub
		return dao.selectByPrimaryKey(proid);
	}

	@Override
	public List<Product> selectByIf(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectByIf(map);
	}

	@Override
	public List<Product> selectByKind(Long parentid) {
		// TODO Auto-generated method stub
		return dao.selectByKind(parentid);
	}

	@Override
	public List<Product> selectByMoName(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectByMoName(map);
	}

	@Override
	public int updateByPrimaryKeySelective(Product p) {
		return dao.updateByPrimaryKeySelective(p);
	}


}
