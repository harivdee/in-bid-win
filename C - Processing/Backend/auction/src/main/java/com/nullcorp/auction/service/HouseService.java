package com.nullcorp.auction.service;

import com.nullcorp.auction.entity.House;
import java.util.Map;


public interface HouseService {

    public void createOrUpdateHouse(House h);

    public House getHouseById(Integer id);

    public void deleteHouseByItemId(Integer id);
    
    
}
