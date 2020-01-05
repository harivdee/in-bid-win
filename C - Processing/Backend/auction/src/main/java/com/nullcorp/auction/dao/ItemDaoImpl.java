package com.nullcorp.auction.dao;

import com.nullcorp.auction.entity.Item;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ItemDaoImpl implements ItemDao {

    @Autowired
    private EntityManager entityManager;

    private Session getSession() {
        return entityManager.unwrap(Session.class);
    }

    @Override
    public List<Item> findAll(Integer id) {
        Query q = getSession().createQuery("SELECT i FROM Item i WHERE i.user.id = :userid");
//        Query q = getSession().createQuery("SELECT i, h.hid FROM Item i JOIN i.house h WHERE i.user.id = :userid" );
        q.setParameter("userid", id);
        List<Item> list = q.getResultList();
        return list;
    }

    @Override
    public Item findByid(Integer id) {
        Query q = getSession().createQuery("SELECT i FROM Item i WHERE i.itemid = :itemId");
        q.setParameter("itemId", id);
        return (Item)q.getSingleResult();
    }

    @Override
    public void createOrUpdate(Item i) {
        getSession().saveOrUpdate(i);
    }

}
