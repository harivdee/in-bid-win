
package com.nullcorp.auction.dao;

import com.nullcorp.auction.entity.User;
import java.util.List;


public interface UserDao {
    List<User> findAll();
}
