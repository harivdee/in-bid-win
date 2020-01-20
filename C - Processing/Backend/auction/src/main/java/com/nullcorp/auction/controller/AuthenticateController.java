
package com.nullcorp.auction.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
<<<<<<< HEAD
=======

>>>>>>> login-redirect


@Controller
public class AuthenticateController {
    
    @GetMapping("/loginPage")
    public String showLoginForm(){
        return "login";
    }
    
<<<<<<< HEAD
    @PostMapping("/loginPage")
    public String takeMeHome(){
        return "/";
=======
    @PostMapping("/")
    public String loginSuccess(){
        return "home";
>>>>>>> login-redirect
    }
    
    @GetMapping("/access-denied")
    public String showAccessDeniedPage(){
        return "access-denied";
    }
    
}
