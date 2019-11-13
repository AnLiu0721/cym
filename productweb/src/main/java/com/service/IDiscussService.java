package com.service;

import com.entity.Discuss;

import java.util.List;

public interface IDiscussService {
    List<Discuss> selectByProid(Long Proid);
}
