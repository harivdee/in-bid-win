package com.nullcorp.auction.controller;

import com.nullcorp.auction.entity.User;
import com.nullcorp.auction.service.UserService;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user")
public class UserController {
    
    @Autowired
    UserService service;
    @GetMapping("/dashboard")
    public String showUserDashboard(@ModelAttribute("user") User u,
            @RequestParam("username") String username){
        User user = service.findByUsername(username);
        return null;
    }
    
    @GetMapping("/list")
    public String getAllUsers(Model m){
        List<User> list = service.getAllUsers();
        m.addAttribute("listOfUsers", list);
        return "listUsers";
    }
    
    @GetMapping("/create")
    public String showCreateUserForm(@ModelAttribute("user") User u){
        return "formUser";
    }
    
    @PostMapping("/create")
    public String createOrUpdateUser(@Valid User u, BindingResult result){
        if (result.hasErrors()){
            return "formUser";
        }
        service.createOrUpdateUser(u);
        return "redirect:/user/list";
    }
    
    @GetMapping("/update")
    public String showUpdateUserForm(@RequestParam("userId") Integer id, Model m){
        User u = service.getUserById(id);
        m.addAttribute("user", u);
        return "formUser";
    }
    
    @GetMapping("/delete")
    public String deleteUser(@RequestParam("userId") Integer id){
        service.deleteUser(id);
        return "redirect:/user/list";
    }
    
    @GetMapping("/search")
    public String getUserByUsername(@RequestParam("searchName") String searchName, Model m){
        List<User> list = service.findUsersByUsername(searchName);
        m.addAttribute("listOfUsers",list);
        return "listUsers";
    }
}
