package com.action;
import java.util.*;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.solr.client.solrj.beans.Field;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.entity.*;
import com.service.*;
import com.utils.OrderNumber;

@Controller
public class OrderControler {

	@Autowired
	private IProductService ps;
	@Autowired
	private IPictureService pps;
	@Autowired
	private IProtypeService pts;
	@Autowired
	private IShopcarService sps;
	@Autowired
	private IOrderService ors;
	@Autowired
	private IOrelationService ols;

	@RequestMapping("/GouOrder")
	public ModelAndView Addorder(ModelAndView mov,HttpServletRequest request,String proCount,String[] gdids,String[]gdnum){
		Users u=(Users) request.getSession().getAttribute("u");
		List proids=new ArrayList();//转型后的proid
		List<Long> shopcarnum=new ArrayList();//单个商品数量
		List<Shopcar> shoplist=new ArrayList();

			/*Map<String, Object> map=new HashMap<String, Object>();
			map.put("shopUid", u.getUserId());*/
		String OrderCode=OrderNumber.getOrderNo();//订单编号
		int countprice=Integer.parseInt(proCount);
		Product p=ps.selectByPrimaryKey(Long.parseLong(gdids[0]));

		for (String id : gdids) {
			System.out.println("id======="+id);
			proids.add(Long.parseLong(id));
				/*map.put("shopProid", Integer.parseInt(id));
				Product p=ps.selectByPrimaryKey(Long.parseLong(id));*/
				/*List<Shopcar> shop=sps.selectByUid(map);
				  shop.get(0).setProduct(p);*/
				/* shoplist.addAll(shop);*/
		}
			/*String proname=shoplist.get(0).getProduct().getProName()+"等"+shoplist.size()+"种商品";//商品拼接名称*/
		String proname=p.getProName()+"等"+gdids.length+"种商品";
		for (String num : gdnum) {
			System.out.println("num======="+num);
			shopcarnum.add(Long.parseLong(num));
		}
		request.getSession().setAttribute("proids",proids);
		request.getSession().setAttribute("shopcarnum",shopcarnum);
		request.getSession().setAttribute("OrderCode",OrderCode);
		request.getSession().setAttribute("countprice",countprice);
		mov.addObject("countprice", countprice);
		mov.addObject("proname", proname);
		mov.addObject("OrderCode", OrderCode);
		mov.setViewName("pay");
		return mov;
	}
	//新建订单
	@ResponseBody
	@RequestMapping("/AddOrders")
	public void Addorders(HttpServletRequest request){
		Users u=(Users) request.getSession().getAttribute("u");
		List<Long> proids= (List<Long>) request.getSession().getAttribute("proids");
		List<Long> shopcarnum=(List<Long>) request.getSession().getAttribute("shopcarnum");
		String OrderCode=(String) request.getSession().getAttribute("OrderCode");
		int countprice=(Integer) request.getSession().getAttribute("countprice");
		request.getSession().getAttribute("orderid");
		Order myorder=new Order(u.getUserId(), OrderCode, countprice, "未支付", new Date(), 0, 0, 0);
		int num=ors.insert(myorder);
		System.out.println("订单编号========"+myorder.getOrderId());
		int ornum=0;
		if(num>0){
			for(int i=0;i<shopcarnum.size();i++) {
				Orelation or=new Orelation(0l, myorder.getOrderId(), proids.get(i),shopcarnum.get(i));
				int aa=ols.insert(or);
				ornum+=aa;
			}
			if(ornum==shopcarnum.size()){
				Map<String, Object>map=new HashMap<String, Object>();
				map.put("shopUid", 1);
				for(Long pid:proids) {
					map.put("shopProid", pid);
					sps.deleteByif(map);
				}
			}
		}
		request.getSession().setAttribute("Orderid",myorder.getOrderId());
	}
// 更新订单状态
	@RequestMapping("/Updatestate")
	public ModelAndView Addorders(ModelAndView mov, HttpSession session){
		Users u=(Users) session.getAttribute("u");
		Long orderod=(Long) session.getAttribute("Orderid");
		List<Long> pids=(List<Long>)session.getAttribute("proids");
		List<Long> shopnum=((List<Long>)session.getAttribute("shopcarnum"));
		Order o=new Order();
		o.setOrderId(orderod);
		o.setOrderRemarks("已支付");
		int num=ors.updateByPrimaryKeySelective(o);
		if(num>0){
			for(int i=0;i<pids.size();i++){
				Product p=ps.selectByPrimaryKey(pids.get(i));
				p.setProNum(p.getProNum()-shopnum.get(i).intValue());
				ps.updateByPrimaryKeySelective(p);
			}
		}
		mov.setViewName("redirect:ShopCar");
		return mov;

	}


}
