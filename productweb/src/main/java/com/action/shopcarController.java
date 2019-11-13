package com.action;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.entity.*;
import com.service.*;

@Controller
public class shopcarController {
	@Autowired
	private ICollectService cs;
	@Autowired
	private IProductService ps;
	@Autowired
	private IPictureService pps;
	@Autowired
	private IProtypeService pts;
	@Autowired
	private IShopcarService cars;
	//用户添加购物车
	@ResponseBody
	@RequestMapping("/Addshopcar")
	public String addcollect(ModelAndView mov,HttpServletRequest request,String pid){
		Users u=(Users) request.getSession().getAttribute("u");
		Long proid=Long.parseLong(pid);
		Map<String, Object> map=new HashMap();
		map.put("shopProid",proid);
		map.put("shopUid",u.getUserId());
		Shopcar shop;
		List<Shopcar> slist =cars.selectByUid(map);
		int num=0;
		if(slist.size()!=0){
			shop=slist.get(0);
			shop.setShopPronum(shop.getShopPronum()+1);
			num=cars.updateByUPid(shop);
			if(num>0){
				return "true";
			}else{
				return "false";
			}
		}else{
			shop=new Shopcar(0l, u.getUserId(), proid, 1);
			num=cars.insert(shop);
			if(num>0){
				return "true";
			}else{
				return "false";
			}
		}
	}
	//删除用户的单个购物车
	@ResponseBody
	@RequestMapping("/DeleteCarOne")
	public String deletecollect(ModelAndView mov,HttpServletRequest request,String pid){
		Users u=(Users) request.getSession().getAttribute("u");
		Long proid=Long.parseLong(pid);
		Map<String, Object> map=new HashMap();
		map.put("shopProid",proid);
		map.put("shopUid",u.getUserId());
		int num=cars.deleteByif(map);
		if(num>0){
			return "true";
		}else{
			return "false";
		}
	}
	//清空用户的购物车
	@ResponseBody
	@RequestMapping("/ClearCarAll")
	public String clearcarall(ModelAndView mov,HttpServletRequest request){
		Users u=(Users) request.getSession().getAttribute("u");
		Map<String, Object> map=new HashMap();
		map.put("shopUid",u.getUserId());
		int num=cars.deleteByif(map);
		if(num>0){
			return "true";
		}else{
			return "false";
		}
	}
	//修改用户的购物车数量
	@ResponseBody
	@RequestMapping("/AlterCarnum")
	public String altercollectnum(ModelAndView mov,HttpServletRequest request,String pid,String pnum){
		Users u=(Users) request.getSession().getAttribute("u");
		Long proid=Long.parseLong(pid);
		Shopcar shop=new Shopcar(0l, u.getUserId(), proid, Integer.parseInt(pnum));
		int num=cars.updateByUPid(shop);
		if(num>0){
			return "true";
		}else{
			return "false";
		}
	}
	//查询用户的购物车
	@RequestMapping("/ShopCar")
	public ModelAndView addcollect(ModelAndView mov,HttpServletRequest request){
		Users u=(Users) request.getSession().getAttribute("u");
		if(u!=null){
			List<Product> plist=new ArrayList<Product>();
			Map<String, Object> map=new HashMap();
			map.put("shopUid",u.getUserId());
			List<Shopcar> shop=cars.selectByUid(map);
			map.put("ProKid",0);
			for (Shopcar s : shop) {
				Product p= ps.selectByPrimaryKey(s.getShopProid());
				map.put("Proid",s.getShopProid());
				p.setXpitlist(pps.selectByPKid(map));
				s.setProduct(p);
			}
			mov.addObject("shoplist", shop);
		}
		mov.setViewName("gouwuche");
		return mov;
	}
	@ResponseBody
	@RequestMapping("/reachCarnum")
	public String reachcollectnum(HttpServletRequest request){
		String num="";
		Users u=(Users) request.getSession().getAttribute("u");
		Map<String, Object> map=new HashMap();
		if(u!=null){
			map.put("shopUid",u.getUserId());
			List<Shopcar> shop=cars.selectByUid(map);
			num=shop.size()+"";
		}
		else{
			num="";
		}
		return num;
	}


}
