<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8">
            <title>LaptopShop - Homepage</title>
            <meta content="width=device-width, initial-scale=1.0" name="viewport">
            <meta content="" name="keywords">
            <meta content="" name="description">

            <!-- Google Web Fonts -->
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link
                href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@500;600;700&display=swap"
                rel="stylesheet">

            <style>
                :root {
                    --font-heading: 'Poppins', sans-serif;
                    --font-body: 'Inter', sans-serif;
                }

                body {
                    font-family: var(--font-body);
                }

                h1,
                h2,
                h3,
                h4,
                h5,
                h6 {
                    font-family: var(--font-heading);
                }
            </style>

            <!-- Icon Font Stylesheet -->
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

            <!-- Customized Bootstrap Stylesheet -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

        </head>

        <body>
            <!-- Navbar start -->
            <div class="container-fluid bg-white fixed-top shadow-sm px-0">
                <div class="container">
                    <nav class="navbar navbar-light navbar-expand-xl py-3">
                        <a href="/" class="navbar-brand">
                            <h1 class="text-primary display-6 mb-0">LaptopShop</h1>
                        </a>
                        <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarCollapse">
                            <span class="fa fa-bars text-primary"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarCollapse">
                            <div class="navbar-nav mx-auto text-center">
                                <a href="/" class="nav-item nav-link active px-3">Home</a>
                                <a href="/shop" class="nav-item nav-link px-3">Shop</a>
                                <div class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle px-3"
                                        data-bs-toggle="dropdown">Categories</a>
                                    <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                        <a href="#" class="dropdown-item">Laptops</a>
                                        <a href="#" class="dropdown-item">Macbooks</a>
                                        <a href="#" class="dropdown-item">Accessories</a>
                                    </div>
                                </div>
                                <a href="/contact" class="nav-item nav-link px-3">Contact</a>
                            </div>
                            <div class="d-flex justify-content-center m-3 me-0">
                                <button
                                    class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4"
                                    data-bs-toggle="modal" data-bs-target="#searchModal">
                                    <i class="fas fa-search text-primary"></i>
                                </button>
                                <c:choose>
                                    <c:when test="${not empty currentUser}">
                                        <a href="/cart" class="position-relative me-4 my-auto">
                                            <i class="fa fa-shopping-bag fa-2x text-primary"></i>
                                            <c:if test="${cartItemCount > 0}">
                                                <span
                                                    class="position-absolute bg-secondary text-dark rounded-circle d-flex align-items-center justify-content-center px-1"
                                                    style="top: -5px; left: 15px; height: 20px; min-width: 20px; font-size: 12px; font-weight: bold;">${cartItemCount}</span>
                                            </c:if>
                                        </a>
                                        <div class="nav-item dropdown">
                                            <a href="#" class="nav-link dropdown-toggle p-0 my-auto"
                                                data-bs-toggle="dropdown" aria-expanded="false">
                                                <i class="fas fa-user fa-2x text-primary"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-end m-0 p-2">
                                                <div class="px-3 py-2 border-bottom text-center">
                                                    <c:choose>
                                                        <c:when test="${not empty sessionScope.avatar}">
                                                            <img src="/resources/images/avatar/${sessionScope.avatar}"
                                                                alt="avatar" class="rounded-circle"
                                                                style="width: 48px; height: 48px; object-fit: cover;" />
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="rounded-circle bg-light d-inline-flex align-items-center justify-content-center"
                                                                style="width: 48px; height: 48px;">
                                                                <i class="fas fa-user text-primary"></i>
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <c:if test="${not empty sessionScope.fullName}">
                                                        <div class="mt-2 fw-semibold">${sessionScope.fullName}</div>
                                                    </c:if>
                                                </div>
                                                <a href="/account" class="dropdown-item">Quản lý tài khoản</a>
                                                <a href="/orders" class="dropdown-item">Lịch sử mua</a>
                                                <div class="dropdown-divider"></div>
                                                <form method="post" action="/logout" class="m-0">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <button type="submit" class="dropdown-item text-danger">Đăng
                                                        xuất</button>
                                                </form>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/login" class="my-auto nav-link text-primary fw-semibold">Đăng nhập</a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
            <!-- Navbar End -->