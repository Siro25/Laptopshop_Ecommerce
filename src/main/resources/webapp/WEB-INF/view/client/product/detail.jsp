<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <jsp:include page="../layout/header.jsp" />

        <!-- Single Product Start -->
        <div class="container-fluid mt-5 py-5">
            <div class="container py-5">
                <div class="row g-5 mb-5">
                    <div class="col-lg-12">
                        <div class="row g-4">
                            <div class="col-lg-6">
                                <div class="border rounded">
                                    <a href="#">
                                        <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80"
                                            class="img-fluid rounded" alt="Image">
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <h4 class="fw-bold mb-3">MacBook Pro 14" M3 (ID: ${productId})</h4>
                                <p class="mb-3">Danh mục: Laptop</p>
                                <h5 class="fw-bold mb-3">39.990.000 đ</h5>
                                <p class="mb-4">Chip M3 Pro mạnh mẽ, màn hình Liquid Retina XDR rực rỡ, dung lượng pin
                                    bền bỉ. Với thiết kế mỏng nhẹ sang trọng, trải nghiệm làm việc và giải trí trên mức
                                    tuyệt vời.</p>
                                <div class="input-group quantity mb-5" style="width: 100px;">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-minus rounded-circle bg-light border">
                                            <i class="fa fa-minus"></i>
                                        </button>
                                    </div>
                                    <input type="text" class="form-control form-control-sm text-center border-0"
                                        value="1">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                                <a href="#"
                                    class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary"><i
                                        class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ hàng</a>
                            </div>
                            <div class="col-lg-12">
                                <nav>
                                    <div class="nav nav-tabs mb-3">
                                        <button class="nav-link active border-white border-bottom-0" type="button"
                                            role="tab" id="nav-about-tab" data-bs-toggle="tab"
                                            data-bs-target="#nav-about" aria-controls="nav-about"
                                            aria-selected="true">Thông tin chi tiết</button>
                                        <button class="nav-link border-white border-bottom-0" type="button" role="tab"
                                            id="nav-mission-tab" data-bs-toggle="tab" data-bs-target="#nav-mission"
                                            aria-controls="nav-mission" aria-selected="false">Thông số kỹ thuật</button>
                                    </div>
                                </nav>
                                <div class="tab-content mb-5">
                                    <div class="tab-pane active" id="nav-about" role="tabpanel"
                                        aria-labelledby="nav-about-tab">
                                        <p>MacBook Pro 14 inch mang đến hiệu năng đẳng cấp nhờ chip M3. Màn hình Liquid
                                            Retina XDR siêu sáng với dải tương phản động rộng đáp ứng cả những công việc
                                            đồ họa khắt khe nhất.</p>
                                        <p>Bàn phím Magic Keyboard gõ êm, Touch ID an toàn tuyệt đối. Các cổng kết nối
                                            đa dạng từ Thunderbolt 4, HDMI, đến MagSafe 3 giúp bạn sẵn sàng cho mọi
                                            thiết bị ngoại vi.</p>
                                    </div>
                                    <div class="tab-pane" id="nav-mission" role="tabpanel"
                                        aria-labelledby="nav-mission-tab">
                                        <table class="table">
                                            <tbody>
                                                <tr>
                                                    <td>CPU</td>
                                                    <td>Apple M3 Pro</td>
                                                </tr>
                                                <tr>
                                                    <td>RAM</td>
                                                    <td>18GB Unified Memory</td>
                                                </tr>
                                                <tr>
                                                    <td>Ổ cứng</td>
                                                    <td>512GB SSD</td>
                                                </tr>
                                                <tr>
                                                    <td>Màn hình</td>
                                                    <td>14.2 inch Liquid Retina XDR (3024x1964) 120Hz</td>
                                                </tr>
                                                <tr>
                                                    <td>Card màn hình</td>
                                                    <td>14-core GPU</td>
                                                </tr>
                                                <tr>
                                                    <td>HĐH</td>
                                                    <td>macOS</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Related Products -->
                <h1 class="fw-bold mb-0">Sản phẩm liên quan</h1>
                <div class="row g-4 mt-1">
                    <div class="col-md-6 col-lg-3">
                        <div class="rounded position-relative border border-secondary h-100 d-flex flex-column">
                            <div class="p-4">
                                <a href="/product/2">
                                    <img src="https://images.unsplash.com/photo-1593642632823-8f785ba67e45?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60"
                                        class="img-fluid w-100 rounded-top" style="height: 200px; object-fit: cover;"
                                        alt=""></a>
                            </div>
                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                style="top: 10px; left: 10px;">Laptop</div>
                            <div class="p-4 rounded-bottom d-flex flex-column flex-grow-1">
                                <a href="/product/2" class="text-decoration-none text-dark">
                                    <h4>Dell XPS 15</h4>
                                </a>
                                <div class="d-flex justify-content-between flex-lg-wrap mt-auto">
                                    <p class="text-dark fs-5 fw-bold mb-0">45.000.000 đ</p>
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                            class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="rounded position-relative border border-secondary h-100 d-flex flex-column">
                            <div class="p-4">
                                <a href="/product/3">
                                    <img src="https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60"
                                        class="img-fluid w-100 rounded-top" style="height: 200px; object-fit: cover;"
                                        alt=""></a>
                            </div>
                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                style="top: 10px; left: 10px;">Laptop</div>
                            <div class="p-4 rounded-bottom d-flex flex-column flex-grow-1">
                                <a href="/product/3" class="text-decoration-none text-dark">
                                    <h4>ThinkPad X1 Carbon</h4>
                                </a>
                                <div class="d-flex justify-content-between flex-lg-wrap mt-auto">
                                    <p class="text-dark fs-5 fw-bold mb-0">35.500.000 đ</p>
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                            class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="rounded position-relative border border-secondary h-100 d-flex flex-column">
                            <div class="p-4">
                                <a href="/product/4">
                                    <img src="https://images.unsplash.com/photo-1603302576837-37561b2e2302?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60"
                                        class="img-fluid w-100 rounded-top" style="height: 200px; object-fit: cover;"
                                        alt=""></a>
                            </div>
                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                style="top: 10px; left: 10px;">Laptop</div>
                            <div class="p-4 rounded-bottom d-flex flex-column flex-grow-1">
                                <a href="/product/4" class="text-decoration-none text-dark">
                                    <h4>Asus ROG Strix</h4>
                                </a>
                                <div class="d-flex justify-content-between flex-lg-wrap mt-auto">
                                    <p class="text-dark fs-5 fw-bold mb-0">38.200.000 đ</p>
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                            class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
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
                                <div class="d-flex justify-content-between flex-lg-wrap mt-auto">
                                    <p class="text-dark fs-5 fw-bold mb-0">27.500.000 đ</p>
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                            class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Single Product End -->

        <jsp:include page="../layout/footer.jsp" />