
package com.nullcorp.auction.service;

import com.nullcorp.auction.entity.Role;
import java.util.List;

/**
 *
 * @author chris
 */
public interface RoleService {
    
     public List<Role> getRoles();

    public Role findById(Integer id);
    
}
