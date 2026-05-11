package com.example.laptopshop.config;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.example.laptopshop.domain.User;
import com.example.laptopshop.repository.UserRepository;
import com.example.laptopshop.service.CartService;

// thêm 1 class để có thể sử dụng currentUser ở tất cả các view mà không cần phải thêm vào model ở từng controller nữa, tránh bị trùng code
@ControllerAdvice
public class GlobalModelAttributes {
    private final UserRepository userRepository;
    private final CartService cartService;

    public GlobalModelAttributes(UserRepository userRepository, CartService cartService) {
        this.userRepository = userRepository;
        this.cartService = cartService;
    }

    @ModelAttribute("currentUser")
    public User currentUser(Authentication authentication) {
        if (authentication == null
                || !authentication.isAuthenticated()
                || authentication instanceof AnonymousAuthenticationToken) {
            return null;
        }

        return this.userRepository.findFirstByEmail(authentication.getName()).orElse(null);
    }

    @ModelAttribute("cartItemCount")
    public long cartItemCount(Authentication authentication) {
        User user = currentUser(authentication);
        if (user == null) {
            return 0;
        }

        return cartService.getCartItemCount(user);
    }
}
