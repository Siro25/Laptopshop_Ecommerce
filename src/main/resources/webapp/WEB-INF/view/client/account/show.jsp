<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <jsp:include page="../layout/header.jsp" />

        <div class="container" style="margin-top: 120px; min-height: 60vh;">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card border-0 shadow-sm">
                        <div class="card-body p-4 p-md-5">
                            <div class="d-flex align-items-center justify-content-between flex-wrap mb-4">
                                <div>
                                    <h3 class="fw-bold mb-1">Quản lý tài khoản</h3>
                                    <p class="text-muted mb-0">Cập nhật thông tin cá nhân của bạn.</p>
                                </div>
                                <span class="badge bg-primary">Tài khoản của bạn</span>
                            </div>
                            <c:if test="${not empty accountUpdateMessage}">
                                <div class="alert alert-success">${accountUpdateMessage}</div>
                            </c:if>
                            <form action="/account/update" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label class="form-label">Họ tên</label>
                                        <input type="text" class="form-control" name="fullname"
                                            value="${currentUser.fullname}" required />
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Email</label>
                                        <input type="email" class="form-control" value="${currentUser.email}"
                                            readonly />
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Số điện thoại</label>
                                        <input type="text" class="form-control" name="phone"
                                            value="${currentUser.phone}" />
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Địa chỉ</label>
                                        <input type="text" class="form-control" name="address"
                                            value="${currentUser.address}" />
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Mật khẩu mới</label>
                                        <input type="password" class="form-control" name="password"
                                            placeholder="Để trống nếu không đổi" />
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Ảnh đại diện</label>
                                        <input type="file" class="form-control" name="avatarFile"
                                            accept=".png,.jpg,.jpeg" />
                                    </div>
                                    <div class="col-12">
                                        <div class="d-flex align-items-center gap-3">
                                            <c:choose>
                                                <c:when test="${not empty currentUser.avatar}">
                                                    <img src="/resources/images/avatar/${currentUser.avatar}"
                                                        alt="avatar" class="rounded-circle"
                                                        style="width: 64px; height: 64px; object-fit: cover;" />
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="rounded-circle bg-light d-inline-flex align-items-center justify-content-center"
                                                        style="width: 64px; height: 64px;">
                                                        <i class="fas fa-user text-primary"></i>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                            <div>
                                                <div class="fw-semibold">${currentUser.fullname}</div>
                                                <div class="text-muted small">${currentUser.email}</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button type="submit" class="btn btn-primary rounded-pill px-4">
                                            Lưu thay đổi
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="../layout/footer.jsp" />