package com.nullcorp.auction.controller;

import com.nullcorp.auction.entity.Item;
import com.nullcorp.auction.entity.User;
import com.nullcorp.auction.service.ItemService;
import com.nullcorp.auction.service.UserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/item")
public class ItemController {

    @Autowired
    ItemService iService;
    @Autowired
    UserService uService;

    @GetMapping("/list")
    public String getAllItems(@RequestParam("userId") Integer id, Model m) {
        List<Item> list = iService.getAllItems(id);
        User u = uService.getUserById(id);

        m.addAttribute("listOfItems", list);
        m.addAttribute("user", u);
        return "listItems";
    }
}
