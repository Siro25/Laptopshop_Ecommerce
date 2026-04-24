<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <jsp:include page="../layout/header.jsp" />

        <!-- Hero Start -->
        <div class="container-fluid py-5 mb-5" style="margin-top: 100px; background-color: #f4f6f8;">
            <div class="container py-5">
                <div class="row g-5 align-items-center">
                    <div class="col-md-12 col-lg-7">
                        <h4 class="mb-3 text-secondary">Siêu phẩm công nghệ</h4>
                        <h1 class="mb-5 display-3 text-primary">Macbook & Laptop chính hãng</h1>
                        <div class="position-relative mx-auto">
                            <input class="form-control border-2 border-secondary w-75 py-3 px-4 rounded-pill"
                                type="number" placeholder="Điền email để nhận ưu đãi...">
                            <button type="submit"
                                class="btn btn-primary border-2 border-secondary py-3 px-4 position-absolute rounded-pill text-white h-100"
                                style="top: 0; right: 25%;">Đăng ký</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-5">
                        <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                            <div class="carousel-indicators">
                                <button type="button" data-bs-target="#carouselId" data-bs-slide-to="0" class="active"
                                    aria-current="true" aria-label="Slide 1"></button>
                                <button type="button" data-bs-target="#carouselId" data-bs-slide-to="1"
                                    aria-label="Slide 2"></button>
                                <button type="button" data-bs-target="#carouselId" data-bs-slide-to="2"
                                    aria-label="Slide 3"></button>
                                <button type="button" data-bs-target="#carouselId" data-bs-slide-to="3"
                                    aria-label="Slide 4"></button>
                            </div>
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active rounded">
                                    <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80"
                                        class="img-fluid w-100 bg-secondary rounded"
                                        style="height: 350px; object-fit: cover;" alt="Macbook">
                                    <a href="#" class="btn px-4 py-2 text-white rounded position-absolute"
                                        style="bottom: 20px; left: 50%; transform: translateX(-50%); background: rgba(0,0,0,0.5);">Macbook</a>
                                </div>
                                <div class="carousel-item rounded">
                                    <img src="https://images.unsplash.com/photo-1593640408182-31c70c8268f5?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80"
                                        class="img-fluid w-100 rounded" style="height: 350px; object-fit: cover;"
                                        alt="Laptop Gaming">
                                    <a href="#" class="btn px-4 py-2 text-white rounded position-absolute"
                                        style="bottom: 20px; left: 50%; transform: translateX(-50%); background: rgba(0,0,0,0.5);">Laptop
                                        Gaming</a>
                                </div>
                                <div class="carousel-item rounded">
                                    <img src="https://images.unsplash.com/photo-1496181133206-80ce9b88a853?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80"
                                        class="img-fluid w-100 rounded" style="height: 350px; object-fit: cover;"
                                        alt="Ultrabook">
                                    <a href="#" class="btn px-4 py-2 text-white rounded position-absolute"
                                        style="bottom: 20px; left: 50%; transform: translateX(-50%); background: rgba(0,0,0,0.5);">Ultrabook</a>
                                </div>
                                <div class="carousel-item rounded">
                                    <img src="https://images.unsplash.com/photo-1603302576837-37561b2e2302?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80"
                                        class="img-fluid w-100 rounded" style="height: 350px; object-fit: cover;"
                                        alt="Laptop Đồ Họa">
                                    <a href="#" class="btn px-4 py-2 text-white rounded position-absolute"
                                        style="bottom: 20px; left: 50%; transform: translateX(-50%); background: rgba(0,0,0,0.5);">Laptop
                                        Đồ Họa</a>
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselId"
                                data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselId"
                                data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->

        <!-- Featured Products Start -->
        <div class="container-fluid py-5">
            <div class="container py-5">
                <div class="text-center mx-auto mb-5" style="max-width: 700px;">
                    <h1 class="display-4">Sản Phẩm Nổi Bật</h1>
                    <p>Danh sách các sản phẩm đang được ưa chuộng nhất tại hệ thống LaptopShop. Mua ngay hôm nay để nhận
                        ưu đãi.</p>
                </div>
                <div class="row g-4">
                    <!-- Product Item 1 -->
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="rounded position-relative border border-secondary h-100 d-flex flex-column">
                            <div class="p-4">
                                <a href="/product/1">
                                    <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60"
                                        class="img-fluid w-100 rounded-top" style="height: 200px; object-fit: cover;"
                                        alt="">
                                </a>
                            </div>
                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                style="top: 10px; left: 10px;">Macbook</div>
                            <div class="p-4 rounded-bottom d-flex flex-column flex-grow-1">
                                <a href="/product/1" class="text-decoration-none text-dark">
                                    <h4>MacBook Pro 14" M3</h4>
                                </a>
                                <p>Chip M3 Pro mạnh mẽ, màn hình Liquid Retina XDR rực rỡ, dung lượng pin bền bỉ.</p>
                                <div class="d-flex justify-content-between flex-lg-wrap mt-auto">
                                    <p class="text-dark fs-5 fw-bold mb-0">39.990.000 đ</p>
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                            class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Product Item 2 -->
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="rounded position-relative border border-secondary h-100 d-flex flex-column">
                            <div class="p-4">
                                <a href="/product/2">
                                    <img src="https://images.unsplash.com/photo-1593642632823-8f785ba67e45?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60"
                                        class="img-fluid w-100 rounded-top" style="height: 200px; object-fit: cover;"
                                        alt="">
                                </a>
                            </div>
                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                style="top: 10px; left: 10px;">Laptop</div>
                            <div class="p-4 rounded-bottom d-flex flex-column flex-grow-1">
                                <a href="/product/2" class="text-decoration-none text-dark">
                                    <h4>Dell XPS 15</h4>
                                </a>
                                <p>Tuyệt tác laptop doanh nhân, thiết kế vỏ nhôm khối sang trọng, cấu hình đỉnh cao.</p>
                                <div class="d-flex justify-content-between flex-lg-wrap mt-auto">
                                    <p class="text-dark fs-5 fw-bold mb-0">45.000.000 đ</p>
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                            class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Product Item 3 -->
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="rounded position-relative border border-secondary h-100 d-flex flex-column">
                            <div class="p-4">
                                <a href="/product/3">
                                    <img src="https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60"
                                        class="img-fluid w-100 rounded-top" style="height: 200px; object-fit: cover;"
                                        alt="">
                                </a>
                            </div>
                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                style="top: 10px; left: 10px;">Laptop</div>
                            <div class="p-4 rounded-bottom d-flex flex-column flex-grow-1">
                                <a href="/product/3" class="text-decoration-none text-dark">
                                    <h4>ThinkPad X1 Carbon</h4>
                                </a>
                                <p>Laptop hoàn hảo cho lập trình viên và doanh nhân. Bàn phím tốt nhất thế giới.</p>
                                <div class="d-flex justify-content-between flex-lg-wrap mt-auto">
                                    <p class="text-dark fs-5 fw-bold mb-0">35.500.000 đ</p>
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                            class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Product Item 4 -->
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="rounded position-relative border border-secondary h-100 d-flex flex-column">
                            <div class="p-4">
                                <a href="/product/4">
                                    <img src="https://images.unsplash.com/photo-1603302576837-37561b2e2302?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60"
                                        class="img-fluid w-100 rounded-top" style="height: 200px; object-fit: cover;"
                                        alt="">
                                </a>
                            </div>
                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                style="top: 10px; left: 10px;">Laptop</div>
                            <div class="p-4 rounded-bottom d-flex flex-column flex-grow-1">
                                <a href="/product/4" class="text-decoration-none text-dark">
                                    <h4>Asus ROG Strix</h4>
                                </a>
                                <p>Sức mạnh tối thượng cho game thủ chuyên nghiệp. Tần số quét màn hình 240Hz.</p>
                                <div class="d-flex justify-content-between flex-lg-wrap mt-auto">
                                    <p class="text-dark fs-5 fw-bold mb-0">38.200.000 đ</p>
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                            class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Product Item 5 -->
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="rounded position-relative border border-secondary h-100 d-flex flex-column">
                            <div class="p-4">
                                <a href="/product/5">
                                    <img src="https://images.unsplash.com/photo-1541807084-5c52b6b3adef?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60"
                                        class="img-fluid w-100 rounded-top" style="height: 200px; object-fit: cover;"
                                        alt="">
                                </a>
                            </div>
                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                style="top: 10px; left: 10px;">Macbook</div>
                            <div class="p-4 rounded-bottom d-flex flex-column flex-grow-1">
                                <a href="/product/5" class="text-decoration-none text-dark">
                                    <h4>MacBook Air M2</h4>
                                </a>
                                <p>Thiết kế siêu mỏng nhẹ, chip M2 hiệu năng ấn tượng, thời lượng pin cả ngày.</p>
                                <div class="d-flex justify-content-between flex-lg-wrap mt-auto">
                                    <p class="text-dark fs-5 fw-bold mb-0">27.500.000 đ</p>
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                            class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Product Item 6 -->
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="rounded position-relative border border-secondary h-100 d-flex flex-column">
                            <div class="p-4">
                                <a href="/product/6">
                                    <img src="https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60"
                                        class="img-fluid w-100 rounded-top" style="height: 200px; object-fit: cover;"
                                        alt="">
                                </a>
                            </div>
                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                style="top: 10px; left: 10px;">Laptop</div>
                            <div class="p-4 rounded-bottom d-flex flex-column flex-grow-1">
                                <a href="/product/6" class="text-decoration-none text-dark">
                                    <h4>HP Envy 13</h4>
                                </a>
                                <p>Viền màn hình siêu mỏng, bảo mật cao cấp, hiệu suất mượt mà cho công việc.</p>
                                <div class="d-flex justify-content-between flex-lg-wrap mt-auto">
                                    <p class="text-dark fs-5 fw-bold mb-0">24.900.000 đ</p>
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                            class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Product Item 7 -->
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="rounded position-relative border border-secondary h-100 d-flex flex-column">
                            <div class="p-4">
                                <a href="/product/7">
                                    <img src="https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60"
                                        class="img-fluid w-100 rounded-top" style="height: 200px; object-fit: cover;"
                                        alt="">
                                </a>
                            </div>
                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                style="top: 10px; left: 10px;">Laptop</div>
                            <div class="p-4 rounded-bottom d-flex flex-column flex-grow-1">
                                <a href="/product/7" class="text-decoration-none text-dark">
                                    <h4>Lenovo Legion 5</h4>
                                </a>
                                <p>Cỗ máy chiến game thực thụ với hệ thống tản nhiệt vượt trội, card rời RTX 4060.</p>
                                <div class="d-flex justify-content-between flex-lg-wrap mt-auto">
                                    <p class="text-dark fs-5 fw-bold mb-0">31.000.000 đ</p>
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                            class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Product Item 8 -->
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="rounded position-relative border border-secondary h-100 d-flex flex-column">
                            <div class="p-4">
                                <a href="/product/8">
                                    <img src="https://images.unsplash.com/photo-1544731612-de7f96afe55f?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60"
                                        class="img-fluid w-100 rounded-top" style="height: 200px; object-fit: cover;"
                                        alt="">
                                </a>
                            </div>
                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                style="top: 10px; left: 10px;">Macbook</div>
                            <div class="p-4 rounded-bottom d-flex flex-column flex-grow-1">
                                <a href="/product/8" class="text-decoration-none text-dark">
                                    <h4>MacBook Pro 16" M3 Max</h4>
                                </a>
                                <p>Sức mạnh chuyên nghiệp khủng khiếp cho những tác vụ đồ họa chuyên sâu nhất.</p>
                                <div class="d-flex justify-content-between flex-lg-wrap mt-auto">
                                    <p class="text-dark fs-5 fw-bold mb-0">79.990.000 đ</p>
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                            class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Featured Products End -->

        <jsp:include page="../layout/footer.jsp" />