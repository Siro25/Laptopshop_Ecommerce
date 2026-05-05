package com.example.laptopshop.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.security.access.prepost.PreAuthorize;

import com.example.laptopshop.domain.Product;
import com.example.laptopshop.service.ProductService;

@Controller("clientProductController")
public class ProductController {
    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
    @PreAuthorize("isAuthenticated()")
    public String getProductDetail(@PathVariable("id") long id, Model model) {
        Product product = this.productService.getProductById(id).orElse(null);
        if (product == null) {
            return "redirect:/";
        }

        List<Product> relatedProducts = this.productService.getAllProducts()
                .stream()
                .filter(item -> !item.getId().equals(product.getId()))
                .limit(4)
                .toList();

        model.addAttribute("product", product);
        model.addAttribute("relatedProducts", relatedProducts);
        return "client/product/detail";
    }
}
