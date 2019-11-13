package com.config;

import com.interceptor.ClearkeyInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Component
@Configuration
public class Myconfig implements WebMvcConfigurer {

    public void addInterceptors(InterceptorRegistry registry) {
        // 加拦截器
       /* registry.addInterceptor(new ClearkeyInterceptor())
         .addPathPatterns("/reachBychildrenid")
         .addPathPatterns("/mainindex")
        .addPathPatterns("/reachBychildrenid");*/

    }
}
