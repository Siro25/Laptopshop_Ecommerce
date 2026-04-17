<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Manage Products</title>
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
                            <h3>Table Products</h3>
                            <a href="/admin/product/create" class="btn btn-primary">Create Product</a>
                        </div>
                        <hr />
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Category</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Place product items here -->
                                <tr>
                                    <td colspan="5" class="text-center">No products found.</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </body>

        </html>