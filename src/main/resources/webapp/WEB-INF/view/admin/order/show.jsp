<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Manage Orders</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            </head>

            <body>
                <div class="d-flex">
                    <!-- Include Sidebar -->
                    <jsp:include page="../layout/sidebar.jsp" />

                    <!-- Main Content -->
                    <div class="container mt-5 flex-grow-1">
                        <div class="row">
                            <div class="col-12 mx-auto d-flex justify-content-between align-items-center">
                                <h3>Table Orders</h3>
                            </div>
                            <hr />
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Customer</th>
                                        <th>Phone</th>
                                        <th>Address</th>
                                        <th>Total Price</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="order" items="${orders}">
                                        <tr>
                                            <td>${order.id}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty order.receiverName}">
                                                        ${order.receiverName}
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${order.user.fullname}
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty order.receiverPhone}">
                                                        ${order.receiverPhone}
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${order.user.phone}
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty order.shippingAddress}">
                                                        ${order.shippingAddress}
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${order.user.address}
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <fmt:formatNumber value="${order.totalPrice}" type="number"
                                                    groupingUsed="true" /> d
                                            </td>
                                            <td>${order.status}</td>
                                            <td>
                                                <a href="/admin/order/${order.id}" class="btn btn-success">View</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty orders}">
                                        <tr>
                                            <td colspan="7" class="text-center">No orders found.</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </body>

            </html>