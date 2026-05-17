<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%
        String currentPath = request.getRequestURI();
        String contextPath = request.getContextPath();
        if (contextPath != null && !contextPath.isEmpty() && currentPath.startsWith(contextPath)) {
            currentPath = currentPath.substring(contextPath.length());
        }
    %>
    <style>
        .admin-sidebar .nav-link {
            border-radius: 8px;
        }

        .admin-sidebar .nav-link.active {
            background-color: #198754 !important;
            color: #fff !important;
        }

        .admin-sidebar .nav-link.active:hover {
            color: #fff;
        }

        .admin-sidebar .nav-icon {
            width: 16px;
            height: 16px;
            margin-right: 8px;
            fill: currentColor;
        }
    </style>
    <div class="admin-sidebar d-flex flex-column flex-shrink-0 p-3 text-bg-dark"
        style="width: 250px; min-height: 100vh;">
        <a href="/admin/dashboard"
            class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
            <span class="fs-4">Admin Panel</span>
        </a>
        <hr>
        <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item">
                <a href="/admin/dashboard"
                    class="nav-link text-white <%= currentPath.startsWith("/admin/dashboard") ? "active" : "" %>">
                    <svg class="nav-icon" viewBox="0 0 16 16" aria-hidden="true">
                        <rect x="1" y="1" width="6" height="6" rx="1"></rect>
                        <rect x="9" y="1" width="6" height="4" rx="1"></rect>
                        <rect x="9" y="7" width="6" height="8" rx="1"></rect>
                        <rect x="1" y="9" width="6" height="6" rx="1"></rect>
                    </svg>
                    Dashboard
                </a>
            </li>
            <li>
                <a href="/admin/order"
                    class="nav-link text-white <%= currentPath.startsWith("/admin/order") ? "active" : "" %>">
                    <svg class="nav-icon" viewBox="0 0 16 16" aria-hidden="true">
                        <rect x="2" y="2" width="12" height="2" rx="1"></rect>
                        <rect x="2" y="7" width="12" height="2" rx="1"></rect>
                        <rect x="2" y="12" width="12" height="2" rx="1"></rect>
                    </svg>
                    Order
                </a>
            </li>
            <li>
                <a href="/admin/product"
                    class="nav-link text-white <%= currentPath.startsWith("/admin/product") ? "active" : "" %>">
                    <svg class="nav-icon" viewBox="0 0 16 16" aria-hidden="true">
                        <rect x="2" y="4" width="12" height="10" rx="1"></rect>
                        <rect x="4" y="2" width="8" height="2" rx="1"></rect>
                    </svg>
                    Product
                </a>
            </li>
            <li>
                <a href="/admin/user"
                    class="nav-link text-white <%= currentPath.startsWith("/admin/user") ? "active" : "" %>">
                    <svg class="nav-icon" viewBox="0 0 16 16" aria-hidden="true">
                        <circle cx="8" cy="5" r="3"></circle>
                        <rect x="3" y="9" width="10" height="5" rx="2"></rect>
                    </svg>
                    User
                </a>
            </li>
        </ul>
        <script>
            (function () {
                var currentPath = window.location.pathname || "";
                var links = document.querySelectorAll(".admin-sidebar .nav-link");
                var bestMatch = null;
                var bestLength = -1;

                links.forEach(function (link) {
                    var linkPath = link.getAttribute("href");
                    if (!linkPath) {
                        return;
                    }

                    try {
                        linkPath = new URL(link.href).pathname;
                    } catch (e) {
                        return;
                    }

                    if (currentPath === linkPath || (linkPath !== "/" && currentPath.startsWith(linkPath))) {
                        if (linkPath.length > bestLength) {
                            bestMatch = link;
                            bestLength = linkPath.length;
                        }
                    }
                });

                if (bestMatch) {
                    links.forEach(function (link) {
                        link.classList.remove("active");
                    });
                    bestMatch.classList.add("active");
                }
            })();
        </script>
    </div>