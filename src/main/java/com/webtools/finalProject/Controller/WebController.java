package com.webtools.finalProject.Controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.io.IOException;


@Controller
public class WebController extends SecurityProperties.Filter {

//    @Value("Stripe.public.key")
    private String stripePublicKey = "pk_test_51MypY8FEcNCCTm9vkVA3j4VIRsXSnf91lPHWLD8liyKSKLqi2bvcqWpUQivpQrOtfX8WsRWemlMFVJArdIO0gmoo00qPqcOTnz";
    
//    @GetMapping("/payment")
//    public String home(   Model model) throws ServletException, IOException {
//
//        model.addAttribute("stripePublicKey",stripePublicKey );
//        return "payment";
//    }

    @GetMapping("/payment")
    public String homePage(HttpSession session,   Model model) throws ServletException, IOException {

        model.addAttribute("stripePublicKey",stripePublicKey );
        session.setAttribute("aTotalCost", 0);

        return "payment";
    }
}
