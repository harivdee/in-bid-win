package com.nullcorp.auction.dao;

import com.nullcorp.auction.entity.Image;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import static org.springframework.boot.autoconfigure.AutoConfigurationPackages.get;
import org.springframework.stereotype.Repository;

@Repository
public class ImageDaoImpl implements ImageDao {

    @Autowired
    private EntityManager entityManager;

    private Session getSession() {
        return entityManager.unwrap(Session.class);
    }

    @Override
    public void saveOrUpdate(Image i) {
        getSession().saveOrUpdate(i);
    }

    @Override
    public List<Image> getAllImagesByHouse(Integer id) {
        Query q = getSession().createQuery("SELECT i FROM Image i WHERE i.house.hid = :houseid");
        q.setParameter("houseid", id);
        List<Image> list = q.getResultList();
        return list;
    }

}
