<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>User Detail</title>
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
                                <h2>User Detail</h2>
                                <a href="/admin/user" class="btn btn-secondary">Go Back</a>
                            </div>

                            <div class="row g-4">
                                <div class="col-lg-4">
                                    <div class="card h-100">
                                        <div class="card-header">Avatar</div>
                                        <div class="card-body d-flex align-items-center justify-content-center">
                                            <c:choose>
                                                <c:when test="${not empty user.avatar}">
                                                    <img src="/resources/images/avatar/${user.avatar}" alt="avatar"
                                                        class="img-fluid rounded border" style="max-height: 260px;" />
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="text-muted">No avatar</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-8">
                                    <div class="card">
                                        <div class="card-header">User Information</div>
                                        <div class="card-body">
                                            <p class="mb-1"><strong>ID:</strong> ${user.id}</p>
                                            <p class="mb-1"><strong>Full Name:</strong> ${user.fullname}</p>
                                            <p class="mb-1"><strong>Email:</strong> ${user.email}</p>
                                            <p class="mb-1"><strong>Phone:</strong> ${user.phone}</p>
                                            <p class="mb-1"><strong>Address:</strong> ${user.address}</p>
                                            <p class="mb-0"><strong>Role:</strong> ${user.role.name}</p>
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