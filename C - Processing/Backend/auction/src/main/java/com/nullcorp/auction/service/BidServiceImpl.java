package com.nullcorp.auction.service;

import com.nullcorp.auction.dao.BidDao;
import com.nullcorp.auction.entity.Bid;
import java.math.BigDecimal;
import java.util.Comparator;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BidServiceImpl implements BidService {

    @Autowired
    BidDao bdao;

    @Override
    public List<Bid> getAllBids(Integer id) {
        return bdao.findAllByAuction(id);
    }

    @Override
    public void placeBid(Bid b) {
        bdao.placeBid(b);
    }

    @Override
    public void deleteBidById(Integer id) {
        bdao.deleteById(id);
    }

    @Override
    public Bid getBidById(Integer id) {
        return bdao.findById(id);
    }

    @Override
    public BigDecimal getMaxBid(Integer id) {
        List<Bid> list = getAllBids(id);
        if (list.size() > 0) {
            list.sort(Comparator.comparing(Bid::getBprice)); // sort list descending
            BigDecimal maxBid = list.get(list.size() - 1).getBprice();
            return maxBid;
        }
        return BigDecimal.ZERO;
    }

    @Override
    public List<Bid> getAllBidsByUser(String uname) {
        return bdao.findAllByUser(uname);
    }

}
