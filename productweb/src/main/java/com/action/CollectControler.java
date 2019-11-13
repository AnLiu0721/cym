package com.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.entity.Collect;
import com.entity.Users;
import com.service.ICollectService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class CollectControler {
	@Autowired
	private ICollectService cs;
	private String code="";

	//为用户添加收藏
	@ResponseBody
	@RequestMapping(value="/addCollect")
	public String addshoucang(ModelAndView mov,String pid,HttpServletRequest request){
		Users u=(Users)request.getSession().getAttribute("u");
		Collect c=new Collect(0l,u.getUserId(),Long.parseLong(pid),new Date());
		int num= cs.insert(c);
		if(num>0){
			code="true";
		}else{
			code="false";
		}
		return code;
	}
	//根据用户id删除指定收藏商品
	@ResponseBody
	@RequestMapping(value="/delCollect")
	public String delshoucang(ModelAndView mov,String pid,HttpServletRequest request){
		Users u=(Users)request.getSession().getAttribute("u");
		Map<String, Object> mp=new HashMap();
		mp.put("collectUserid", u.getUserId());
		mp.put("collectProid",Long.parseLong(pid));
		int num= cs.deleteByUPid(mp);
		if(num>0){
			code="true";
		}else{
			code="false";
		}
		return code;
	}

	//查询用户的收藏
	@RequestMapping(value="/reachUidCollect")
	public String reachshoucang(ModelAndView mov,String pid,HttpServletRequest request){
		Users  u=(Users)request.getSession().getAttribute("u");
		List<Collect> clist=cs.selectByUid(u.getUserId());
		mov.addObject("clist", clist);
		return "forword:#";
	}
	//查询用户的单个收藏是否存在
	@ResponseBody
	@RequestMapping(value="/reachIfCollect")
	public String repuidshoucang(ModelAndView mov,String pid,HttpServletRequest request){
		String isexist="";
		Users  u=(Users)request.getSession().getAttribute("u");
		Map<String, Object> mp=new HashMap();
		mp.put("collectUserid", u.getUserId());
		mp.put("collectProid",Long.parseLong(pid));
		Collect c=cs.selectByUPid(mp);
		if(c!=null){
			isexist="true";
		}else{
			isexist="false";
		}
		return isexist;
	}

	@ResponseBody
	@RequestMapping(value="/reachCollect")
	public String shoucang(ModelAndView mov,String pid,HttpServletRequest request){
		String isexist="";
		Users  u=(Users)request.getSession().getAttribute("u");
		Map<String, Object> mp=new HashMap();
		mp.put("collectUserid", u.getUserId());
		mp.put("collectProid",Long.parseLong(pid));
		Collect c;
		c=cs.selectByUPid(mp);
		if(c!=null){
			isexist="false";
		}else{
			c=new Collect(0l, u.getUserId(), Long.parseLong(pid), new Date());
			int num=cs.insert(c);
			if(num>0){
				isexist="true";
			}

		}
		return isexist;
	}
}
