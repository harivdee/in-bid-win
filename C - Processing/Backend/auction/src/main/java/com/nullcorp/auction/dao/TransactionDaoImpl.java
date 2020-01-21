package com.nullcorp.auction.dao;

import com.nullcorp.auction.entity.Transaction;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
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

    @Override
    public List<Transaction> getAllWonByUserId(Integer id) {
        Query q = getSession().createQuery("SELECT t FROM Transaction t WHERE t.winner.userid=: id");
        q.setParameter("id", id);
        List<Transaction> list = q.getResultList();
        return list;
    }

    @Override
    public List<Transaction> getAllOwnedByUserId(Integer id) {
        Query q = getSession().createQuery("SELECT t FROM Transaction t WHERE t.owner.userid=:id");
        q.setParameter("id", id);
        List<Transaction> list = q.getResultList();
        return list;
    }

}
