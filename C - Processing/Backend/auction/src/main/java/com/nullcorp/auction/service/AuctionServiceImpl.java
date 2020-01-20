package com.nullcorp.auction.service;

import com.nullcorp.auction.dao.AuctionDao;
import com.nullcorp.auction.entity.Auction;
import com.nullcorp.auction.entity.Bid;
import com.nullcorp.auction.entity.Transaction;
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
            Auction auction = getAuctionById(auctionId);
//            Change item status to SOLD
            itService.terminateStatus(auction.getItem());
//            Generate Transaction  TODO
            Transaction transactionData = new Transaction();
            transactionData.setItem(auction.getItem());
            transactionData.setOwner(auction.getItem().getUser());
            transactionData.setWinner(auction.getMaxBid().getUser());
            transactionData.setTprice(auction.getMaxBid().getBprice());
            tService.generateTransaction(transactionData);
//            Delete Auction and it's bids 
            deleteAuction(auctionId);

        }
    }

}
