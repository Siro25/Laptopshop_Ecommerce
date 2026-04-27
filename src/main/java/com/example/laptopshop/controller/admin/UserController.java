package com.example.laptopshop.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.laptopshop.domain.User;
import com.example.laptopshop.domain.Role;
import com.example.laptopshop.service.RoleService;
import com.example.laptopshop.service.UploadService;
import com.example.laptopshop.service.UserService;

import jakarta.validation.Valid;

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
        User newUser = new User();
        newUser.setRole(new Role());
        model.addAttribute("newUser", newUser);
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String createUserPage(@ModelAttribute("newUser") @Valid User user1, BindingResult newUserBindingResult,
            @RequestParam("hinhAnh") MultipartFile file) {
        if (user1.getRole() == null) {
            user1.setRole(new Role());
        }

        if (user1.getEmail() != null && this.userService.checkEmailExists(user1.getEmail())) {
            newUserBindingResult.rejectValue("email", "error.newUser", "Email đã tồn tại");
        }

        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }

        String hashPassword = this.passwordEncoder.encode(user1.getPassword());
        user1.setPassword(hashPassword);
        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        user1.setAvatar(avatar);
        if (user1.getRole() != null && user1.getRole().getName() != null) {
            user1.setRole(this.roleService.getRoleByName(user1.getRole().getName()));
        }

        this.userService.handleSaveUser(user1);
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable Long id) {
        User user = this.userService.getUserById(id);
        if (user == null) {
            return "redirect:/admin/user";
        }

        model.addAttribute("user", user);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable Long id) {
        User user = this.userService.getUserById(id);
        if (user == null) {
            return "redirect:/admin/user";
        }

        model.addAttribute("newUser", user);
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUserPage(@ModelAttribute("newUser") User user) {
        this.userService.deleteUser(user.getId());
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable Long id) {
        User currentUser = this.userService.getUserById(id);
        if (currentUser == null) {
            return "redirect:/admin/user";
        }

        if (currentUser.getRole() == null) {
            currentUser.setRole(new Role());
        }

        model.addAttribute("newUser", currentUser);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUserPage(@ModelAttribute("newUser") User updateUser,
            @RequestParam("hinhAnh") MultipartFile file) {
        User currentUser = this.userService.getUserById(updateUser.getId());
        if (currentUser == null) {
            return "redirect:/admin/user";
        }

        if (!currentUser.getEmail().equals(updateUser.getEmail())
                && this.userService.checkEmailExists(updateUser.getEmail())) {
            return "redirect:/admin/user/update/" + updateUser.getId();
        }

        currentUser.setFullname(updateUser.getFullname());
        currentUser.setEmail(updateUser.getEmail());
        currentUser.setPhone(updateUser.getPhone());
        currentUser.setAddress(updateUser.getAddress());

        if (updateUser.getRole() != null && updateUser.getRole().getName() != null) {
            currentUser.setRole(this.roleService.getRoleByName(updateUser.getRole().getName()));
        }

        if (updateUser.getPassword() != null && !updateUser.getPassword().isBlank()) {
            String hashPassword = this.passwordEncoder.encode(updateUser.getPassword());
            currentUser.setPassword(hashPassword);
        }

        if (file != null && !file.isEmpty()) {
            String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
            currentUser.setAvatar(avatar);
        }

        this.userService.handleSaveUser(currentUser);
        return "redirect:/admin/user";
    }

}
