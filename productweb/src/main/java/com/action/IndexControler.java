package com.action;

import java.util.*;

import com.entity.*;
import com.service.*;


import com.utils.RedisClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
public class IndexControler {
    @Autowired
    private ICollectService cs;
    @Autowired
    private IProductService ps;
    @Autowired
    private IPictureService pps;
    @Autowired
    private IProtypeService pts;
    @Autowired
    private RedisClient redisClient;

    private static  Users u;
    static{
        u=new Users();
        u.setUserId(1l);
        u.setUserNickname("大赦天下");
        u.setUserNumber(1764110l);
        u.setUserPhone("13297416407");
        u.setUserPwd("123");
    }

    @RequestMapping(value="/Indexs")
    public ModelAndView toindex(ModelAndView mov,HttpSession session){
       /*if(redisClient.exists("user")){
           session.setAttribute("u", redisClient.get("user"));
       }*/
        session.setAttribute("u", u);
        boolean is= redisClient.exists("tlist");
        if(is){
            redisClient.del("tlist");
        }
        List<Protype> tlist=pts.selectByParentid(0l);
        for (Protype p : tlist) {
            p.setTypelist(pts.selectByParentid(p.getProtypeId()));
        }
        redisClient.SetList("tlist",tlist);
        mov.addObject("tlist",tlist );
        mov.setViewName("homepage");
        return  mov;
    }

   @RequestMapping(value="/mainindex")
    public ModelAndView tomainindex(ModelAndView mov,HttpSession session){
       if(redisClient.exists("productlistan")){
           redisClient.del("productlistan");
       }
        Map<String, Object> map=new HashMap();
        map.put("ProKid", 0);
        List<Product> plist=ps.selectByIf(map);
        for(Product p:plist){
            map.put("Proid", p.getProId());
            p.setXpitlist(pps.selectByPKid(map));
        }
       List<Product> prolist=new ArrayList();
       for (int i=0;i<3;i++){
           prolist.add(plist.get(i));
       }
        redisClient.SetList("productlistan",plist);
        mov.addObject("tlist", ( List<Protype>)redisClient.GetList("tlist",0,-1));
        mov.addObject("plist", prolist);
        mov.setViewName("main");
        return  mov;
    }

}
