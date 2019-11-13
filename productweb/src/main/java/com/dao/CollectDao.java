package com.dao;

import com.entity.Collect;

import java.util.List;
import java.util.Map;

public interface CollectDao {
           //选择单个的收藏
            Collect selectByPrimaryKey(Long cid);
          //根据用户查找收藏商品
            List<Collect> selectByUid(Long uid);
          //根据用户和商品id查找
           Collect selectByUPid(Map<String, Object> map);
          //选择所有的收藏
            List<Collect> selectAll();
           // 根据商品单个收藏商品数量
            int  selectByPid(Long pid);
            //根据收藏id删除收藏
            int deleteByPrimaryKey(Long cid);
            //根据用户和商品id删除收藏
            int deleteByUPid(Map<String, Object> map);
            //根据用户id删除收藏
            int deleteByUid(Long uid);
            //新增收藏
            int   insert(Collect c);


}
