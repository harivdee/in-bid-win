package com.nullcorp.auction.dao;

import com.nullcorp.auction.entity.Bid;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BidDaoImpl implements BidDao{
     @Autowired
    private EntityManager entityManager;

    private Session getSession() {
        return entityManager.unwrap(Session.class);
    }

    @Override
    public List<Bid> findAllByAuction(Integer id) {
        Query q = getSession().createQuery("SELECT b from Bid b WHERE b.auction.auctionid=: id");
        q.setParameter("id", id);
        return q.getResultList();
    }

    @Override
    public void placeBid(Bid b) {
        getSession().save(b);
    }

    @Override
    public void deleteById(Integer id) {
        Query q = getSession().createQuery("DELETE FROM Bid b WHERE b.bidid=:id");
        q.setParameter("id", id);
        q.executeUpdate();
    }

    @Override
    public Bid findById(Integer id) {
        return getSession().get(Bid.class, id);
    }
    
}
