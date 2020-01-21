package com.nullcorp.auction.service;

import com.nullcorp.auction.entity.User;
import java.math.BigDecimal;
import java.util.List;
import org.springframework.security.core.userdetails.UserDetailsService;


public interface UserService extends UserDetailsService{
    List<User> getAllUsers();

    public void createOrUpdateUser(User u);

    public User getUserById(Integer id);

    public void deleteUser(Integer id);

    public List<User> findUsersByUsername(String searchName);
    
    public User findByUsername(String username);

    public User getUserByUsername(String uname);

    public void addCreditToUser(String name, BigDecimal bigDecimal);

    
}
