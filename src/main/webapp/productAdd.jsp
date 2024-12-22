<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.toko.komputer.model.ProductCategory" %>
<%@ page import="com.toko.komputer.model.ProductType" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Product</title>
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
            max-width: 800px;
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

        .form-label {
            font-weight: bold;
            color: #495057; 
        }

        .form-control {
            border-radius: 5px;
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        button {
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        button:hover {
            opacity: 0.9;
        }

        button.btn-success {
            background-color: #28a745;
            border-color: #218838;
        }

        button.btn-success:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <!-- Include Navbar -->
    <jsp:include page="navbar.jsp" />

    <div class="container">
        <h1 class="text-center mb-4">Add New Product</h1>
        <form action="productAdd" method="post">
            <input type="hidden" name="action" value="add">
            
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="productName" class="form-label">Product Name:</label>
                    <input type="text" id="productName" name="productName" class="form-control" placeholder="Enter product name" required>
                </div>
                <div class="col-md-6">
                    <label for="price" class="form-label">Price:</label>
                    <input type="number" step="0.01" id="price" name="price" class="form-control" placeholder="Enter product price" required>
                </div>
            </div>
            
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="productDescription" class="form-label">Description:</label>
                    <textarea id="productDescription" name="productDescription" class="form-control" placeholder="Enter product description" rows="4" required></textarea>
                </div>
                <div class="col-md-6">
                    <label for="stock" class="form-label">Stock:</label>
                    <input type="number" id="stock" name="stock" class="form-control" placeholder="Enter stock quantity" required>
                </div>
            </div>
            
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="categoryId" class="form-label">Category:</label>
                    <select id="categoryId" name="categoryId" class="form-control" required>
                        <option value="" disabled selected>Select Category</option>
                        <%
                            List<ProductCategory> categories = (List<ProductCategory>) request.getAttribute("categories");
                            for (ProductCategory category : categories) {
                        %>
                            <option value="<%= category.getCategoryId() %>"><%= category.getCategoryName() %></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="col-md-6">
                    <label for="typeId" class="form-label">Type:</label>
                    <select id="typeId" name="typeId" class="form-control" required>
                        <option value="" disabled selected>Select Type</option>
                        <%
                            List<ProductType> productTypes = (List<ProductType>) request.getAttribute("productTypes");
                            for (ProductType type : productTypes) {
                        %>
                            <option value="<%= type.getTypeId() %>"><%= type.getTypeName() %></option>
                        <%
                            }
                        %>
                    </select>
                </div>
            </div>

            <div class="button-container">
                <a href="products" class="btn btn-secondary">Back to Product List</a>
                <button type="submit" class="btn btn-success">Add Product</button>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
