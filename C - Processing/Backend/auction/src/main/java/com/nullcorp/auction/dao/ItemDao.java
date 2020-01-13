
package com.nullcorp.auction.dao;

import com.nullcorp.auction.entity.Item;
import java.util.List;


public interface ItemDao {

    public List<Item> findAllByUser(Integer id);

    public Item findByid(Integer id);

    public void createOrUpdate(Item i);

    public void delete(Integer id);

    public void del(Item i);
    
}
