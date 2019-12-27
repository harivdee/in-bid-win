package com.nullcorp.auction.controller;

import com.nullcorp.auction.entity.User;
import com.nullcorp.auction.service.UserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
    
    @Autowired
    UserService service;
    @GetMapping("/list")
    public String getAllUsers(Model m){
        List<User> list = service.getAllUsers();
        m.addAttribute("listOfUsers", list);
        return "listUsers";
    }
}
