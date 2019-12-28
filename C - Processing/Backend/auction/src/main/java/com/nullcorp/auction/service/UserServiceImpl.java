package com.nullcorp.auction.service;

import com.nullcorp.auction.dao.UserDao;
import com.nullcorp.auction.entity.User;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class UserServiceImpl implements UserService{
    @Autowired
    UserDao udao;
    
    @Override
    public List<User> getAllUsers() {
        return udao.findAll();
    }

    @Override
    public void createOrUpdateUser(User u) {
        udao.createOrUpdate(u);
    }

    @Override
    public User getUserById(Integer id) {
       return udao.findById(id);
         
    }

    @Override
    public void deleteUser(Integer id) {
        udao.delete(id);
    }

    @Override
    public List<User> findUsersByUsername(String searchName) {
        return udao.findByUsername(searchName);
    }
    
}
