package com.nullcorp.auction.dao;

import com.nullcorp.auction.entity.Auction;
import java.util.List;


public interface AuctionDao {

    public void createOrUpdateAuction(Auction a);

    public List<Auction> findall();

    public Auction findById(Integer id);

    public void delete(Integer id);
    
}
