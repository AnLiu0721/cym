package com.service.impl;


import com.dao.*;
import com.entity.Discuss;

import com.service.IDiscussService;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@MapperScan(basePackages = "com.dao")
@Service(value="discussService")
public class DiscussService implements IDiscussService {

    @Autowired
    private DiscussDao dao;


    public List<Discuss> selectByProid(Long Proid) {
        return dao.selectByProid(Proid);
    }
}
