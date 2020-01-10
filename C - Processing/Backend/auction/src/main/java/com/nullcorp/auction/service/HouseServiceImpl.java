package com.nullcorp.auction.service;

import com.nullcorp.auction.dao.HouseDao;
import com.nullcorp.auction.entity.House;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class HouseServiceImpl implements HouseService{
    
    @Autowired
    HouseDao hdao;
    
    @Override
    public void createOrUpdateHouse(House h) {
        hdao.createOrUpdate(h);
    }
    
}
