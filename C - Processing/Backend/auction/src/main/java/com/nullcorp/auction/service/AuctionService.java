package com.nullcorp.auction.service;

import com.nullcorp.auction.entity.Auction;
import java.util.List;


public interface AuctionService {

    public void createOrUpdateAuction(Auction a);

    public List<Auction> getAllAuctions();

    public Auction getAuctionById(Integer id);

    public void deleteAuction(Integer id);

    public void terminateExpiredAuctions(List<Integer> expiredAuctions);
    
}
