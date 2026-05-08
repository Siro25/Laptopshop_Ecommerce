package com.example.laptopshop.config;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.example.laptopshop.domain.User;
import com.example.laptopshop.repository.UserRepository;

// thêm 1 class để có thể sử dụng currentUser ở tất cả các view mà không cần phải thêm vào model ở từng controller nữa, tránh bị trùng code
@ControllerAdvice
public class GlobalModelAttributes {
    private final UserRepository userRepository;

    public GlobalModelAttributes(UserRepository userRepository) {
        this.userRepository = userRepository;
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
}
