<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <jsp:include page="../layout/header.jsp" />

        <div class="container" style="margin-top: 120px; margin-bottom: 80px;">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-xl-5">
                    <div class="bg-white rounded-4 shadow-sm p-4 p-md-5 border">
                        <div class="text-center mb-4">
                            <h2 class="fw-bold mb-2">Dang nhap</h2>
                            <p class="text-muted mb-0">Chao mung ban tro lai.</p>
                        </div>

                        <form action="/login" method="post">
                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type="text" class="form-control" name="username" placeholder="you@example.com" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <input type="password" class="form-control" name="password" placeholder="••••••••" />
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Dang nhap</button>
                        </form>

                        <div class="text-center mt-3">
                            <span class="text-muted">Chua co tai khoan?</span>
                            <a href="/register">Dang ky</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="../layout/footer.jsp" />