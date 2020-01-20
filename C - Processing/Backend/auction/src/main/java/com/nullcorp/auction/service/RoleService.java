
package com.nullcorp.auction.service;

import com.nullcorp.auction.entity.Role;
import java.util.List;


public interface RoleService {
    
     public List<Role> getRoles();

    public Role findById(Integer id);
    
}
