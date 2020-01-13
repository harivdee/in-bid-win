
package com.nullcorp.auction.dao;

import com.nullcorp.auction.entity.House;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.Query;
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

    @Override
    public House findById(Integer id) {
        return getSession().get(House.class, id);
        
    }

    @Override
    public void delete(Integer id) {
        Query q = getSession().createNamedQuery("House.deleteById");
        q.setParameter("id", id);
        q.executeUpdate();
    }
    
}
