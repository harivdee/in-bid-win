
package com.nullcorp.auction.dao;

import com.nullcorp.auction.entity.Item;
import java.util.List;


public interface ItemDao {

    public List<Item> findAll(Integer id);
    
}
