package com.nullcorp.auction.controller;

import com.nullcorp.auction.entity.Item;
import com.nullcorp.auction.service.ItemService;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/image")
public class ImageController {
    
    @Autowired
    ItemService iService;
    
    @GetMapping("/thumbnail")
    public void displayThumbnail(@RequestParam("itemId") Integer id,
            HttpServletResponse response, HttpServletRequest request) throws IOException {
        Item item = iService.getItemById(id);
        response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
        response.getOutputStream().write(item.getHouse().getHphoto());
        response.getOutputStream().close();
    }

}
