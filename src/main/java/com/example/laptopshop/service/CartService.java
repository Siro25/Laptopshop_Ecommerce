package com.example.laptopshop.service;

import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.laptopshop.domain.Order;
import com.example.laptopshop.domain.OrderDetail;
import com.example.laptopshop.domain.Product;
import com.example.laptopshop.domain.User;
import com.example.laptopshop.repository.OrderDetailRepository;
import com.example.laptopshop.repository.OrderRepository;
import com.example.laptopshop.repository.ProductRepository;

@Service
public class CartService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final ProductRepository productRepository;

    public CartService(OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository,
            ProductRepository productRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
        this.productRepository = productRepository;
    }

    public Order getCart(User user) {
        if (user == null) {
            return null;
        }

        return orderRepository.findFirstByUserAndStatus(user, Order.STATUS_CART).orElse(null);
    }

    public List<OrderDetail> getCartItems(User user) {
        Order cart = getCart(user);
        if (cart == null) {
            return Collections.emptyList();
        }

        return orderDetailRepository.findByOrder(cart);
    }

    public long getCartItemCount(User user) {
        Order cart = getCart(user);
        if (cart == null) {
            return 0;
        }

        return orderDetailRepository.findByOrder(cart)
                .stream()
                .mapToLong(OrderDetail::getQuantity)
                .sum();
    }

    @Transactional
    public boolean addToCart(User user, long productId, long quantity) {
        if (user == null || quantity <= 0) {
            return false;
        }

        Product product = productRepository.findById(productId).orElse(null);
        if (product == null) {
            return false;
        }

        Order cart = getOrCreateCart(user);
        OrderDetail detail = orderDetailRepository.findFirstByOrderAndProduct(cart, product).orElse(null);
        if (detail == null) {
            detail = new OrderDetail();
            detail.setOrder(cart);
            detail.setProduct(product);
            detail.setPrice(product.getPrice());
            detail.setQuantity(quantity);
        } else {
            detail.setQuantity(detail.getQuantity() + quantity);
        }

        orderDetailRepository.save(detail);
        refreshCartTotal(cart);
        return true;
    }

    @Transactional
    public void removeItem(User user, long orderDetailId) {
        Order cart = getCart(user);
        if (cart == null) {
            return;
        }

        OrderDetail detail = orderDetailRepository.findById(orderDetailId).orElse(null);
        if (detail == null || detail.getOrder() == null
                || !detail.getOrder().getId().equals(cart.getId())) {
            return;
        }

        orderDetailRepository.delete(detail);
        refreshCartTotal(cart);
    }

    @Transactional
    public void updateItemQuantity(User user, long orderDetailId, long delta) {
        if (user == null || delta == 0) {
            return;
        }

        Order cart = getCart(user);
        if (cart == null) {
            return;
        }

        OrderDetail detail = orderDetailRepository.findById(orderDetailId).orElse(null);
        if (detail == null || detail.getOrder() == null
                || !detail.getOrder().getId().equals(cart.getId())) {
            return;
        }

        long newQuantity = detail.getQuantity() + delta;
        if (newQuantity < 1) {
            newQuantity = 1;
        }

        detail.setQuantity(newQuantity);
        orderDetailRepository.save(detail);

        refreshCartTotal(cart);
    }

    @Transactional
    public Order placeOrder(User user, String fullname, String phone, String address) {
        if (user == null) {
            return null;
        }

        Order cart = getCart(user);
        if (cart == null) {
            return null;
        }

        if (orderDetailRepository.findByOrder(cart).isEmpty()) {
            return null;
        }

        cart.setReceiverName(normalizeReceiverValue(fullname, user.getFullname()));
        cart.setReceiverPhone(normalizeReceiverValue(phone, user.getPhone()));
        cart.setShippingAddress(normalizeReceiverValue(address, user.getAddress()));
        cart.setStatus(Order.STATUS_PENDING);

        refreshCartTotal(cart);
        return cart;
    }

    private Order getOrCreateCart(User user) {
        Order cart = getCart(user);
        if (cart != null) {
            return cart;
        }

        Order newCart = new Order();
        newCart.setUser(user);
        newCart.setStatus(Order.STATUS_CART);
        newCart.setTotalPrice(0);
        return orderRepository.save(newCart);
    }

    private void refreshCartTotal(Order cart) {
        double total = orderDetailRepository.findByOrder(cart)
                .stream()
                .mapToDouble(item -> item.getPrice() * item.getQuantity())
                .sum();
        cart.setTotalPrice(total);
        orderRepository.save(cart);
    }

    private String normalizeReceiverValue(String value, String fallback) {
        if (value != null && !value.isBlank()) {
            return value.trim();
        }

        if (fallback != null && !fallback.isBlank()) {
            return fallback.trim();
        }

        return null;
    }
}
