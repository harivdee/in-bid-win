
package com.nullcorp.auction.dao;

import com.nullcorp.auction.entity.Item;
import java.util.List;


public interface ItemDao {

    public List<Item> findAllByUser(Integer id);
    
    public List<Item> findAllByUsername(String username);

    public Item findByid(Integer id);

    public void createOrUpdate(Item i);

    public void del(Item i);

    public void toggleStatus(Item i);

    public void terminateStatus(Item i);   
    
}
