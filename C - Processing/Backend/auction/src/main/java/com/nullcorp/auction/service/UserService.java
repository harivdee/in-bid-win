package com.nullcorp.auction.service;

import com.nullcorp.auction.entity.User;
import java.util.List;


public interface UserService {
    List<User> getAllUsers();

    public void createOrUpdateUser(User u);

    public User getUserById(Integer id);

    public void deleteUser(Integer id);

    public List<User> findUsersByUsername(String searchName);
}
