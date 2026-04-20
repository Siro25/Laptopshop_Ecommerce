package com.example.laptopshop.controller.admin;

import java.util.List;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.laptopshop.domain.User;
import com.example.laptopshop.service.RoleService;
import com.example.laptopshop.service.UploadService;
import com.example.laptopshop.service.UserService;

@Controller
public class UserController {
    private final UserService userService;
    private final RoleService roleService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, RoleService roleService, UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.roleService = roleService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/table-user";
    }

    @GetMapping("/admin/user/create")
    public String getLegacyUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String createUserPage(Model model,
            @ModelAttribute("newUser") User user1,
            @RequestParam("hinhAnh") MultipartFile file) {
        System.out.println("run here " + user1);
        String hashPassword = this.passwordEncoder.encode(user1.getPassword());
        user1.setPassword(hashPassword);
        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        user1.setAvatar(avatar);
        user1.setRole(this.roleService.getRoleByName(user1.getRole().getName()));

        // Fetch role if role.name was bounded automatically by spring
        if (user1.getRole() != null && user1.getRole().getName() != null) {
            user1.setRole(this.roleService.getRoleByName(user1.getRole().getName()));
        }

        this.userService.handleSaveUser(user1);
        return "redirect:/admin/user";
    }

}
