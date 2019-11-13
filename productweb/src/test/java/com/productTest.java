package com;

import com.entity.Product;
import com.service.IProductService;
import com.service.IProductService;
import com.service.impl.ProductService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@SpringBootTest()
@RunWith(SpringRunner.class)
public class productTest {
    @Autowired
    ProductService pdao;
    @Test
    public void add() throws Exception{
        /*AbstractApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");*/
        /*IProductService pdao= (IProductService) ctx.getBean("productService");*/
        Map<String, Object> map=new HashMap();
        map.put("proparentid", 1);
	 /*map.put("minprice", 0);
	  map.put("maxprice", 150);*/
        List<Product> pl=pdao.selectByIf(map);
        System.out.println("pl.size="+pl.size());
        for (Product product : pl) {
            System.out.println("productname====="+product.getProName());
        }
    }
}
