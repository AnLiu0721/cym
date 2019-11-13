package com.interceptor;

import com.utils.RedisClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ClearkeyInterceptor implements HandlerInterceptor{

    @Autowired
    private RedisClient redisClient;

  /*  public void afterCompletion(HttpServletRequest arg0,
                                HttpServletResponse arg1, Object arg2, Exception arg3)
            throws Exception {

    }

    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
                           Object arg2, ModelAndView arg3) throws Exception {

    }*/

  /*  public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object arg2) throws Exception {
   boolean is= redisClient.exists("productlistan");
        if(is){
            redisClient.del("productlistan");
        }
        return true;
    }
*/

}
