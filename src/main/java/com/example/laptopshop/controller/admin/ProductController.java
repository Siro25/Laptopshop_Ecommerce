package com.example.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.laptopshop.domain.Product;
import com.example.laptopshop.service.ProductService;
import com.example.laptopshop.service.UploadService;

import jakarta.validation.Valid;

@Controller
public class ProductController {
    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String getDashboard(Model model) {
        List<Product> products = this.productService.getAllProducts();
        model.addAttribute("products", products);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProductPage(
            @ModelAttribute("newProduct") @Valid Product newProduct,
            BindingResult newProductBindingResult,
            @RequestParam("hinhAnh") MultipartFile file) {

        if (file == null || file.isEmpty()) {
            newProductBindingResult.rejectValue("image", "error.newProduct", "Vui lòng chọn ảnh sản phẩm");
        } else {
            String contentType = file.getContentType();
            if (contentType == null || !contentType.startsWith("image/")) {
                newProductBindingResult.rejectValue("image", "error.newProduct", "File tải lên phải là ảnh");
            }
        }

        if (newProductBindingResult.hasErrors()) {
            return "admin/product/create";
        }

        String imageName = this.uploadService.handleSaveUploadFile(file, "product");
        newProduct.setImage(imageName);
        this.productService.handleSaveProduct(newProduct);
        return "redirect:/admin/product";
    }
}