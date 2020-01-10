
package com.nullcorp.auction.dao;

import com.nullcorp.auction.entity.House;
import java.util.Map;
import javax.persistence.EntityManager;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HouseDaoImpl implements HouseDao{
    @Autowired
    private EntityManager entityManager;

    private Session getSession() {
        return entityManager.unwrap(Session.class);
    }
    @Override
    public void createOrUpdate(House h) {
        getSession().saveOrUpdate(h);
    }
    
}
