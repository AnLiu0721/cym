package com.dao;

import com.entity.Users;

public interface UsersDao {
    Users selectByPrimaryKey(Long uid);
}
