package com.nullcorp.auction.service;

import com.nullcorp.auction.dao.AuctionDao;
import com.nullcorp.auction.entity.Auction;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AuctionServiceImpl implements AuctionService{
    
    @Autowired
    AuctionDao adao;
    
    @Override
    public void createOrUpdateAuction(Auction a) {
        adao.createOrUpdateAuction(a);
    }

    @Override
    public List<Auction> getAllAuctions() {
        return adao.findall();
    }

    @Override
    public Auction getAuctionById(Integer id) {
        return adao.findById(id);
    }

    @Override
    public void deleteAuction(Integer id) {
        adao.delete(id);
    }
    
}
