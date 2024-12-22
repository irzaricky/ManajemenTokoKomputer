<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.toko.komputer.model.Product" %>
<%@ page import="com.toko.komputer.model.ProductCategory" %>
<%@ page import="com.toko.komputer.model.ProductType" %>
<%@ page import="com.toko.komputer.util.PriceFormatter" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #212529;
            min-height: 100vh;
            font-family: Arial, sans-serif;
        }
        .container {
            background-color: #ffffff;
            border-radius: 15px;
            padding: 30px;
            margin-top: 30px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease-in-out;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        table {
            background-color: #ffffff;
            color: #212529;
            border-radius: 10px;
            overflow: hidden;
        }
        .table-dark th {
            background-color: #6c757d;
            color: #ffffff;
        }
        .table-hover tbody tr:hover {
            background-color: rgba(108, 117, 125, 0.1);
        }
        a.btn-primary, a.btn-secondary, button.btn-danger {
            border-radius: 5px;
            transition: all 0.3s ease;
        }
        a.btn-primary:hover {
            background-color: #007bff;
            border-color: #0056b3;
        }
        a.btn-secondary:hover {
            background-color: #6c757d;
            border-color: #545b62;
        }
        button.btn-danger:hover {
            background-color: #dc3545;
            border-color: #b21f30;
        }
        h1 {
            color: #007bff;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
        }
        .add-product-button {
            text-align: right;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <!-- Include Navbar -->
    <jsp:include page="navbar.jsp" />

    <div class="container">
        <h1 class="text-center mb-4">Product List</h1>
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Stock</th>
                        <th>Type</th>
                        <th>Category</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Product> products = (List<Product>) request.getAttribute("products");
                        List<ProductCategory> categories = (List<ProductCategory>) request.getAttribute("categories");
                        List<ProductType> productTypes = (List<ProductType>) request.getAttribute("productTypes");
                        if (products != null && !products.isEmpty()) {
                            for (Product product : products) {
                                String categoryName = "";
                                for (ProductCategory category : categories) {
                                    if (category.getCategoryId() == product.getCategoryId()) {
                                        categoryName = category.getCategoryName();
                                        break;
                                    }
                                }
                                String typeName = "";
                                for (ProductType type : productTypes) {
                                    if (type.getTypeId() == product.getTypeId()) {
                                        typeName = type.getTypeName();
                                        break;
                                    }
                                }
                    %>
                    <tr>
                        <td><%= product.getProductId() %></td>
                        <td><%= product.getProductName() %></td>
                        <td><%= product.getProductDescription() %></td>
                        <td><%= PriceFormatter.formatPrice(product.getPrice()) %></td>
                        <td><%= product.getStock() %></td>
                        <td><%= typeName %></td>
                        <td><%= categoryName %></td>
                        <td>
                            <div class="d-flex justify-content-center gap-2">
                                <a href="products?action=view&productId=<%= product.getProductId() %>" class="btn btn-primary">Detail</a>
                                <a href="products?action=edit&productId=<%= product.getProductId() %>" class="btn btn-secondary">Edit</a>
                                <form class="d-inline" action="products" method="post">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="productId" value="<%= product.getProductId() %>">
                                    <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this product?');">Delete</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="8" class="text-center">No products found.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        <div class="add-product-button">
            <a href="productAdd" class="btn btn-success">Tambah Produk</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
