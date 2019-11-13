package com.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.dao.ProtypeDao;
import com.entity.*;
import com.service.*;

@Controller
public class ProtypeControler {
   @Autowired
   private ProtypeDao pdao;
   
   /*@ResponseBody
   @RequestMapping("/shoezhuName")
   public Map<String, Object> rename(){
	      Long parid=0l;
	     Map<String, Object> map=new HashMap();
	     List<List> biglist=new ArrayList();
	     List<Protype> plist=pdao.selectByParentid(parid);
	     
	     List<Protype> list1=new ArrayList();
	     list1.add(plist.get(0));
	     list1.addAll(pdao.selectByParentid((plist.get(0)).getProtypeId()));
	     
	     List<Protype> list2=new ArrayList();
	     list2.add(plist.get(1));
	     list2.addAll(pdao.selectByParentid((plist.get(1)).getProtypeId()));
	     
	     List<Protype> list3=new ArrayList();
	     list3.add(plist.get(2));
	     list3.addAll(pdao.selectByParentid((plist.get(2)).getProtypeId()));
	     biglist.add(list1);
	     biglist.add(list2);
	     biglist.add(list3);
		 map.put("biglist", biglist); 
	return map;
   }*/
   
   @ResponseBody
   @RequestMapping("/shoezhuName")
   public List<Protype> rename(){
	      Long parid=0l;
	     Map<String, Object> map=new HashMap();
	     List<Protype> tlist=pdao.selectByParentid(parid);
	          for (Protype p : tlist) {
	        	  p.setTypelist(pdao.selectByParentid(p.getProtypeId()));
			}
	         
	   return tlist;
   }
   
}
