package com.nullcorp.auction.dao;

import com.nullcorp.auction.entity.Transaction;


public interface TransactionDao {

    public void saveTransaction(Transaction transactionData);
    
}
