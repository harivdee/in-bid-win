
package com.nullcorp.auction.controller;

import com.nullcorp.auction.entity.Transaction;
import com.nullcorp.auction.service.TransactionService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/transaction")
public class TransactionController {
    @Autowired
    TransactionService tService;
    
    @GetMapping("/list")
    public String getUserTransactions(@RequestParam("userId") Integer id, 
            Model m){
        System.out.println("@@@@@@@@@@@@@@@@@@@@ before fetch"+id );
        List<Transaction> listWon = tService.getAllWonTransactionsByUserId(id);
        List<Transaction> listOwn = tService.getAllOwnedTransactionsByUserId(id);
        
                System.out.println("@@@@@@@@@@@@@@@@@@@@ after fetch"+id );

        m.addAttribute("winnerTransactions", listWon);
        m.addAttribute("ownerTransactions", listOwn);
        return "listTransactions";
    }
    
}
