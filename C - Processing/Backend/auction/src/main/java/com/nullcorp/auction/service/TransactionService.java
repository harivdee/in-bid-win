
package com.nullcorp.auction.service;

import com.nullcorp.auction.entity.Transaction;
import java.util.List;


public interface TransactionService {

    public void generateTransaction(Transaction transactionData);

    public List<Transaction> getAllWonTransactionsByUserId(Integer id);

    public List<Transaction> getAllOwnedTransactionsByUserId(Integer id);
    
}
