package com.example.laptopshop.controller.client;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.laptopshop.domain.Product;
import com.example.laptopshop.domain.User;
import com.example.laptopshop.domain.dto.RegisterDTO;
import com.example.laptopshop.service.ProductService;
import com.example.laptopshop.service.RoleService;
import com.example.laptopshop.service.UploadService;
import com.example.laptopshop.service.UserService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.validation.Valid;

@Controller
public class HomePageController {
    private final ProductService productService;
    private final UserService userService;
    private final RoleService roleService;
    private final PasswordEncoder passwordEncoder;
    private final UploadService uploadService;

    public HomePageController(ProductService productService, UserService userService, RoleService roleService,
            PasswordEncoder passwordEncoder, UploadService uploadService) {
        this.productService = productService;
        this.userService = userService;
        this.roleService = roleService;
        this.passwordEncoder = passwordEncoder;
        this.uploadService = uploadService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        List<Product> products = this.productService.getAllProducts();
        model.addAttribute("products", products);
        return "client/homepage/show";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(@Valid @ModelAttribute("registerUser") RegisterDTO registerDTO,
            BindingResult bindingResult) {
        if (registerDTO.getEmail() != null && !registerDTO.getEmail().isBlank()
                && this.userService.checkEmailExists(registerDTO.getEmail())) {
            bindingResult.rejectValue("email", "EmailExists", "Email đã tồn tại.");
        }

        if (registerDTO.getPassword() != null && registerDTO.getConfirmPassword() != null
                && !registerDTO.getPassword().equals(registerDTO.getConfirmPassword())) {
            bindingResult.rejectValue("confirmPassword", "PasswordMismatch", "Mật khẩu nhập lại không khớp.");
        }

        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }

        User user = this.userService.registerDTOtoUser(registerDTO);
        String hashPassword = this.passwordEncoder.encode(user.getPassword());

        user.setPassword(hashPassword);
        user.setRole(this.roleService.getOrCreateRoleByName("USER"));
        this.userService.handleSaveUser(user);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "client/auth/login";
    }

    @GetMapping("/account")
    public String getAccountPage() {
        return "client/account/show";
    }

    @GetMapping("/access-denied")
    public String getAccessDeniedPage() {
        return "client/auth/access-denied";
    }

    @PostMapping("/account/update")
    public String updateAccount(@RequestParam("fullname") String fullname,
            @RequestParam(value = "phone", required = false) String phone,
            @RequestParam(value = "address", required = false) String address,
            @RequestParam(value = "password", required = false) String password,
            @RequestParam(value = "avatarFile", required = false) MultipartFile avatarFile,
            Authentication authentication,
            RedirectAttributes redirectAttributes) {
        if (authentication == null || !authentication.isAuthenticated()
                || authentication instanceof AnonymousAuthenticationToken) {
            return "redirect:/login";
        }

        User currentUser = this.userService.getUserByEmail(authentication.getName());
        if (currentUser == null) {
            return "redirect:/login";
        }

        currentUser.setFullname(fullname);
        currentUser.setPhone(phone);
        currentUser.setAddress(address);

        if (password != null && !password.isBlank()) {
            String hashPassword = this.passwordEncoder.encode(password);
            currentUser.setPassword(hashPassword);
        }

        if (avatarFile != null && !avatarFile.isEmpty()) {
            String avatar = this.uploadService.handleSaveUploadFile(avatarFile, "avatar");
            if (avatar != null && !avatar.isBlank()) {
                currentUser.setAvatar(avatar);
            }
        }

        this.userService.handleSaveUser(currentUser);
        redirectAttributes.addFlashAttribute("accountUpdateMessage", "Cập nhật tài khoản thành công.");
        return "redirect:/account";
    }

}
