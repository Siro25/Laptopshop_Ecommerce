<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <jsp:include page="../layout/header.jsp" />

            <!-- Single Product Start -->
            <div class="container-fluid mt-5 py-5 bg-light">
                <div class="container py-4">
                    <nav aria-label="breadcrumb" class="mb-4">
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item">
                                <a href="<c:url value='/'/>">Home</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="<c:url value='/product'/>">Laptop</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">${product.name}</li>
                        </ol>
                    </nav>

                    <div class="row g-5 align-items-start mb-5">
                        <div class="col-lg-6">
                            <div class="bg-white rounded-4 shadow-sm p-4">
                                <div class="border rounded-4 p-3">
                                    <img src="<c:url value='/resources/images/product/${product.image}'/>"
                                        class="img-fluid w-100 rounded-3" style="height: 420px; object-fit: contain;"
                                        alt="${product.name}">
                                </div>
                                <div class="row g-2 mt-3">
                                    <div class="col-3">
                                        <button class="btn p-1 border rounded-3 w-100 bg-white" type="button">
                                            <img src="<c:url value='/resources/images/product/${product.image}'/>"
                                                class="img-fluid" style="height: 64px; object-fit: cover;"
                                                alt="${product.name}">
                                        </button>
                                    </div>
                                    <div class="col-3">
                                        <button class="btn p-1 border rounded-3 w-100 bg-white" type="button">
                                            <img src="<c:url value='/resources/images/product/${product.image}'/>"
                                                class="img-fluid" style="height: 64px; object-fit: cover;"
                                                alt="${product.name}">
                                        </button>
                                    </div>
                                    <div class="col-3">
                                        <button class="btn p-1 border rounded-3 w-100 bg-white" type="button">
                                            <img src="<c:url value='/resources/images/product/${product.image}'/>"
                                                class="img-fluid" style="height: 64px; object-fit: cover;"
                                                alt="${product.name}">
                                        </button>
                                    </div>
                                    <div class="col-3">
                                        <button class="btn p-1 border rounded-3 w-100 bg-white" type="button">
                                            <img src="<c:url value='/resources/images/product/${product.image}'/>"
                                                class="img-fluid" style="height: 64px; object-fit: cover;"
                                                alt="${product.name}">
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="bg-white rounded-4 shadow-sm p-4 p-lg-5">
                                <div class="d-flex align-items-center gap-3 mb-2">
                                    <span class="badge bg-light text-dark border">${product.factory}</span>
                                    <span class="badge bg-light text-dark border">${product.target}</span>
                                </div>
                                <h2 class="fw-bold mb-2">${product.name}</h2>
                                <div class="d-flex align-items-center gap-2 text-warning mb-3">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-half-o"></i>
                                    <span class="text-muted ms-2">(128 Reviews)</span>
                                </div>
                                <div class="d-flex align-items-end gap-3 mb-3">
                                    <div class="fs-2 fw-bold text-primary">
                                        <fmt:formatNumber value="${product.price}" type="number" groupingUsed="true" />
                                        đ
                                    </div>
                                    <div class="text-muted">Gia da bao gom VAT</div>
                                </div>
                                <p class="text-muted">${product.shortDesc}</p>

                                <div class="border rounded-3 p-3 bg-light mb-4">
                                    <div class="d-flex align-items-center gap-2">
                                        <i class="fa fa-exclamation-triangle text-warning"></i>
                                        <span class="fw-semibold">Low Stock Alert</span>
                                    </div>
                                    <div class="text-muted">Chi con ${product.quantity} san pham trong kho.</div>
                                </div>

                                <form action="<c:url value='/cart/add'/>" method="post"
                                    class="d-flex flex-wrap align-items-center gap-3 mb-4">
                                    <input type="hidden" name="productId" value="${product.id}" />
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <div>
                                        <div class="text-muted small mb-2">So luong</div>
                                        <div class="input-group quantity" style="width: 120px;">
                                            <div class="input-group-btn">
                                                <button type="button"
                                                    class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                    <i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <input type="number" name="quantity"
                                                class="form-control form-control-sm text-center border-0" value="1"
                                                min="1" max="${product.quantity}">
                                            <div class="input-group-btn">
                                                <button type="button"
                                                    class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex flex-wrap gap-2">
                                        <button type="submit" class="btn btn-primary rounded-pill px-4">
                                            <i class="fa fa-shopping-cart me-2"></i> Add to Cart
                                        </button>
                                        <a href="#" class="btn btn-dark rounded-pill px-4">Buy Now</a>
                                    </div>
                                </form>

                                <div class="row g-3">
                                    <div class="col-sm-4">
                                        <div class="d-flex align-items-center gap-2">
                                            <i class="fa fa-truck text-primary"></i>
                                            <div>
                                                <div class="fw-semibold">Free Shipping</div>
                                                <div class="text-muted small">Noi thanh</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="d-flex align-items-center gap-2">
                                            <i class="fa fa-shield text-primary"></i>
                                            <div>
                                                <div class="fw-semibold">2-Year Warranty</div>
                                                <div class="text-muted small">Bao hanh chinh hang</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="d-flex align-items-center gap-2">
                                            <i class="fa fa-headset text-primary"></i>
                                            <div>
                                                <div class="fw-semibold">Tech Support</div>
                                                <div class="text-muted small">Ho tro 24/7</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row g-4 mb-5">
                        <div class="col-lg-8">
                            <div class="bg-white rounded-4 shadow-sm p-4 p-lg-5 h-100">
                                <nav>
                                    <div class="nav nav-tabs mb-4">
                                        <button class="nav-link active border-white border-bottom-0" type="button"
                                            role="tab" id="nav-about-tab" data-bs-toggle="tab"
                                            data-bs-target="#nav-about" aria-controls="nav-about"
                                            aria-selected="true">Thong tin chi tiet</button>
                                        <button class="nav-link border-white border-bottom-0" type="button" role="tab"
                                            id="nav-mission-tab" data-bs-toggle="tab" data-bs-target="#nav-mission"
                                            aria-controls="nav-mission" aria-selected="false">Thong so ky thuat</button>
                                    </div>
                                </nav>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="nav-about" role="tabpanel"
                                        aria-labelledby="nav-about-tab">
                                        <p class="mb-4">${product.detailDesc}</p>
                                    </div>
                                    <div class="tab-pane" id="nav-mission" role="tabpanel"
                                        aria-labelledby="nav-mission-tab">
                                        <table class="table table-borderless align-middle mb-0">
                                            <tbody>
                                                <tr class="border-bottom">
                                                    <td class="text-muted" style="width: 30%;">Hang</td>
                                                    <td>${product.factory}</td>
                                                </tr>
                                                <tr class="border-bottom">
                                                    <td class="text-muted">Nhu cau</td>
                                                    <td>${product.target}</td>
                                                </tr>
                                                <tr class="border-bottom">
                                                    <td class="text-muted">So luong ton</td>
                                                    <td>${product.quantity}</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-muted">Da ban</td>
                                                    <td>${product.sold}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="bg-white rounded-4 shadow-sm p-4 p-lg-5 h-100">
                                <div class="fw-bold mb-3">Why buy from us?</div>
                                <div class="d-flex gap-2 mb-3">
                                    <i class="fa fa-check-circle text-primary mt-1"></i>
                                    <div>
                                        <div class="fw-semibold">Professional service</div>
                                        <div class="text-muted small">Tu van dung nhu cau thuc te</div>
                                    </div>
                                </div>
                                <div class="d-flex gap-2 mb-3">
                                    <i class="fa fa-check-circle text-primary mt-1"></i>
                                    <div>
                                        <div class="fw-semibold">Safe delivery</div>
                                        <div class="text-muted small">Dong goi can than, bao ve may</div>
                                    </div>
                                </div>
                                <div class="d-flex gap-2">
                                    <i class="fa fa-check-circle text-primary mt-1"></i>
                                    <div>
                                        <div class="fw-semibold">Genuine products</div>
                                        <div class="text-muted small">Nguon hang ro rang, ho tro bao hanh</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Related Products -->
                    <div class="d-flex flex-wrap align-items-end justify-content-between mb-3">
                        <div>
                            <h2 class="fw-bold mb-1">Related Products</h2>
                            <div class="text-muted">Other high-performance laptops you might like</div>
                        </div>
                    </div>
                    <div class="row g-4">
                        <c:forEach var="item" items="${relatedProducts}">
                            <div class="col-md-6 col-lg-3">
                                <div class="bg-white rounded-4 shadow-sm h-100 d-flex flex-column">
                                    <div class="p-3">
                                        <a href="<c:url value='/product/${item.id}'/>">
                                            <img src="<c:url value='/resources/images/product/${item.image}'/>"
                                                class="img-fluid w-100 rounded-3"
                                                style="height: 200px; object-fit: cover;" alt="${item.name}"></a>
                                    </div>
                                    <div class="px-3 pb-3 d-flex flex-column flex-grow-1">
                                        <div class="text-muted small mb-1">${item.factory}</div>
                                        <a href="<c:url value='/product/${item.id}'/>"
                                            class="text-decoration-none text-dark">
                                            <h6 class="mb-3">${item.name}</h6>
                                        </a>
                                        <div class="mt-auto">
                                            <div class="fw-bold text-primary mb-2">
                                                <fmt:formatNumber value="${item.price}" type="number"
                                                    groupingUsed="true" /> đ
                                            </div>
                                            <a href="#" class="btn btn-outline-primary rounded-pill w-100">
                                                <i class="fa fa-shopping-cart me-2"></i> Add to Cart
                                            </a>
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