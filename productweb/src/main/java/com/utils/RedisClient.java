package com.utils;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Component;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.List;

@Component
public class RedisClient {

    @Autowired
    private JedisPool jedisPool;
    @Autowired
    private RedisTemplateUtils redisTemplateUtils;

    public void set(String key, Object value){
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            jedis.set(key.getBytes(), SerializeUtil.serialize(value));
        } catch(Exception e){
           e.printStackTrace();
        }finally {
            //返还到连接池
            jedis.close();
        }
    }

    public Object get(String key){
        Object value = null;
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            byte[] temp = jedis.get(key.getBytes());
            value = SerializeUtil.unserialize(temp);
        } catch(Exception e){
            e.printStackTrace();
        }finally {
            //返还到连接池
            jedis.close();
        }
        return value;
    }

    public long del(String key){
        long num = 0;
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            num = jedis.del(key.getBytes());
        } catch(Exception e){
            e.printStackTrace();
        }finally {
            //返还到连接池
            jedis.close();
        }
        return num;
    }

    public boolean exists(String key){
        boolean flag = false;
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            flag = jedis.exists(key);
        } catch(Exception e){
            e.printStackTrace();
        }finally {
            //返还到连接池
            jedis.close();
        }
        return flag;
    }

        public String setex(String key,int time,String value){
        String result = "";
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            result = jedis.setex(key,time,value);
        } catch(Exception e){
            e.printStackTrace();
        }finally {
            //返还到连接池
            jedis.close();
        }
        return result;
    }

    //放入集合缓存
    public boolean SetList(String key,List value){
        boolean result = false;
        try {
            result = redisTemplateUtils.lSetList(key,value);
        } catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }

    public List GetList(String key, long start, long end){
        List list = null;
        try {
            list = redisTemplateUtils.lGet(key,start,end);
        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }

    public long lGetListSize(String key){
        long result = 0;
        try {

            result = redisTemplateUtils.lGetListSize(key);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
