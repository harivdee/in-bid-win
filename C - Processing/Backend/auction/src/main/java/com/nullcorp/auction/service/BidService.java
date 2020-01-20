
package com.nullcorp.auction.service;

import com.nullcorp.auction.entity.Bid;
import java.math.BigDecimal;
import java.util.List;


public interface BidService {

    public List<Bid> getAllBids(Integer id);

    public void placeBid(Bid b);

    public void deleteBidById(Integer id);

    public Bid getBidById(Integer id);
    
    public BigDecimal getMaxBid(Integer id);
    
}
