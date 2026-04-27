<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Delete Product</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        </head>

        <body>
            <div class="d-flex">
                <jsp:include page="../layout/sidebar.jsp" />

                <div class="container mt-5 flex-grow-1">
                    <div class="row">
                        <div class="col-lg-8 col-12 mx-auto">
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <h2>Delete Product</h2>
                                <a href="/admin/product" class="btn btn-secondary">Go Back</a>
                            </div>

                            <div class="alert alert-warning">
                                Bạn có chắc muốn xóa sản phẩm <strong>${newProduct.name}</strong>?
                            </div>

                            <form:form action="/admin/product/delete" method="post" modelAttribute="newProduct">
                                <form:input type="hidden" path="id" />
                                <button type="submit" class="btn btn-danger">Confirm Delete</button>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </body>

        </html>