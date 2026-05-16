package com.example.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.laptopshop.domain.Order;
import com.example.laptopshop.domain.OrderDetail;
import com.example.laptopshop.repository.OrderDetailRepository;
import com.example.laptopshop.service.OrderService;

@Controller
public class OrderController {
    private final OrderService orderService;
    private final OrderDetailRepository orderDetailRepository;

    public OrderController(OrderService orderService, OrderDetailRepository orderDetailRepository) {
        this.orderService = orderService;
        this.orderDetailRepository = orderDetailRepository;
    }

    @GetMapping("/admin/order")
    public String getDashboard(Model model) {
        List<Order> orders = orderService.getAllOrders();
        model.addAttribute("orders", orders);
        return "admin/order/show";
    }

    @GetMapping("/admin/order/{id}")
    public String getOrderDetail(@PathVariable Long id, Model model) {
        Order order = orderService.getOrderById(id);
        if (order == null) {
            return "redirect:/admin/order";
        }

        List<OrderDetail> orderDetails = orderDetailRepository.findByOrder(order);
        model.addAttribute("order", order);
        model.addAttribute("orderDetails", orderDetails);
        model.addAttribute("statusOptions", Order.getManageableStatuses());
        return "admin/order/detail";
    }

    @PostMapping("/admin/order/update-status")
    public String updateOrderStatus(@RequestParam("orderId") Long orderId,
            @RequestParam("status") String status) {
        Order order = orderService.getOrderById(orderId);
        if (order == null) {
            return "redirect:/admin/order";
        }

        if (!Order.isManageableStatus(status)) {
            return "redirect:/admin/order/" + orderId;
        }

        order.setStatus(status);
        orderService.save(order);
        return "redirect:/admin/order/" + orderId;
    }
}