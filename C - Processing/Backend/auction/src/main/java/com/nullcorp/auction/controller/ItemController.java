package com.nullcorp.auction.controller;

import com.nullcorp.auction.entity.House;
import com.nullcorp.auction.entity.Item;
import com.nullcorp.auction.entity.ItemFormWrapper;
import com.nullcorp.auction.entity.User;
import com.nullcorp.auction.service.HouseService;
import com.nullcorp.auction.service.ItemService;
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
@RequestMapping("/item")
public class ItemController {

    @Autowired
    UserService uService;
    @Autowired
    ItemService itService;
    @Autowired
    HouseService hService;

    @GetMapping("/list")
    public String getAllItemsByUser(@RequestParam("userId") Integer id, Model m) {
        List<Item> list = itService.getAllItemsByUser(id);
        User u = uService.getUserById(id);
        m.addAttribute("listOfItems", list);
        m.addAttribute("user", u);
        return "listItems";
    }

    @GetMapping("/create")
    public String showCreateItemForm(@ModelAttribute("itemForm") ItemFormWrapper i,
            @RequestParam("userId") Integer id, Model m) {
        User u = uService.getUserById(id);
        m.addAttribute("user", u);
        return "formItem";
    }

    @PostMapping("/create")
    public String createOrUpdateUser(@Valid @ModelAttribute("itemForm") ItemFormWrapper i,
            @RequestParam("userId") Integer id,
            BindingResult result) {
        if (result.hasErrors()) {
            return "formItem";
        }
        Item item = i.getItem();
        House house = i.getHouse();
        User u = uService.getUserById(id);

        hService.createOrUpdateHouse(house);
        item.setHouse(house);
        item.setUser(u);

        itService.createOrUpdateItem(item);
//        List<Image> images = i.getImages();
        
        return "redirect:/item/list?userId="+id;
    }

}
