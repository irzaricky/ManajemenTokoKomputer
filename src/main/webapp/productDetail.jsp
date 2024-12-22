<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.toko.komputer.model.Product" %>
<%@ page import="com.toko.komputer.model.ProductCategory" %>
<%@ page import="com.toko.komputer.model.ProductType" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Detail</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #212529;
            font-family: Arial, sans-serif;
            min-height: 100vh;
        }
        .container {
            background-color: #ffffff;
            border-radius: 15px;
            padding: 30px;
            margin-top: 30px;
            max-width: 600px;
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
        h1 {
            color: #007bff;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        table th, table td {
            padding: 10px;
            text-align: left;
            border: 1px solid #dee2e6;
        }
        table th {
            background-color: #f1f1f1;
            color: #495057;
        }
        .btn {
            margin-top: 20px;
            border-radius: 5px;
            transition: all 0.3s ease;
        }
        .btn:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>
    <!-- Include Navbar -->
    <jsp:include page="navbar.jsp" />

    <div class="container">
        <h1 class="text-center">Product Detail</h1>
        <%
            Product product = (Product) request.getAttribute("product");
            ProductCategory category = (ProductCategory) request.getAttribute("category");
            ProductType productType = (ProductType) request.getAttribute("productType");
            if (product != null) {
        %>
            <table class="table table-bordered">
                <tr>
                    <th>Product ID</th>
                    <td><%= product.getProductId() %></td>
                </tr>
                <tr>
                    <th>Product Name</th>
                    <td><%= product.getProductName() %></td>
                </tr>
                <tr>
                    <th>Description</th>
                    <td><%= product.getProductDescription() %></td>
                </tr>
                <tr>
                    <th>Price</th>
                    <td><%= product.getPrice() %></td>
                </tr>
                <tr>
                    <th>Stock</th>
                    <td><%= product.getStock() %></td>
                </tr>
                <tr>
                    <th>Category ID</th>
                    <td><%= product.getCategoryId() %></td>
                </tr>
                <tr>
                    <th>Category Name</th>
                    <td><%= category != null ? category.getCategoryName() : "N/A" %></td>
                </tr>
                <tr>
                    <th>Type ID</th>
                    <td><%= product.getTypeId() %></td>
                </tr>
                <tr>
                    <th>Type Name</th>
                    <td><%= productType != null ? productType.getTypeName() : "N/A" %></td>
                </tr>
            </table>
        <%
            } else {
        %>
            <p class="text-center">Product not found.</p>
        <%
            }
        %>
        <div class="text-center">
            <a href="products" class="btn btn-primary">Back to Product List</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
