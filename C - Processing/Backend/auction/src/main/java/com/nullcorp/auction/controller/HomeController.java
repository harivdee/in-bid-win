package com.nullcorp.auction.controller;

import com.nullcorp.auction.entity.User;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    
    @GetMapping("/")
    public String home(){

        return "home";
    }
    
    @GetMapping("/spiti")
    public String spiti(){

        return "activeAuctions";
    }
    
   
}
