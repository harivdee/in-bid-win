package com.nullcorp.auction.service;

import com.nullcorp.auction.dao.UserDao;
import com.nullcorp.auction.entity.User;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    UserDao udao;
    
    @Override
    public List<User> getAllUsers() {
        return udao.findAll();
    }
    
}
