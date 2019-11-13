package com.service;

import com.entity.Users;

public interface IUserService {
    Users selectByPrimaryKey(Long uid);
}
