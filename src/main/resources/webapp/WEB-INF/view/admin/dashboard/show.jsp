<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Dashboard</title>
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
                            <h3>Dashboard</h3>
                        </div>
                        <hr />
                        <div class="col-12">
                            <p>Welcome to the Admin Dashboard!</p>
                        </div>
                    </div>
                </div>
            </div>
        </body>

        </html>