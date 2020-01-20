
package com.nullcorp.auction.entity;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "role")
public class Role implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int roleid;
    private String rolename; 

    public Role() {
    }

    public Role(int roleid, String rolename) {
        this.roleid = roleid;
        this.rolename = rolename;
    }

    public int getRoleid() {
        return roleid;
    }

    public void setRoleid(int roleid) {
        this.roleid = roleid;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 29 * hash + this.roleid;
        hash = 29 * hash + Objects.hashCode(this.rolename);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Role other = (Role) obj;
        if (this.roleid != other.roleid) {
            return false;
        }
        if (!Objects.equals(this.rolename, other.rolename)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Role{" + "roleid=" + roleid + ", rolename=" + rolename + '}';
    }
    
    
}
