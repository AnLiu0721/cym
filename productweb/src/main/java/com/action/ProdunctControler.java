package com.action;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import java.util.*;
import com.entity.*;
import com.service.*;
import  com.utils.*;

import javax.servlet.http.HttpSession;

@Controller
public class ProdunctControler {
	@Autowired
	private ICollectService cs;
	@Autowired
	private IProductService ps;
	@Autowired
	private IPictureService pps;
	@Autowired
	private IProtypeService pts;
	@Autowired
	private IDiscussService pds;
	@Autowired
	private RedisClient redisClient;
	@Autowired
	private IUserService us;

	@RequestMapping("/ProductInfo")
	public ModelAndView prodtil(ModelAndView mov,String proid){
		boolean is= redisClient.exists("discusseslistan");
		if(is){
			redisClient.del("discusseslistan");
		}
		Map<String, Object> map=new HashMap();
		//查产品图片
		Product p=ps.selectByPrimaryKey(Long.parseLong(proid));
		map.put("Proid", Long.parseLong(proid));
		map.put("ProKid",0);
		p.setXpitlist(pps.selectByPKid(map));
		map.put("ProKid",1);
		p.setJpitlist(pps.selectByPKid(map));
		//查看当前商品的收藏数量
		int collectnum=cs.selectByPid(Long.parseLong(proid));
		//查看商品当前目录
		Protype pt=pts.selectByPrimaryKey(p.getProKind());//查二级id
		Protype parentpt=pts.selectByPrimaryKey(pt.getProtypeParentid());
		mov.addObject("childrenpt",pt);
		mov.addObject("parentpt",parentpt);
		//查看当前商品的评价
        List<Discuss> discusseslistan=pds.selectByProid(Long.parseLong(proid));
        int discunum=discusseslistan.size();
		for (Discuss d:discusseslistan ) {
			d.setUsers(us.selectByPrimaryKey(d.getDiscussUserid()));
		}
		List<Discuss> dlist=new ArrayList();
		if(discusseslistan.size()>5){
			for (int i=0;i<5;i++){
				dlist.add(discusseslistan.get(i));
				System.out.println("评论级用户="+discusseslistan.get(i));
			}
		}else {
			dlist.addAll(discusseslistan);
		}
		if(discusseslistan.size()>0){ redisClient.SetList("discusseslistan",discusseslistan); }
		mov.addObject("tlist",( List<Protype>)redisClient.GetList("tlist",0,-1));
		mov.addObject("discunum", discunum);
		mov.addObject("collectnum", collectnum);
		mov.addObject("dlist", dlist);
		mov.addObject("product", p);
		mov.setViewName("details");
		return mov;
	}

	@RequestMapping(value="/reachByparentid")
	public ModelAndView xsx(ModelAndView mov,String parentid){
		if(redisClient.exists("productlistan")){
			redisClient.del("productlistan");
		}
		//模糊查询左侧栏目列表
		Protype parenttype=pts.selectByPrimaryKey(Long.parseLong(parentid));
		parenttype.setTypelist(pts.selectByParentid(parenttype.getProtypeId()));

		/*=================*/
		Map<String, Object> map=new HashMap();
		map.put("proparentid",Long.parseLong(parentid));
		List<Product> plist=ps.selectByIf(map);
		map.put("ProKid", 0);
		for(Product p:plist){
			map.put("Proid", p.getProId());
			p.setXpitlist(pps.selectByPKid(map));
		}
		List<Product> prolist=new ArrayList();
		for (int i=0;i<3;i++){
			prolist.add(plist.get(i));
		}
		redisClient.SetList("productlistan",plist);
		mov.addObject("parenttype",parenttype);

		mov.addObject("tlist",( List<Protype>)redisClient.GetList("tlist",0,-1) );
		mov.addObject("plist", prolist);
		mov.setViewName("main");
		return  mov;
	}

