package com.nullcorp.auction.dao;

import com.nullcorp.auction.entity.Transaction;
import java.util.List;


public interface TransactionDao {

    public void saveTransaction(Transaction transactionData);

    public List<Transaction> getAllWonByUserId(Integer id);

    public List<Transaction> getAllOwnedByUserId(Integer id);
    
}
