
package com.nullcorp.auction.dao;

import com.nullcorp.auction.entity.Role;
import java.util.List;
import javax.persistence.EntityManager;
import org.springframework.beans.factory.annotation.Autowired;
import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

@Repository
public class RoleDaoImpl implements RoleDao{
       
    @Autowired
    private EntityManager entityManager;

    private Session getSession() {
        return entityManager.unwrap(Session.class);
    }

    @Override
    public List<Role> findAll() {
        Query q = getSession().createQuery("SELECT r FROM Role r");
        List<Role> list = q.getResultList();
        return list;
    }

    
    @Override
    public Role findById(Integer id) {
        return getSession().byId(Role.class).load(id);
    }
    
}
