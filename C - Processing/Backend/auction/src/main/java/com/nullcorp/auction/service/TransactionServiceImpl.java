
package com.nullcorp.auction.service;

import com.nullcorp.auction.dao.TransactionDao;
import com.nullcorp.auction.entity.Transaction;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class TransactionServiceImpl implements TransactionService{
    @Autowired
    TransactionDao tdao;
    
    @Override
    public void generateTransaction(Transaction transactionData) {
        tdao.saveTransaction(transactionData);
    }

    @Override
    public List<Transaction> getAllWonTransactionsByUserId(Integer id) {
        return tdao.getAllWonByUserId(id);
    }

    @Override
    public List<Transaction> getAllOwnedTransactionsByUserId(Integer id) {
        return tdao.getAllOwnedByUserId(id);
    }
    
}
