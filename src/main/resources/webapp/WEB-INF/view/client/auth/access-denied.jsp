<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <jsp:include page="../layout/header.jsp" />

        <div class="container" style="margin-top: 120px; min-height: 60vh;">
            <div class="text-center py-5">
                <h1 class="display-6 fw-bold text-danger">Truy cập bị từ chối</h1>
                <p class="text-muted">Bạn không có quyền truy cập trang này.</p>
                <a href="/" class="btn btn-primary rounded-pill px-4">Về trang chủ</a>
            </div>
        </div>

        <jsp:include page="../layout/footer.jsp" />