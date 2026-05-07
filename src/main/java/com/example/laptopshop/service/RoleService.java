package com.example.laptopshop.service;

import org.springframework.stereotype.Service;

import com.example.laptopshop.domain.Role;
import com.example.laptopshop.repository.RoleRepository;

@Service
public class RoleService {
    private final RoleRepository roleRepository;

    public RoleService(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public Role getOrCreateRoleByName(String name) {
        if (name == null || name.isBlank()) {
            return null;
        }

        String normalizedName = name.trim();
        Role existing = this.roleRepository.findByName(normalizedName);
        if (existing != null) {
            return existing;
        }

        Role role = new Role();
        role.setName(normalizedName);
        role.setDescription("Default role");
        return this.roleRepository.save(role);
    }
}