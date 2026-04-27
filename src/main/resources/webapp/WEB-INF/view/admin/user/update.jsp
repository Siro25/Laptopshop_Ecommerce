<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Update User</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            </head>

            <body>
                <div class="d-flex">
                    <jsp:include page="../layout/sidebar.jsp" />

                    <div class="container mt-5 flex-grow-1">
                        <div class="row">
                            <div class="col-lg-9 col-12 mx-auto">
                                <div class="d-flex justify-content-between align-items-center mb-4">
                                    <h2>Update User</h2>
                                    <a href="/admin/user" class="btn btn-secondary">Go Back</a>
                                </div>
                                <form:form action="/admin/user/update" method="post" modelAttribute="newUser"
                                    enctype="multipart/form-data">
                                    <form:input type="hidden" path="id" />
                                    <form:input type="hidden" path="avatar" />
                                    <form:input type="hidden" path="role.id" />

                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <label class="form-label">Full Name</label>
                                            <form:input type="text" class="form-control" path="fullname" />
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Email</label>
                                            <form:input type="email" class="form-control" path="email" />
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Password (leave blank to keep current)</label>
                                            <form:input type="password" class="form-control" path="password" value="" />
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Phone</label>
                                            <form:input type="text" class="form-control" path="phone" />
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Address</label>
                                            <form:input type="text" class="form-control" path="address" />
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Role</label>
                                            <form:select class="form-select" path="role.name">
                                                <form:option value="USER">User</form:option>
                                                <form:option value="ADMIN">Admin</form:option>
                                            </form:select>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="avatarFile" class="form-label">Avatar (optional)</label>
                                            <input class="form-control" type="file" id="avatarFile"
                                                accept=".png, .jpg, .jpeg" name="hinhAnh" />
                                        </div>
                                        <div class="col-md-6 d-flex align-items-end">
                                            <c:choose>
                                                <c:when test="${not empty newUser.avatar}">
                                                    <img style="max-height: 140px;" alt="avatar preview"
                                                        id="avatarPreview"
                                                        src="/resources/images/avatar/${newUser.avatar}" />
                                                </c:when>
                                                <c:otherwise>
                                                    <img style="max-height: 140px; display: none;" alt="avatar preview"
                                                        id="avatarPreview" />
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                    <div class="mt-3">
                                        <button type="submit" class="btn btn-primary">Update User</button>
                                    </div>
                                </form:form>

                            </div>

                        </div>

                    </div>

                </div>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            if (!e.target.files || e.target.files.length === 0) {
                                return;
                            }
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
            </body>

            </html>