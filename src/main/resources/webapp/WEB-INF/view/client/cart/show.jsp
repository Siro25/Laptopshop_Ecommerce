<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <jsp:include page="../layout/header.jsp" />

            <div class="container-fluid mt-5 py-5 bg-light">
                <div class="container py-4">
                    <div class="d-flex align-items-center justify-content-between flex-wrap gap-2 mb-4">
                        <h2 class="fw-bold mb-0">Giỏ hàng</h2>
                        <a href="/" class="btn btn-outline-primary rounded-pill">Tiếp tục mua sắm</a>
                    </div>

                    <c:if test="${not empty cartMessage}">
                        <div class="alert alert-success">${cartMessage}</div>
                    </c:if>
                    <c:if test="${not empty cartError}">
                        <div class="alert alert-danger">${cartError}</div>
                    </c:if>

                    <c:choose>
                        <c:when test="${empty cartItems}">
                            <div class="bg-white rounded-4 shadow-sm p-4 text-center">
                                Giỏ hàng của bạn đang trống.
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="bg-white rounded-4 shadow-sm p-3 p-lg-4">
                                <div class="table-responsive">
                                    <table class="table align-middle mb-0">
                                        <thead>
                                            <tr class="text-muted small">
                                                <th>Sản phẩm</th>
                                                <th></th>
                                                <th class="text-end">Đơn giá</th>
                                                <th class="text-center">Số lượng</th>
                                                <th class="text-end">Thành tiền</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="item" items="${cartItems}">
                                                <tr>
                                                    <td style="width: 90px;">
                                                        <img src="<c:url value='/resources/images/product/${item.product.image}'/>"
                                                            class="img-fluid rounded-3" style="width: 72px;"
                                                            alt="${item.product.name}">
                                                    </td>
                                                    <td>
                                                        <div class="fw-semibold">${item.product.name}</div>
                                                        <div class="text-muted small">${item.product.factory}</div>
                                                    </td>
                                                    <td class="text-end">
                                                        <fmt:formatNumber value="${item.price}" type="number"
                                                            groupingUsed="true" /> đ
                                                    </td>
                                                    <td class="text-center">${item.quantity}</td>
                                                    <td class="text-end fw-semibold text-primary">
                                                        <fmt:formatNumber value="${item.price * item.quantity}"
                                                            type="number" groupingUsed="true" /> đ
                                                    </td>
                                                    <td class="text-end">
                                                        <form action="<c:url value='/cart/remove'/>" method="post">
                                                            <input type="hidden" name="orderDetailId"
                                                                value="${item.id}" />
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                value="${_csrf.token}" />
                                                            <button type="submit"
                                                                class="btn btn-sm btn-outline-danger rounded-pill">
                                                                Xóa
                                                            </button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="d-flex justify-content-end mt-3">
                                <div class="bg-white rounded-4 shadow-sm p-3 p-lg-4">
                                    <div class="d-flex align-items-center justify-content-between gap-3">
                                        <span class="text-muted">Tổng cộng</span>
                                        <span class="fw-bold text-primary">
                                            <fmt:formatNumber value="${cartTotal}" type="number" groupingUsed="true" />
                                            đ
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <jsp:include page="../layout/footer.jsp" />