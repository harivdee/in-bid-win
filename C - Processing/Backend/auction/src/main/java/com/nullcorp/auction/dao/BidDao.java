package com.nullcorp.auction.dao;

import com.nullcorp.auction.entity.Bid;
import java.util.List;


public interface BidDao {

    public List<Bid> findAllByAuction(Integer id);

    public void placeBid(Bid b);

    public void deleteById(Integer id);

    public Bid findById(Integer id);

    public List<Bid> findAllByUser(String uname);
    
}
