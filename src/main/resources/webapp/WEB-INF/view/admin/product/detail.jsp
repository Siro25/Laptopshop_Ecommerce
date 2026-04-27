<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Product Detail</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            </head>

            <body>
                <div class="d-flex">
                    <jsp:include page="../layout/sidebar.jsp" />

                    <div class="container mt-5 flex-grow-1">
                        <div class="row">
                            <div class="col-lg-10 col-12 mx-auto">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h2>Product Detail</h2>
                                    <a href="/admin/product" class="btn btn-secondary">Go Back</a>
                                </div>

                                <div class="row g-4">
                                    <div class="col-lg-4">
                                        <div class="card h-100">
                                            <div class="card-header">Product Image</div>
                                            <div class="card-body d-flex align-items-center justify-content-center">
                                                <c:choose>
                                                    <c:when test="${not empty product.image}">
                                                        <img src="/resources/images/product/${product.image}"
                                                            alt="product image" class="img-fluid rounded border"
                                                            style="max-height: 280px;" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="text-muted">No image</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-8">
                                        <div class="card">
                                            <div class="card-header">Product Information</div>
                                            <div class="card-body">
                                                <p class="mb-1"><strong>ID:</strong> ${product.id}</p>
                                                <p class="mb-1"><strong>Name:</strong> ${product.name}</p>
                                                <p class="mb-1"><strong>Price:</strong>
                                                    <fmt:formatNumber value="${product.price}" type="number" />
                                                </p>
                                                <p class="mb-1"><strong>Quantity:</strong> ${product.quantity}</p>
                                                <p class="mb-1"><strong>Sold:</strong> ${product.sold}</p>
                                                <p class="mb-1"><strong>Factory:</strong> ${product.factory}</p>
                                                <p class="mb-3"><strong>Target:</strong> ${product.target}</p>

                                                <p class="mb-1"><strong>Short Description:</strong></p>
                                                <p>${product.shortDesc}</p>
                                                <p class="mb-1"><strong>Detail Description:</strong></p>
                                                <p class="mb-0">${product.detailDesc}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </body>

            </html>