package com.nullcorp.auction.controller;

import com.nullcorp.auction.entity.Auction;
import com.nullcorp.auction.entity.Item;
import com.nullcorp.auction.service.AuctionService;
import com.nullcorp.auction.service.ItemService;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
@RequestMapping("auction")
public class AuctionController {

    @Autowired
    AuctionService aService;
    @Autowired
    ItemService iService;
//    /////////////////

    @PostMapping("/list")
    public String test(@RequestParam("searchName") String s, Model m) {
        List<Auction> list = aService.getAuctionsByName(s);
        m.addAttribute("listOfAuctions", list);
        return "listAuctions";
    }

    @GetMapping("/list")
    public String getAllAuctions(Model m) {
        List<Auction> list = aService.getAllAuctions();
        m.addAttribute("listOfAuctions", list);
        return "listAuctions";

    }

    @GetMapping("/create")
    public String showCreateAuctionForm(@ModelAttribute("auction") Auction a,
            @RequestParam("itemId") Integer id, Model m) {
        m.addAttribute("itemId", id);
        return "formAuction";
    }

    @PostMapping("/create")
    public String createAuction(@Valid @ModelAttribute("auction") Auction a,
            @RequestParam("itemId") Integer id,
            BindingResult result,
            Model m) {
        Item i = iService.getItemById(id);
        String title = i.getItitle();
        m.addAttribute("title", title);
        if (i.getIstatus().equals("DISABLED")) {
            Timestamp timestamp = new Timestamp(new Date().getTime());
            Calendar cal = Calendar.getInstance();
            a.setStime(timestamp);
            cal.add(Calendar.DAY_OF_MONTH, 7);
            timestamp = new Timestamp(cal.getTime().getTime());
            a.setEtime(timestamp);
            a.setItem(i);
            aService.createOrUpdateAuction(a);
            iService.toggleStatus(i);
            return "redirect:/item/list?userId=" + i.getUser().getUserid();

        } else {
            m.addAttribute("message", "Item is already" + i.getIstatus());
            return "error";
        }

    }

    @GetMapping("/update")
    public String showUpdateAuctionForm(@ModelAttribute("auction") Auction a,
            @RequestParam("auctionId") Integer id, Model m) {
        a = aService.getAuctionById(id);
        m.addAttribute("auction", a);
        m.addAttribute("itemId", a.getItem().getItemid());

        return "formAuction";
    }

    @GetMapping("/delete")
    public String deleteAuction(@RequestParam("auctionId") Integer id) {
        Auction a = aService.getAuctionById(id);
        iService.toggleStatus(a.getItem());
        aService.deleteAuction(id);
        return "redirect:/auction/list";
    }

    @GetMapping("/terminate")
    public String terminateAuction(@RequestParam("auctionId") Integer id) {
        List<Integer> list = new ArrayList();
        list.add(id);
        aService.terminateExpiredAuctions(list);
        return "redirect: /home";
    }
}
