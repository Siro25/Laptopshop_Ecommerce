package com.example.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable Long id) {
        Product product = this.productService.getProductById(id).orElse(null);
        if (product == null) {
            return "redirect:/admin/product";
        }

        model.addAttribute("newProduct", product);
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postDeleteProduct(@ModelAttribute("newProduct") Product pr) {
        this.productService.deleteProduct(pr.getId());
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable Long id) {
        Product product = this.productService.getProductById(id).orElse(null);
        if (product == null) {
            return "redirect:/admin/product";
        }

        model.addAttribute("product", product);
        model.addAttribute("id", id);
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable Long id) {
        Product currentProduct = this.productService.getProductById(id).orElse(null);
        if (currentProduct == null) {
            return "redirect:/admin/product";
        }

        model.addAttribute("newProduct", currentProduct);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String updateProductPage(
            @ModelAttribute("newProduct") @Valid Product updatedProduct,
            BindingResult updatedProductBindingResult,
            @RequestParam("hinhAnh") MultipartFile file) {
        Product currentProduct = this.productService.getProductById(updatedProduct.getId()).orElse(null);
        if (currentProduct == null) {
            return "redirect:/admin/product";
        }

        if (updatedProductBindingResult.hasErrors()) {
            return "admin/product/update";
        }

        if (file != null && !file.isEmpty()) {
            String contentType = file.getContentType();
            if (contentType == null || !contentType.startsWith("image/")) {
                updatedProductBindingResult.rejectValue("image", "error.newProduct", "File tải lên phải là ảnh");
                return "admin/product/update";
            }

            String imageName = this.uploadService.handleSaveUploadFile(file, "product");
            updatedProduct.setImage(imageName);
        } else {
            updatedProduct.setImage(currentProduct.getImage());
        }

        this.productService.handleSaveProduct(updatedProduct);
        return "redirect:/admin/product";
    }

}