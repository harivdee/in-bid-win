package com.nullcorp.auction.dao;

import com.nullcorp.auction.entity.House;
import java.util.Map;


public interface HouseDao {

    public void createOrUpdate(House h);
    
//    public void getHouse(House h);

    public House findById(Integer id);

    public void delete(Integer id);
    
}
