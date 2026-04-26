<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Create Product</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        </head>

        <body>
            <div class="d-flex">
                <jsp:include page="../layout/sidebar.jsp" />

                <div class="container mt-5 flex-grow-1">
                    <div class="row">
                        <div class="col-lg-10 col-12 mx-auto">
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <h2>Create Product</h2>
                                <a href="/admin/product" class="btn btn-secondary">Go Back</a>
                            </div>

                            <form:form action="/admin/product/create" method="post" modelAttribute="newProduct"
                                enctype="multipart/form-data">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label class="form-label">Name</label>
                                        <form:input type="text" class="form-control" path="name" />
                                        <form:errors path="name" cssClass="text-danger small" />
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label">Price</label>
                                        <form:input type="number" step="0.01" min="0" class="form-control"
                                            path="price" />
                                        <form:errors path="price" cssClass="text-danger small" />
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label">Quantity</label>
                                        <form:input type="number" min="0" class="form-control" path="quantity" />
                                        <form:errors path="quantity" cssClass="text-danger small" />
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label">Factory</label>
                                        <form:select class="form-select" path="factory">
                                            <form:option value="">-- Select factory --</form:option>
                                            <form:option value="Apple">Apple</form:option>
                                            <form:option value="Asus">Asus</form:option>
                                            <form:option value="Dell">Dell</form:option>
                                            <form:option value="HP">HP</form:option>
                                            <form:option value="Lenovo">Lenovo</form:option>
                                            <form:option value="MSI">MSI</form:option>
                                        </form:select>
                                        <form:errors path="factory" cssClass="text-danger small" />
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label">Target</label>
                                        <form:select class="form-select" path="target">
                                            <form:option value="">-- Select target --</form:option>
                                            <form:option value="Gaming">Gaming</form:option>
                                            <form:option value="Sinh vien - Van phong">Sinh vien - Van phong
                                            </form:option>
                                            <form:option value="Mong nhe">Mong nhe</form:option>
                                            <form:option value="Do hoa - Ky thuat">Do hoa - Ky thuat</form:option>
                                        </form:select>
                                        <form:errors path="target" cssClass="text-danger small" />
                                    </div>

                                    <div class="col-md-6">
                                        <label for="productFile" class="form-label">Product Image</label>
                                        <input class="form-control" type="file" id="productFile"
                                            accept=".png, .jpg, .jpeg" name="hinhAnh" />
                                        <form:errors path="image" cssClass="text-danger small" />
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label">Short Description</label>
                                        <form:textarea class="form-control" path="shortDesc" rows="4" />
                                        <form:errors path="shortDesc" cssClass="text-danger small" />
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label">Detail Description</label>
                                        <form:textarea class="form-control" path="detailDesc" rows="4" />
                                        <form:errors path="detailDesc" cssClass="text-danger small" />
                                    </div>

                                    <div class="col-md-6 d-flex align-items-end">
                                        <img style="max-height: 140px; display: none;" alt="product preview"
                                            id="productPreview" />
                                    </div>
                                </div>

                                <div class="mt-3">
                                    <button type="submit" class="btn btn-primary">Create Product</button>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                $(document).ready(() => {
                    const productFile = $("#productFile");
                    productFile.change(function (e) {
                        const imgURL = URL.createObjectURL(e.target.files[0]);
                        $("#productPreview").attr("src", imgURL);
                        $("#productPreview").css({ "display": "block" });
                    });
                });
            </script>
        </body>

        </html>