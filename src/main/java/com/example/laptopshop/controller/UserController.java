package com.example.laptopshop.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.laptopshop.domain.User;
import com.example.laptopshop.service.UserService;

@Controller
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        List<User> arrUsers = this.userService.getUsersByEmail("s2@gmail.com");
        System.out.println(arrUsers);
        model.addAttribute("sido", "test");
        return "hello";
    }

    @GetMapping("/admin/user")
    public String getUserPage(Model model) {
        return "admin/user/table-user";
    }

    @GetMapping("/admin/user/create")
    public String getLegacyUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping({ "/admin/user/create", "/admin/user/create" })
    public String createUserPage(Model model, @ModelAttribute("newUser") User user1) {
        System.out.println("run here" + user1);
        this.userService.handleSaveUser(user1);
        return "redirect:/admin/user";
    }

}
