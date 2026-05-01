package com.example.laptopshop.domain.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public class RegisterDTO {
    @NotBlank(message = "Vui lòng nhập họ.")
    @Size(max = 50, message = "Họ tối đa 50 ký tự.")
    private String firstName;

    @NotBlank(message = "Vui lòng nhập tên.")
    @Size(max = 50, message = "Tên tối đa 50 ký tự.")
    private String lastName;

    @NotBlank(message = "Vui lòng nhập email.")
    @Email(message = "Email không đúng định dạng.")
    private String email;

    @NotBlank(message = "Vui lòng nhập mật khẩu.")
    @Size(min = 8, max = 64, message = "Mật khẩu từ 8 đến 64 ký tự.")
    private String password;

    @NotBlank(message = "Vui lòng nhập lại mật khẩu.")
    @Size(min = 8, max = 64, message = "Mật khẩu nhập lại từ 8 đến 64 ký tự.")
    private String confirmPassword;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }
}
