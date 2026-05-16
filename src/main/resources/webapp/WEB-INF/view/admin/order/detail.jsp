<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Order Detail</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            </head>

            <body>
                <div class="d-flex">
                    <jsp:include page="../layout/sidebar.jsp" />

                    <div class="container mt-5 flex-grow-1">
                        <div class="row">
                            <div class="col-lg-11 col-12 mx-auto">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h2>Order Detail</h2>
                                    <a href="/admin/order" class="btn btn-secondary">Go Back</a>
                                </div>

                                <div class="row g-4">
                                    <div class="col-lg-5">
                                        <div class="card">
                                            <div class="card-header">Shipping Information</div>
                                            <div class="card-body">
                                                <p class="mb-1"><strong>Order ID:</strong> ${order.id}</p>
                                                <p class="mb-1"><strong>Status:</strong> ${order.status}</p>
                                                <p class="mb-1"><strong>Receiver:</strong>
                                                    <c:choose>
                                                        <c:when test="${not empty order.receiverName}">
                                                            ${order.receiverName}
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${order.user.fullname}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </p>
                                                <p class="mb-1"><strong>Phone:</strong>
                                                    <c:choose>
                                                        <c:when test="${not empty order.receiverPhone}">
                                                            ${order.receiverPhone}
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${order.user.phone}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </p>
                                                <p class="mb-1"><strong>Address:</strong>
                                                    <c:choose>
                                                        <c:when test="${not empty order.shippingAddress}">
                                                            ${order.shippingAddress}
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${order.user.address}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </p>
                                                <p class="mb-0"><strong>Customer Email:</strong> ${order.user.email}</p>
                                            </div>
                                        </div>

                                        <div class="card mt-3">
                                            <div class="card-header">Update Status</div>
                                            <div class="card-body">
                                                <form action="/admin/order/update-status" method="post">
                                                    <input type="hidden" name="orderId" value="${order.id}" />
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <label class="form-label">Status</label>
                                                    <select name="status" class="form-select">
                                                        <c:forEach var="statusOption" items="${statusOptions}">
                                                            <option value="${statusOption}" <c:if
                                                                test="${statusOption == order.status}">selected</c:if>>
                                                                ${statusOption}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                    <button type="submit" class="btn btn-primary mt-3">Update</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-7">
                                        <div class="card">
                                            <div class="card-header">Order Items</div>
                                            <div class="card-body">
                                                <div class="table-responsive">
                                                    <table class="table table-bordered">
                                                        <thead>
                                                            <tr>
                                                                <th>Product</th>
                                                                <th class="text-center">Qty</th>
                                                                <th class="text-end">Price</th>
                                                                <th class="text-end">Total</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="item" items="${orderDetails}">
                                                                <tr>
                                                                    <td>${item.product.name}</td>
                                                                    <td class="text-center">${item.quantity}</td>
                                                                    <td class="text-end">
                                                                        <fmt:formatNumber value="${item.price}"
                                                                            type="number" groupingUsed="true" /> d
                                                                    </td>
                                                                    <td class="text-end">
                                                                        <fmt:formatNumber
                                                                            value="${item.price * item.quantity}"
                                                                            type="number" groupingUsed="true" /> d
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                            <c:if test="${empty orderDetails}">
                                                                <tr>
                                                                    <td colspan="4" class="text-center">No items found.
                                                                    </td>
                                                                </tr>
                                                            </c:if>
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <div class="d-flex justify-content-end">
                                                    <div class="text-end">
                                                        <div class="fw-semibold">Total</div>
                                                        <div class="fs-5 text-primary fw-bold">
                                                            <fmt:formatNumber value="${order.totalPrice}" type="number"
                                                                groupingUsed="true" /> d
                                                        </div>
                                                    </div>
                                                </div>
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