
package com.nullcorp.auction.dao;

import com.nullcorp.auction.entity.Role;
import java.util.List;

/**
 *
 * @author chris
 */
public interface RoleDao {

    public List<Role> findAll();

    public Role findById(Integer id);
    
}
