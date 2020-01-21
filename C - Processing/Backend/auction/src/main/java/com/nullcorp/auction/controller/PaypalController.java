package com.nullcorp.auction.controller;

import com.nullcorp.auction.service.PaypalService;
import com.nullcorp.auction.service.UserService;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;
import java.math.BigDecimal;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PaypalController {

    @Autowired
    PaypalService service;
    
    @Autowired
    UserService uService;

    @GetMapping("/cancel")
    public String cancelPay() {
        return "cancel";
    }

    @GetMapping("/checkout")
    public String checkout() {
        return "checkout";
    }

    @GetMapping("/addCredits")
    public String addCredits() {
        return "addCredits";
    }

    @PostMapping("/authorize_payment")
    public String authorizePayment(@RequestParam("credit") Double credit, Model model) {
        System.out.println("OrderDetail=" + credit);
        try {
            String approvalLink = service.authorizePayment(credit);
            System.out.println("approvalLink===" + approvalLink);
            return "redirect:" + approvalLink;

        } catch (PayPalRESTException ex) {
            Logger.getLogger(PaypalController.class.getName()).log(Level.SEVERE, null, ex);
            model.addAttribute("errorMessage", ex.getMessage());
            return "error";
        }
    }

    @GetMapping("/review_payment")
    public String reviewPayment(Model model,
            @RequestParam("paymentId") String paymentId,
            @RequestParam("PayerID") String payerId) {
        try {
            Payment payment = service.getPaymentDetails(paymentId);
            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
            model.addAttribute("paymentId", paymentId);
            model.addAttribute("PayerID", payerId);
            model.addAttribute("payer", payerInfo);
            model.addAttribute("transaction", transaction);
            return "review";
        } catch (PayPalRESTException ex) {
            Logger.getLogger(PaypalController.class.getName()).log(Level.SEVERE, null, ex);
            model.addAttribute("errorMessage", ex.getMessage());
            return "error";
        }
    }

    @PostMapping("/execute_payment")
    public String executePayment(Model model,
            @RequestParam("paymentId") String paymentId,
            @RequestParam("PayerID") String payerId) {
        try {
            Payment payment = service.executePayment(paymentId, payerId);
            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
            //After confirmation find user and 
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            //Add the credit to the user // We get the total amount as string and convert it to BigDecimal
            uService.addCreditToUser(auth.getName(), new BigDecimal(transaction.getAmount().getTotal()));
            model.addAttribute("payer", payerInfo);
            model.addAttribute("transaction", transaction);
            return "receipt";
        } catch (PayPalRESTException ex) {
            Logger.getLogger(PaypalController.class.getName()).log(Level.SEVERE, null, ex);
            model.addAttribute("errorMessage", ex.getMessage());
            return "error";
        }
    }

}
