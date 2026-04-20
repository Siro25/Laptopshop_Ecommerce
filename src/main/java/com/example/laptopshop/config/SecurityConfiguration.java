package com.example.laptopshop.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableMethodSecurity(securedEnabled = true)
public class SecurityConfiguration {
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    // sửa lỗi mã hóa mật khẩu bằng BCrypt khi tạo người dùng mới trong
    // UserController.java
    @Bean
    public org.springframework.security.core.userdetails.UserDetailsService userDetailsService(
            PasswordEncoder encoder) {
        org.springframework.security.core.userdetails.UserDetails user = org.springframework.security.core.userdetails.User
                .builder()
                .username("si")
                .password(encoder.encode("12")) // Mã hoá mật khẩu với BCrypt
                .roles("USER")
                .build();
        return new org.springframework.security.provisioning.InMemoryUserDetailsManager(user);
    }

}
