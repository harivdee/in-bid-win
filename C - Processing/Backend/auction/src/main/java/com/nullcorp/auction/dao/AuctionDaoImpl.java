package com.nullcorp.auction.dao;

import com.nullcorp.auction.entity.Auction;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AuctionDaoImpl implements AuctionDao {
    
    @Autowired
    private EntityManager entityManager;
    
    private Session getSession() {
        return entityManager.unwrap(Session.class);
    }
    
    @Override
    public void createOrUpdateAuction(Auction a) {
        getSession().saveOrUpdate(a);
        
    }
    
    @Override
    public List<Auction> findall() {
        Query q = getSession().createNamedQuery("Auction.findAll");
        List<Auction> list = q.getResultList();
        return list;
    }
    
    @Override
    public Auction findById(Integer id) {
        return (Auction) getSession().get(Auction.class, id);
    }
    
    @Override
    public void delete(Integer id) {
        Query q = getSession().createNativeQuery("delete from auction where auctionid=:id");
        q.setParameter("id", id);
        q.executeUpdate();
        
    }
    
}
