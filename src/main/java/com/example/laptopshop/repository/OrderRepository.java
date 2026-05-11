package com.example.laptopshop.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.laptopshop.domain.Order;
import com.example.laptopshop.domain.User;

public interface OrderRepository extends JpaRepository<Order, Long> {
    Optional<Order> findFirstByUserAndStatus(User user, String status);
}
