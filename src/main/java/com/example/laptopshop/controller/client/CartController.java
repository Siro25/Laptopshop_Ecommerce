package com.example.laptopshop.controller.client;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.laptopshop.domain.OrderDetail;
import com.example.laptopshop.domain.User;
import com.example.laptopshop.service.CartService;
import com.example.laptopshop.service.UserService;

@Controller
@RequestMapping("/cart")
@PreAuthorize("isAuthenticated()")
public class CartController {
    private final CartService cartService;
    private final UserService userService;

    public CartController(CartService cartService, UserService userService) {
        this.cartService = cartService;
        this.userService = userService;
    }

    @GetMapping
    public String getCart(Model model, Authentication authentication) {
        User user = userService.getUserByEmail(authentication.getName());
        if (user == null) {
            return "redirect:/login";
        }

        List<OrderDetail> cartItems = cartService.getCartItems(user);
        double cartTotal = cartItems.stream()
                .mapToDouble(item -> item.getPrice() * item.getQuantity())
                .sum();

        model.addAttribute("cartItems", cartItems);
        model.addAttribute("cartTotal", cartTotal);
        return "client/cart/show";
    }

    @PostMapping("/add")
    public String addToCart(@RequestParam("productId") long productId,
            @RequestParam(value = "quantity", defaultValue = "1") long quantity,
            Authentication authentication,
            RedirectAttributes redirectAttributes) {
        User user = userService.getUserByEmail(authentication.getName());
        if (user == null) {
            return "redirect:/login";
        }

        boolean added = cartService.addToCart(user, productId, quantity);
        if (!added) {
            redirectAttributes.addFlashAttribute("cartError", "Sản phẩm không tồn tại hoặc số lượng không hợp lệ.");
            return "redirect:/cart";
        }

        redirectAttributes.addFlashAttribute("cartMessage", "Đã thêm sản phẩm vào giỏ hàng.");
        return "redirect:/cart";
    }

    @PostMapping("/remove")
    public String removeFromCart(@RequestParam("orderDetailId") long orderDetailId,
            Authentication authentication) {
        User user = userService.getUserByEmail(authentication.getName());
        if (user != null) {
            cartService.removeItem(user, orderDetailId);
        }

        return "redirect:/cart";
    }
}
