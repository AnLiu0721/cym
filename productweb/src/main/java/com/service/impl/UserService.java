package com.service.impl;

import com.dao.UsersDao;
import com.entity.Users;
import com.service.IUserService;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@MapperScan(basePackages = "com.dao")
@Service("userService")
public class UserService  implements IUserService{
    @Autowired
    private UsersDao dao;

    public Users selectByPrimaryKey(Long uid) {
        return dao.selectByPrimaryKey(uid);
    }
}
