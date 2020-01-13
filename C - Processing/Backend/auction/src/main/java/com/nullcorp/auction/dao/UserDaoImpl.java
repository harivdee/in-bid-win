package com.nullcorp.auction.dao;

import com.nullcorp.auction.entity.User;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {

//    @Autowired
//    private SessionFactory sessionFactory;
//    
//    private Session getSession(){
//        return sessionFactory.getCurrentSession();
//    }
    @Autowired
    private EntityManager entityManager;

    private Session getSession() {
        return entityManager.unwrap(Session.class);
    }

    @Override
    public List<User> findAll() {
        Query q = getSession().createNamedQuery("User.findAll");
        List<User> list = q.getResultList();
        return list;
    }

    @Override
    public void createOrUpdate(User u) {
        getSession().saveOrUpdate(u);
    }

    @Override
    public User findById(Integer id) {
        return (User) getSession().get(User.class, id);
        
    }

    @Override
    public void delete(Integer id) {
        Query q = getSession().createNamedQuery("User.deleteById");
        q.setParameter("id", id);
        q.executeUpdate();
    }

    @Override
    public List<User> findByUsername(String searchName) {
        Query q = getSession().createNamedQuery("User.findByUsername");
        q.setParameter("username", searchName+"%");
        return q.getResultList();
    }

}
