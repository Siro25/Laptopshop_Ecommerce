package com.example.laptopshop.config;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import com.example.laptopshop.domain.Role;
import com.example.laptopshop.repository.RoleRepository;

@Component
public class DataInitializer implements CommandLineRunner {
    private final RoleRepository roleRepository;

    public DataInitializer(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    @Override
    public void run(String... args) {
        ensureRoleExists("USER", "Default user role");
        ensureRoleExists("ADMIN", "Administrator role");
    }

    private void ensureRoleExists(String name, String description) {
        Role existing = roleRepository.findByName(name);
        if (existing != null) {
            return;
        }

        Role role = new Role();
        role.setName(name);
        role.setDescription(description);
        roleRepository.save(role);
    }
}
