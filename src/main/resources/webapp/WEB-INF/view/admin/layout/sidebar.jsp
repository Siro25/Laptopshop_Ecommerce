<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <div class="d-flex flex-column flex-shrink-0 p-3 text-bg-dark" style="width: 250px; min-height: 100vh;">
        <a href="/admin/dashboard"
            class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
            <span class="fs-4">Admin Panel</span>
        </a>
        <hr>
        <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item">
                <a href="/admin/dashboard" class="nav-link text-white">
                    Dashboard
                </a>
            </li>
            <li>
                <a href="/admin/order" class="nav-link text-white">
                    Order
                </a>
            </li>
            <li>
                <a href="/admin/product" class="nav-link text-white">
                    Product
                </a>
            </li>
            <li>
                <a href="/admin/user" class="nav-link text-white active">
                    User
                </a>
            </li>
        </ul>
    </div>