package com.nullcorp.auction.service;

import com.nullcorp.auction.dao.AuctionDao;
import com.nullcorp.auction.entity.Auction;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AuctionServiceImpl implements AuctionService {

    @Autowired
    AuctionDao adao;

    @Autowired
    TransactionService tService;

    @Autowired
    ItemService itService;

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
    
    @Override
    public void terminateExpiredAuctions(List<Integer> expiredAuctions) {
        for (Integer auctionId : expiredAuctions) {
//            Change item status to SOLD
            itService.terminateStatus(getAuctionById(auctionId).getItem());
//            Generate Transaction  TODO
//            tService.generateTransaction();
//            Delete Auction and it's bids 
            deleteAuction(auctionId);

        }
    }

}
