<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <jsp:include page="../layout/header.jsp" />

            <div class="container" style="margin-top: 120px; min-height: 60vh;">
                <div class="d-flex align-items-center justify-content-between flex-wrap gap-2 mb-4">
                    <div>
                        <h2 class="fw-bold mb-1">Thanh toan</h2>
                        <p class="text-muted mb-0">Vui long dien thong tin nhan hang.</p>
                    </div>
                    <a href="<c:url value='/cart'/>" class="btn btn-outline-primary rounded-pill">
                        Quay lai gio hang
                    </a>
                </div>

                <c:if test="${not empty checkoutMessage}">
                    <div class="alert alert-success">${checkoutMessage}</div>
                </c:if>
                <c:if test="${not empty checkoutError}">
                    <div class="alert alert-danger">${checkoutError}</div>
                </c:if>

                <div class="row g-4">
                    <div class="col-lg-7">
                        <div class="card border-0 shadow-sm">
                            <div class="card-body p-4">
                                <h5 class="fw-bold mb-3">Thong tin nhan hang</h5>
                                <form action="<c:url value='/cart/checkout'/>" method="post">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <div class="row g-3">
                                        <div class="col-12">
                                            <label class="form-label">Ho ten</label>
                                            <input type="text" class="form-control" name="fullname"
                                                value="${currentUser.fullname}" required />
                                        </div>
                                        <div class="col-12">
                                            <label class="form-label">So dien thoai</label>
                                            <input type="text" class="form-control" name="phone"
                                                value="${currentUser.phone}" required />
                                        </div>
                                        <div class="col-12">
                                            <label class="form-label">Dia chi nhan hang</label>
                                            <textarea class="form-control" name="address" rows="3"
                                                required>${currentUser.address}</textarea>
                                        </div>
                                        <div class="col-12">
                                            <button type="submit" class="btn btn-primary rounded-pill px-4">
                                                Xac nhan thong tin
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="card border-0 shadow-sm">
                            <div class="card-body p-4">
                                <h5 class="fw-bold mb-3">Thong tin don hang</h5>
                                <div class="border rounded-3 p-3 mb-3" style="max-height: 320px; overflow: auto;">
                                    <c:forEach var="item" items="${cartItems}">
                                        <div
                                            class="d-flex align-items-center justify-content-between py-2 border-bottom">
                                            <div>
                                                <div class="fw-semibold">${item.product.name}</div>
                                                <div class="text-muted small">x${item.quantity}</div>
                                            </div>
                                            <div class="fw-semibold text-primary">
                                                <fmt:formatNumber value="${item.price * item.quantity}" type="number"
                                                    groupingUsed="true" /> d
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="d-flex align-items-center justify-content-between py-2 border-bottom">
                                    <span class="text-muted">Tam tinh</span>
                                    <span class="fw-semibold">
                                        <fmt:formatNumber value="${cartTotal}" type="number" groupingUsed="true" /> d
                                    </span>
                                </div>
                                <div class="d-flex align-items-center justify-content-between py-2 border-bottom">
                                    <span class="text-muted">Phi van chuyen</span>
                                    <span class="fw-semibold">
                                        <fmt:formatNumber value="${shippingFee}" type="number" groupingUsed="true" /> d
                                    </span>
                                </div>
                                <div class="d-flex align-items-center justify-content-between pt-3">
                                    <span class="fw-semibold">Tong cong</span>
                                    <span class="fw-bold text-primary">
                                        <fmt:formatNumber value="${orderTotal}" type="number" groupingUsed="true" /> d
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="../layout/footer.jsp" />