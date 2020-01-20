package com.nullcorp.auction.controller;

import com.nullcorp.auction.entity.Auction;
import com.nullcorp.auction.entity.Bid;
import com.nullcorp.auction.entity.User;
import com.nullcorp.auction.service.AuctionService;
import com.nullcorp.auction.service.BidService;
import com.nullcorp.auction.service.UserService;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Comparator;
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
@RequestMapping("/bid")
public class BidController {

    @Autowired
    BidService bService;
    @Autowired
    AuctionService aService;
    @Autowired
    UserService uService;

    @GetMapping("/list")
    public String getAllBidsByAuctionId(@RequestParam("auctionId") Integer id,
            Model m) {
        List<Bid> list = bService.getAllBids(id);

        m.addAttribute("bidList", list);
        m.addAttribute("auctionId", id);
        return "listBids";
    }

    @PostMapping("/place")
    public String placeBidAtAuction(@Valid @ModelAttribute("bid") Bid b,
            BindingResult result,
            @RequestParam("auctionId") Integer aid,
            @RequestParam("username") String uname, //this is the bidder Id
            Model m) {
        if (result.hasErrors()) {
            return "itemDetails"; // back to bid form
        }
        User bidder = uService.getUserByUsername(uname);
        Auction auction = aService.getAuctionById(aid);
//        Check if owner is the bidder and return error
        if (auction.getItem().getUser().equals(bidder)) {
            m.addAttribute("message", "You can't bid on your own auction");
            return "error";
        }
//        List<Bid> list = bService.getAllBids(aid);
//        list.sort(Comparator.comparing(Bid::getBprice)); // sort list descending
//        BigDecimal maxBid = list.get(list.size()-1).getBprice();
        BigDecimal maxBid = bService.getMaxBid(aid);
        if (maxBid.compareTo(b.getBprice()) >= 0 || BigDecimal.valueOf(auction.getAreserve()).compareTo(b.getBprice()) >= 0 ) {
             m.addAttribute("message", "Bid not accepted. You need to bid higher");
            return "error";
        }
        Timestamp timestamp = new Timestamp(new Date().getTime());
        b.setBtime(timestamp);
        b.setUser(bidder);
        b.setAuction(auction);
        bService.placeBid(b);
        m.addAttribute("item", b.getAuction().getItem());
        return "redirect:/auction/list"; // on success redirect to auction list page
    }
    
    @GetMapping("/delete")
    public String deleteBid(@RequestParam("bidId") Integer id){
        Bid b = bService.getBidById(id);
        bService.deleteBidById(id);
        return "redirect:/bid/list?auctionId="+b.getAuction().getAuctionid();
    }

}
