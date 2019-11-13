package com.dao;

import com.entity.Discuss;

import java.util.List;

public interface DiscussDao {
    List<Discuss> selectByProid(Long Proid);
}
