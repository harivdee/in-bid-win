package com.nullcorp.auction.controller;

import com.nullcorp.auction.entity.House;
import com.nullcorp.auction.entity.Image;
import com.nullcorp.auction.service.HouseService;
import com.nullcorp.auction.service.ImageService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/image")
public class ImageController {

    @Autowired
    ImageService imService;
    @Autowired
    HouseService hService;

    @GetMapping("/list")
    public String listImages(@RequestParam("houseId") Integer id, Model m) {
        List<Image> list = imService.getAllImagesByHouse(id);
        House h = hService.getHouseById(id);
        m.addAttribute("listOfImages", list);
        m.addAttribute("house", h);
        m.addAttribute("hid",h.getHid());
        return "listImages";
    }

    @GetMapping("/upload")
    public String getImageForm(@ModelAttribute("image") Image i,
            @RequestParam("hid") Integer id, Model m) {
        House h = hService.getHouseById(id);
        m.addAttribute("house", h);
        return "formImage";
    }

    @PostMapping("/upload")
    public String uploadImages(@ModelAttribute("image") Image i,
            @RequestParam("houseId") Integer id,
            BindingResult result, Model m) {
        i.setHouse(hService.getHouseById(id));
        imService.createOrUpdateImage(i);
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        
        return "redirect:/item/listByUsername?username="+auth.getName();

    }
}
