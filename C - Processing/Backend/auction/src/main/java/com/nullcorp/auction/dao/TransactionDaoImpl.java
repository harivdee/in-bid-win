package com.nullcorp.auction.dao;

import com.nullcorp.auction.entity.Transaction;
import javax.persistence.EntityManager;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TransactionDaoImpl implements TransactionDao {

    @Autowired
    private EntityManager entityManager;

    private Session getSession() {
        return entityManager.unwrap(Session.class);
    }

    @Override
    public void saveTransaction(Transaction transactionData) {
        getSession().save(transactionData);
    }

}
