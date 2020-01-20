package com.nullcorp.auction.service;

import com.nullcorp.auction.dao.UserDao;
import com.nullcorp.auction.entity.Role;
import com.nullcorp.auction.entity.User;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao udao;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    public List<User> getAllUsers() {
        return udao.findAll();
    }

    @Override
    public void createOrUpdateUser(User u) {
        u.setPassword(passwordEncoder.encode(u.getPassword()));
        udao.createOrUpdate(u);
        udao.addRole(u.getUserid(), 2);
    }

    @Override
    public User getUserById(Integer id) {
        return udao.findById(id);

    }

    @Override
    public void deleteUser(Integer id) {
        udao.delete(id);
    }

    @Override
    public List<User> findUsersByUsername(String searchName) {
        return udao.findByUsername(searchName);
    }

    @Override
    public User findByUsername(String username) {
        return udao.findUserByUsername(username);
    }

    

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = udao.findUserByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("Invalid username");
        }
        UserDetails userDetails = new org.springframework.security.core.userdetails.User(
                user.getUsername(),
                user.getPassword(),
                mapRolesToAuthorities(user.getRoles()));

        return userDetails;
    }

    private Collection<? extends GrantedAuthority> mapRolesToAuthorities(List<Role> roles) {
        List<GrantedAuthority> authorities = new ArrayList();
        for (Role r : roles) {
            SimpleGrantedAuthority authority = new SimpleGrantedAuthority(r.getRolename());
            authorities.add(authority);
        }
        return authorities;
    }

    @Override
    public User getUserByUsername(String uname) {
        return udao.getByUsername(uname);
    }

}
