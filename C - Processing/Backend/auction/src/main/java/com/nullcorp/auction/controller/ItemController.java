package com.nullcorp.auction.controller;

import com.nullcorp.auction.entity.House;
import com.nullcorp.auction.entity.Image;
import com.nullcorp.auction.entity.Item;
import com.nullcorp.auction.entity.ItemFormWrapper;
import com.nullcorp.auction.entity.User;
import com.nullcorp.auction.service.HouseService;
import com.nullcorp.auction.service.ImageService;
import com.nullcorp.auction.service.ItemService;
import com.nullcorp.auction.service.UserService;
import java.io.IOException;
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
    @Autowired
    ImageService imService;

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
    public String createOrUpdateItem(@Valid @ModelAttribute("itemForm") ItemFormWrapper i,
            @RequestParam("userId") Integer id,
            BindingResult result,
            Model m,
            @ModelAttribute("image") Image image) throws IOException {
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
        m.addAttribute("house", house);
        return "redirect:/image/upload?hid="+house.getHid();
    }
    
    @GetMapping("/update")
    public String showUpdateItemForm(@ModelAttribute("itemForm") ItemFormWrapper i,
            @RequestParam("itemId") Integer id, Model m){
        Item it = itService.getItemById(id);
        House h = hService.getHouseById(it.getItemid());
        i.setItem(it);
        i.setHouse(h);
        m.addAttribute("user", it.getUser());
        m.addAttribute("item", i);
        
        return "formItem";
    }
    
    @GetMapping("/delete")
    public String deleteItem(@RequestParam("userId") Integer uid,
            @RequestParam("itemId") Integer iid){
//        itService.deleteItem(iid);
//        hService.deleteHouseByItemId(iid);
        Item i = itService.getItemById(iid);
        itService.delete(i);
//        imService.deleteImagesByHouseId()
        User u = uService.getUserById(uid);
        return "redirect:/item/list?userId="+u.getUserid();
    }

}
