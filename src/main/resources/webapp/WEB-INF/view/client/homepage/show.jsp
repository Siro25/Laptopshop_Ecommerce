<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <jsp:include page="../layout/header.jsp" />

        <style>
            :root {
                --primary-color: #2563eb;
                --accent-color: #f59e0b;
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

            /* Hero Section */
            .hero-banner {
                background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('https://images.unsplash.com/photo-1593640408182-31c70c8268f5?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80') center/cover no-repeat;
                height: 60vh;
                min-height: 500px;
                display: flex;
                align-items: center;
                margin-top: 80px;
            }

            .btn-custom-primary {
                background-color: var(--primary-color);
                border-color: var(--primary-color);
                color: #fff;
                padding: 12px 30px;
                font-weight: 600;
            }

            .btn-custom-primary:hover {
                background-color: #1d4ed8;
                color: #fff;
            }

            .btn-custom-outline {
                border: 2px solid #fff;
                color: #fff;
                padding: 12px 30px;
                font-weight: 600;
            }

            .btn-custom-outline:hover {
                background-color: #fff;
                color: var(--primary-color);
            }

            /* Product Card Premium */
            .product-card {
                border-radius: 12px !important;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
                transition: all 0.3s ease;
                border: 1px solid #eee !important;
                background-color: #fff;
                overflow: hidden;
            }

            .product-card:hover {
                transform: translateY(-8px);
                box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
            }

            .product-card img {
                transition: transform 0.5s ease;
            }

            .product-card:hover img {
                transform: scale(1.05);
            }

            .img-wrapper {
                overflow: hidden;
                border-radius: 12px 12px 0 0;
            }

            /* Price */
            .price-old {
                text-decoration: line-through;
                color: #9ca3af;
                font-size: 0.95rem;
                margin-right: 10px;
            }

            .price-new {
                color: #dc2626;
                font-size: 1.3rem;
                font-weight: 700;
            }

            /* Badges */
            .badge-sale {
                background-color: #dc2626;
                color: white;
                position: absolute;
                top: 15px;
                right: 15px;
                z-index: 10;
                padding: 5px 12px;
                border-radius: 20px;
                font-size: 0.8rem;
                font-weight: 600;
            }

            .badge-category {
                background-color: var(--primary-color);
                color: white;
                position: absolute;
                top: 15px;
                left: 15px;
                z-index: 10;
                padding: 5px 12px;
                border-radius: 6px;
                font-size: 0.8rem;
                font-weight: 500;
            }

            /* Advanced Sections */
            .feature-icon {
                font-size: 2.5rem;
                color: var(--primary-color);
                margin-bottom: 15px;
            }

            .feature-box {
                padding: 30px;
                text-align: center;
                border-radius: 12px;
                background: #f8fafc;
                transition: 0.3s;
            }

            .feature-box:hover {
                background: #fff;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            }

            .btn-add-cart {
                width: 100%;
                background-color: var(--accent-color);
                color: #fff;
                border: none;
                font-weight: 600;
                transition: 0.3s;
            }

            .btn-add-cart:hover {
                background-color: #d97706;
                color: #fff;
            }
        </style>

        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@500;600;700&display=swap"
            rel="stylesheet">

        <!-- Hero Start -->
        <div class="container-fluid hero-banner mb-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 text-white">
                        <h4 class="mb-3 text-warning border-bottom border-warning d-inline-block pb-2">Khám phá laptop
                            phù hợp với bạn</h4>
                        <h1 class="display-3 fw-bold mb-4 text-white">🔥 Giảm giá đến 30% Laptop Gaming</h1>
                        <p class="fs-5 mb-5 text-light">Sở hữu sức mạnh vô song với mức giá không tưởng. Cơ hội có 1-0-2
                            trong năm.</p>
                        <div class="d-flex gap-3">
                            <a href="#products" class="btn btn-custom-primary rounded-pill">Mua ngay</a>
                            <a href="#" class="btn btn-custom-outline rounded-pill">Xem thêm</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->

        <!-- Features Start -->
        <div class="container py-5">
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="feature-box">
                        <i class="fa fa-truck feature-icon"></i>
                        <h5 class="fw-bold">Free Shipping</h5>
                        <p class="text-muted mb-0">Miễn phí giao hàng toàn quốc</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-box">
                        <i class="fa fa-shield-alt feature-icon"></i>
                        <h5 class="fw-bold">Bảo hành 12 tháng</h5>
                        <p class="text-muted mb-0">An tâm sử dụng với chính sách bảo hành chính hãng</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-box">
                        <i class="fa fa-credit-card feature-icon"></i>
                        <h5 class="fw-bold">Thanh toán linh hoạt</h5>
                        <p class="text-muted mb-0">Hỗ trợ trả góp 0%, thẻ tín dụng, tiền mặt</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Features End -->

        <!-- Featured Products Start -->
        <div class="container-fluid py-5" id="products">
            <div class="container py-5">
                <div class="d-flex justify-content-between align-items-end mb-5">
                    <div>
                        <h1 class="display-5 fw-bold" style="font-family: var(--font-heading);">Sản Phẩm Nổi Bật</h1>
                        <p class="text-muted">Danh sách các sản phẩm đang được ưa chuộng nhất tại hệ thống LaptopShop.
                        </p>
                    </div>
                    <!-- Filter/Search Placeholder -->
                    <div class="d-flex gap-2">
                        <select class="form-select rounded-pill shadow-sm" style="width: auto;">
                            <option value="">Tất cả hãng</option>
                            <option value="apple">Apple</option>
                            <option value="dell">Dell</option>
                            <option value="asus">Asus</option>
                        </select>
                        <select class="form-select rounded-pill shadow-sm" style="width: auto;">
                            <option value="">Nhu cầu</option>
                            <option value="gaming">Gaming</option>
                            <option value="office">Văn phòng</option>
                        </select>
                    </div>
                </div>
                <div class="row g-4">
                    <!-- Product Item 1 -->
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="product-card h-100 d-flex flex-column position-relative">
                            <span class="badge-sale">🔥 -10%</span>
                            <span class="badge-category">Macbook</span>
                            <div class="img-wrapper p-3 bg-light">
                                <a href="/product/1">
                                    <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60"
                                        class="img-fluid w-100" style="height: 200px; object-fit: cover;" alt="">
                                </a>
                            </div>
                            <div class="p-4 d-flex flex-column flex-grow-1">
                                <a href="/product/1" class="text-decoration-none text-dark">
                                    <h4 class="mb-2 fw-bold">MacBook Pro 14" M3</h4>
                                </a>
                                <p class="text-muted small mb-3">Chip M3 Pro mạnh mẽ, màn hình Liquid Retina XDR rực rỡ.
                                </p>
                                <div class="mt-auto">
                                    <div class="d-flex align-items-center mb-3">
                                        <span class="price-old">45.000.000đ</span>
                                        <span class="price-new">39.990.000đ</span>
                                    </div>
                                    <button class="btn btn-add-cart rounded-pill py-2">
                                        <i class="fa fa-shopping-cart me-2"></i> Thêm giỏ hàng
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Product Item 2 -->
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="product-card h-100 d-flex flex-column position-relative">
                            <span class="badge-sale bg-success" style="background-color: #198754 !important;">⭐ Best
                                Seller</span>
                            <span class="badge-category">Laptop</span>
                            <div class="img-wrapper p-3 bg-light">
                                <a href="/product/2">
                                    <img src="https://images.unsplash.com/photo-1593642632823-8f785ba67e45?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60"
                                        class="img-fluid w-100" style="height: 200px; object-fit: cover;" alt="">
                                </a>
                            </div>
                            <div class="p-4 d-flex flex-column flex-grow-1">
                                <a href="/product/2" class="text-decoration-none text-dark">
                                    <h4 class="mb-2 fw-bold">Dell XPS 15</h4>
                                </a>
                                <p class="text-muted small mb-3">Tuyệt tác laptop doanh nhân, thiết kế nhôm khối sang
                                    trọng.</p>
                                <div class="mt-auto">
                                    <div class="d-flex align-items-center mb-3">
                                        <span class="price-new">45.000.000đ</span>
                                    </div>
                                    <button class="btn btn-add-cart rounded-pill py-2">
                                        <i class="fa fa-shopping-cart me-2"></i> Thêm giỏ hàng
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Product Item 3 -->
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="product-card h-100 d-flex flex-column position-relative">
                            <span class="badge-category">Laptop</span>
                            <div class="img-wrapper p-3 bg-light">
                                <a href="/product/3">
                                    <img src="https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60"
                                        class="img-fluid w-100" style="height: 200px; object-fit: cover;" alt="">
                                </a>
                            </div>
                            <div class="p-4 d-flex flex-column flex-grow-1">
                                <a href="/product/3" class="text-decoration-none text-dark">
                                    <h4 class="mb-2 fw-bold">ThinkPad X1 Carbon</h4>
                                </a>
                                <p class="text-muted small mb-3">Laptop hoàn hảo cho lập trình viên và doanh nhân.</p>
                                <div class="mt-auto">
                                    <div class="d-flex align-items-center mb-3">
                                        <span class="price-old">38.000.000đ</span>
                                        <span class="price-new">35.500.000đ</span>
                                    </div>
                                    <button class="btn btn-add-cart rounded-pill py-2">
                                        <i class="fa fa-shopping-cart me-2"></i> Thêm giỏ hàng
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Product Item 4 -->
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="product-card h-100 d-flex flex-column position-relative">
                            <span class="badge-sale bg-info text-dark" style="background-color: #0dcaf0 !important;">🆕
                                Mới</span>
                            <span class="badge-category">Laptop</span>
                            <div class="img-wrapper p-3 bg-light">
                                <a href="/product/4">
                                    <img src="https://images.unsplash.com/photo-1603302576837-37561b2e2302?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60"
                                        class="img-fluid w-100" style="height: 200px; object-fit: cover;" alt="">
                                </a>
                            </div>
                            <div class="p-4 d-flex flex-column flex-grow-1">
                                <a href="/product/4" class="text-decoration-none text-dark">
                                    <h4 class="mb-2 fw-bold">Asus ROG Strix</h4>
                                </a>
                                <p class="text-muted small mb-3">Sức mạnh tối thượng cho game thủ chuyên nghiệp. Màn
                                    240Hz.</p>
                                <div class="mt-auto">
                                    <div class="d-flex align-items-center mb-3">
                                        <span class="price-new">38.200.000đ</span>
                                    </div>
                                    <button class="btn btn-add-cart rounded-pill py-2">
                                        <i class="fa fa-shopping-cart me-2"></i> Thêm giỏ hàng
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Product Item 5 -->
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="product-card h-100 d-flex flex-column position-relative">
                            <span class="badge-category">Macbook</span>
                            <div class="img-wrapper p-3 bg-light">
                                <a href="/product/5">
                                    <img src="https://images.unsplash.com/photo-1541807084-5c52b6b3adef?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60"
                                        class="img-fluid w-100" style="height: 200px; object-fit: cover;" alt="">
                                </a>
                            </div>
                            <div class="p-4 d-flex flex-column flex-grow-1">
                                <a href="/product/5" class="text-decoration-none text-dark">
                                    <h4 class="mb-2 fw-bold">MacBook Air M2</h4>
                                </a>
                                <p class="text-muted small mb-3">Thiết kế siêu mỏng nhẹ, chip M2 hiệu năng ấn tượng.</p>
                                <div class="mt-auto">
                                    <div class="d-flex align-items-center mb-3">
                                        <span class="price-old">30.000.000đ</span>
                                        <span class="price-new">27.500.000đ</span>
                                    </div>
                                    <button class="btn btn-add-cart rounded-pill py-2">
                                        <i class="fa fa-shopping-cart me-2"></i> Thêm giỏ hàng
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Product Item 6 -->
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="product-card h-100 d-flex flex-column position-relative">
                            <span class="badge-category">Laptop</span>
                            <div class="img-wrapper p-3 bg-light">
                                <a href="/product/6">
                                    <img src="https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60"
                                        class="img-fluid w-100" style="height: 200px; object-fit: cover;" alt="">
                                </a>
                            </div>
                            <div class="p-4 d-flex flex-column flex-grow-1">
                                <a href="/product/6" class="text-decoration-none text-dark">
                                    <h4 class="mb-2 fw-bold">HP Envy 13</h4>
                                </a>
                                <p class="text-muted small mb-3">Viền màn hình siêu mỏng, bảo mật cao cấp, mượt mà.</p>
                                <div class="mt-auto">
                                    <div class="d-flex align-items-center mb-3">
                                        <span class="price-new">24.900.000đ</span>
                                    </div>
                                    <button class="btn btn-add-cart rounded-pill py-2">
                                        <i class="fa fa-shopping-cart me-2"></i> Thêm giỏ hàng
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Product Item 7 -->
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="product-card h-100 d-flex flex-column position-relative">
                            <span class="badge-sale">🔥 Sale Khủng</span>
                            <span class="badge-category">Laptop</span>
                            <div class="img-wrapper p-3 bg-light">
                                <a href="/product/7">
                                    <img src="https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60"
                                        class="img-fluid w-100" style="height: 200px; object-fit: cover;" alt="">
                                </a>
                            </div>
                            <div class="p-4 d-flex flex-column flex-grow-1">
                                <a href="/product/7" class="text-decoration-none text-dark">
                                    <h4 class="mb-2 fw-bold">Lenovo Legion 5</h4>
                                </a>
                                <p class="text-muted small mb-3">Cỗ máy chiến game thực thụ, tản nhiệt vượt trội.</p>
                                <div class="mt-auto">
                                    <div class="d-flex align-items-center mb-3">
                                        <span class="price-old">35.000.000đ</span>
                                        <span class="price-new">31.000.000đ</span>
                                    </div>
                                    <button class="btn btn-add-cart rounded-pill py-2">
                                        <i class="fa fa-shopping-cart me-2"></i> Thêm giỏ hàng
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Product Item 8 -->
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="product-card h-100 d-flex flex-column position-relative">
                            <span class="badge-sale bg-warning text-dark"
                                style="background-color: #ffc107 !important;">⭐ Hot</span>
                            <span class="badge-category">Macbook</span>
                            <div class="img-wrapper p-3 bg-light">
                                <a href="/product/8">
                                    <img src="https://images.unsplash.com/photo-1544731612-de7f96afe55f?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60"
                                        class="img-fluid w-100" style="height: 200px; object-fit: cover;" alt="">
                                </a>
                            </div>
                            <div class="p-4 d-flex flex-column flex-grow-1">
                                <a href="/product/8" class="text-decoration-none text-dark">
                                    <h4 class="mb-2 fw-bold">MacBook Pro 16" M3 Max</h4>
                                </a>
                                <p class="text-muted small mb-3">Sức mạnh chuyên nghiệp khủng khiếp cho đồ họa.</p>
                                <div class="mt-auto">
                                    <div class="d-flex align-items-center mb-3">
                                        <span class="price-new">79.990.000đ</span>
                                    </div>
                                    <button class="btn btn-add-cart rounded-pill py-2">
                                        <i class="fa fa-shopping-cart me-2"></i> Thêm giỏ hàng
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Featured Products End -->

        <jsp:include page="../layout/footer.jsp" />