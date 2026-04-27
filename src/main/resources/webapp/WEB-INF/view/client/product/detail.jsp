<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                                            <img src="<c:url value='/resources/images/product/${product.image}'/>"
                                                class="img-fluid rounded" alt="${product.name}">
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <h4 class="fw-bold mb-3">${product.name}</h4>
                                    <p class="mb-3">Hang: ${product.factory}</p>
                                    <p class="mb-3">Nhu cau: ${product.target}</p>
                                    <h5 class="fw-bold mb-3">
                                        <fmt:formatNumber value="${product.price}" type="number" groupingUsed="true" />
                                        đ
                                    </h5>
                                    <p class="mb-4">${product.shortDesc}</p>
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
                                            <button class="nav-link border-white border-bottom-0" type="button"
                                                role="tab" id="nav-mission-tab" data-bs-toggle="tab"
                                                data-bs-target="#nav-mission" aria-controls="nav-mission"
                                                aria-selected="false">Thông số kỹ thuật</button>
                                        </div>
                                    </nav>
                                    <div class="tab-content mb-5">
                                        <div class="tab-pane active" id="nav-about" role="tabpanel"
                                            aria-labelledby="nav-about-tab">
                                            <p>${product.detailDesc}</p>
                                        </div>
                                        <div class="tab-pane" id="nav-mission" role="tabpanel"
                                            aria-labelledby="nav-mission-tab">
                                            <table class="table">
                                                <tbody>
                                                    <tr>
                                                        <td>Hang</td>
                                                        <td>${product.factory}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Nhu cau</td>
                                                        <td>${product.target}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>So luong ton</td>
                                                        <td>${product.quantity}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>Da ban</td>
                                                        <td>${product.sold}</td>
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
                        <c:forEach var="item" items="${relatedProducts}">
                            <div class="col-md-6 col-lg-3">
                                <div class="rounded position-relative border border-secondary h-100 d-flex flex-column">
                                    <div class="p-4">
                                        <a href="<c:url value='/product/${item.id}'/>">
                                            <img src="<c:url value='/resources/images/product/${item.image}'/>"
                                                class="img-fluid w-100 rounded-top"
                                                style="height: 200px; object-fit: cover;" alt="${item.name}"></a>
                                    </div>
                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                        style="top: 10px; left: 10px;">${item.factory}</div>
                                    <div class="p-4 rounded-bottom d-flex flex-column flex-grow-1">
                                        <a href="<c:url value='/product/${item.id}'/>"
                                            class="text-decoration-none text-dark">
                                            <h4>${item.name}</h4>
                                        </a>
                                        <div class="d-flex justify-content-between flex-lg-wrap mt-auto">
                                            <p class="text-dark fs-5 fw-bold mb-0">
                                                <fmt:formatNumber value="${item.price}" type="number"
                                                    groupingUsed="true" />
                                                đ
                                            </p>
                                            <a href="#"
                                                class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                    class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!-- Single Product End -->

            <jsp:include page="../layout/footer.jsp" />