	@RequestMapping(value="/reachBychildrenid")
	public ModelAndView xasx(ModelAndView mov,String childrenid){
		if(redisClient.exists("productlistan")){
			redisClient.del("productlistan");
		}
		System.out.println("结果：==========="+redisClient.exists("productlistan"));
		//模糊查询左侧栏目列表
		Protype childrentype=pts.selectByPrimaryKey(Long.parseLong(childrenid));//查出子类型
		Protype parenttype=pts.selectByPrimaryKey(childrentype.getProtypeParentid());//查父类型
		parenttype.setTypelist(pts.selectByParentid(parenttype.getProtypeId()));//查父类型下所有子类型
		/*==============*/
		Map<String, Object> map=new HashMap();
		map.put("prokind",Long.parseLong(childrenid));
		System.out.println("childrenid"+redisClient.exists("productlistan"));
		List<Product> plist=ps.selectByIf(map);
		map.put("ProKid", 0);
		for(Product p:plist){
			map.put("Proid", p.getProId());
			p.setXpitlist(pps.selectByPKid(map));
		}
		List<Product> prolist=new ArrayList();
		for (int i=0;i<3;i++){
			prolist.add(plist.get(i));
		}
		redisClient.SetList("productlistan",plist);
		mov.addObject("parenttype",parenttype);
		mov.addObject("childrentype",childrentype);
		mov.addObject("tlist",( List<Protype>)redisClient.GetList("tlist",0,-1) );
		mov.addObject("plist", prolist);
		mov.setViewName("main");
		return  mov;
	}
	@RequestMapping(value = "ajaxMoFucha", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public  List<Product> reachaaa(String ctid,String price,String job){
		if(redisClient.exists("productlistan")){
			redisClient.del("productlistan");
		}
		Map<String, Object> map=new HashMap();
		if(!ctid.equals("0")){map.put("prokind", Long.parseLong(ctid));}
		if(!price.equals("0")){
			String[] prodprice=price.split("-");
			map.put("minprice",Double.parseDouble(prodprice[0]));
			map.put("maxprice", Double.parseDouble(prodprice[1]));}
		if(!job.equals("0")){map.put("title", job);}

		List<Product> plist=ps.selectByIf(map);
		//查询图片
		map.put("ProKid", 0);
		for(Product p:plist){
			map.put("Proid", p.getProId());
			p.setXpitlist(pps.selectByPKid(map));
		}
		List<Product> prolist=new ArrayList();
		if(plist.size()>=3){
			for (int i=0;i<3;i++){
				prolist.add(plist.get(i));
			}
		}else{
			prolist.addAll(plist);
		}
		redisClient.SetList("productlistan",plist);
		return  prolist;
	}

	@RequestMapping(value = "reachADsc", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public List<Product> ajaxdeas(String type)throws  Exception{
		List<Product> productList= (List<Product>)redisClient.GetList("productlistan",0,-1);
		redisClient.del("productlistan");//删除redis值
		List<Product> prolist=new ArrayList<>();
		if(type.equals("asc")){
			SortListUtil.sort(productList, "proPrice", SortListUtil.ASC);
		}else{
			SortListUtil.sort(productList, "proPrice", SortListUtil.DESC);
		}
		if(productList.size()>=3){
			for (int i=0;i<3;i++){
				prolist.add(productList.get(i));
			}
		}else{
			prolist.addAll(productList);
		}
		redisClient.SetList("productlistan",productList);
		return prolist;
	}

	@RequestMapping(value = "reachName", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public List<Product> ajaxname(String name)throws  Exception{
		if(redisClient.exists("productlistan")){
			redisClient.del("productlistan");
		}
		List<Product> prolist=new ArrayList<>();
		name=name.replace(" ","");//去空格
		System.out.println("去空格后的名字："+name);
		Set <String >pronames=new HashSet(Arrays.asList(name.split("")));
		pronames.add(name);
		Set<Product> proset=new HashSet<>();
		Map<String, Object> map=new HashMap();
		for (String n:pronames) {
			map.put("proName",n);
			List<Product> pr=ps.selectByIf(map);
			proset.addAll(pr);
		}
		prolist.addAll(proset);
		map.put("ProKid",0);
		for(Product pp: prolist){
			map.put("Proid",pp.getProId());
			pp.setXpitlist(pps.selectByPKid(map));
		}
		System.out.println("按名字的集合数量："+prolist.size());
		List<Product> neplist=new ArrayList<>();
		if(prolist.size()>=3){
			for (int i=0;i<3;i++){
				neplist.add(prolist.get(i));
			}
		}else{
			neplist.addAll(prolist);
		}
		redisClient.SetList("productlistan",prolist);
		return neplist;
	}

   //ajax product分页
	@RequestMapping(value = "ajaxPageNxet", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	//下一页
	public String ajaxPageNxet(Integer num,Integer size,HttpSession session)throws  Exception{
		List<Product> productList= (List<Product>)redisClient.GetList("productlistan",0,-1);  //(List<Product>)session.getAttribute("productlistan");
		List<Product> p1=new ArrayList<>();
		Map<String,Object> mp=new HashMap<>();
		Integer count=productList.size()/size;
		String js=null;
		if(num<=count){
			if(productList.size()>size&&productList.size()<=(num+1)*size){
				for(int i=num*size;i<productList.size();i++){
					p1.add(productList.get(i));
					mp.put("productList",p1);
				}
				num=num+1;
				mp.put("num",num);
				js=JSON.toJSONString(mp);
			}
			if(productList.size()>(num+1)*size){
				for(int i=num*size;i<(num+1)*size;i++){
					p1.add(productList.get(i));
					mp.put("productList",p1);
				}
				num=num+1;
				mp.put("num",num);
				js=JSON.toJSONString(mp);
			}
		}
		return js;
	}

	@RequestMapping(value = "ajaxPagePrevious", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	//上一页
	public String ajaxPagePrevious(Integer num,Integer size,HttpSession session)throws  Exception {
		List<Product> productList =(List<Product>)redisClient.GetList("productlistan",0,-1);// (List<Product>) session.getAttribute("productlistan");
		List<Product> p1 = new ArrayList<>();
		Map<String, Object> mp = new HashMap<>();
		Integer count = productList.size() / size;
		Integer count1 = productList.size() % size;
		String js = null;
		if (num > 1) {
			if (count1 == 0) {//取整时
				for (int i = (num - 2) * size; i < (num - 1) * size; i++) {
					p1.add(productList.get(i));
					mp.put("productList", p1);
				}
			}
			if (count1 != 0) {//不能取整时
				count = count + 1;//纠正页数
				if (num == count) {//最后一页
					for (int i = (num - 2) * size; i < (productList.size() - count1); i++) {
						p1.add(productList.get(i));
						mp.put("productList", p1);
					}
				}
				if (num < count) {//判断是否为最后一页
					for (int i = (num - 2) * size; i < (num - 1) * size; i++) {
						p1.add(productList.get(i));
						mp.put("productList", p1);
					}
				}
			}
			num = num - 1;
			mp.put("num", num);
			js = JSON.toJSONString(mp);
		}
		return js;
	}


	/*==============评论分页=====================*/
	@RequestMapping(value = "discussPageNxet", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	//下一页
	public String discussPageNxet(Integer num,Integer size,HttpSession session)throws  Exception{
		List<Discuss> productList= (List<Discuss>)redisClient.GetList("discusseslistan",0,-1);  //(List<Product>)session.getAttribute("productlistan");
		List<Discuss> p1=new ArrayList<>();
		Map<String,Object> mp=new HashMap<>();
		Integer count=productList.size()/size;
		String js=null;
		if(num<=count){
			if(productList.size()>size&&productList.size()<=(num+1)*size){
				for(int i=num*size;i<productList.size();i++){
					p1.add(productList.get(i));
					mp.put("productList",p1);
				}
				num=num+1;
				mp.put("num",num);
				js=JSON.toJSONString(mp);
			}
			if(productList.size()>(num+1)*size){
				for(int i=num*size;i<(num+1)*size;i++){
					p1.add(productList.get(i));
					mp.put("productList",p1);
				}
				num=num+1;
				mp.put("num",num);
				js=JSON.toJSONString(mp);
			}
		}
		return js;
	}

	@RequestMapping(value = "discussPagePrevious", produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	//上一页
	public String discussPagePrevious(Integer num,Integer size,HttpSession session)throws  Exception {
		List<Discuss> productList =(List<Discuss>)redisClient.GetList("discusseslistan",0,-1);// (List<Product>) session.getAttribute("productlistan");
		List<Discuss> p1 = new ArrayList<>();
		Map<String, Object> mp = new HashMap<>();
		Integer count = productList.size()/ size;
		Integer count1 = productList.size() % size;
		String js = null;
		if (num > 1) {
			if (count1 == 0) {//取整时
				for (int i = (num - 2) * size; i < (num - 1) * size; i++) {
					p1.add(productList.get(i));
					mp.put("productList", p1);
				}
			}
			if (count1 != 0) {//不能取整时
				count = count + 1;//纠正页数
				if (num == count) {//最后一页
					for (int i = (num - 2) * size; i < (productList.size() - count1); i++) {
						p1.add(productList.get(i));
						mp.put("productList", p1);
					}
				}
				if (num < count) {//判断是否为最后一页
					for (int i = (num - 2) * size; i < (num - 1) * size; i++) {
						p1.add(productList.get(i));
						mp.put("productList", p1);
					}
				}
			}
			num = num - 1;
			mp.put("num", num);
			js = JSON.toJSONString(mp);
		}
		return js;
	}


}
