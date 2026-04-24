package com.example.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller("clientProductController")
public class ProductController {

    @GetMapping("/product/{id}")
    public String getProductDetail(@PathVariable("id") long id, Model model) {
        // Normally fetch from service: Product product = productService.findById(id);
        // Here we just pass the ID or mock data to the view for demonstration
        model.addAttribute("productId", id);
        return "client/product/detail";
    }
}
