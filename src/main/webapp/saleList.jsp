<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.toko.komputer.model.Sale" %>
<%@ page import="com.toko.komputer.model.User" %>
<%@ page import="com.toko.komputer.util.PriceFormatter" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sale List</title>
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
    </style>
</head>
<body>
    <!-- Include Navbar -->
    <jsp:include page="navbar.jsp" />

    <div class="container">
        <h1 class="text-center mb-4">Sale List</h1>
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Sale ID</th>
                        <th>Sale Date</th>
                        <th>Total Amount</th>
                        <th>User Name</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Sale> sales = (List<Sale>) request.getAttribute("sales");
                        List<User> users = (List<User>) request.getAttribute("users");
                        if (sales != null && !sales.isEmpty()) {
                            for (Sale sale : sales) {
                                String userName = "";
                                for (User user : users) {
                                    if (user.getUserId() == sale.getUserId()) {
                                        userName = user.getUsername();
                                        break;
                                    }
                                }
                    %>
                    <tr>
                        <td><%= sale.getSaleId() %></td>
                        <td><%= sale.getSaleDate() %></td>
                        <td><%= PriceFormatter.formatPrice(sale.getTotalAmount()) %></td>
                        <td><%= userName %></td>
                        <td>
                            <div class="d-flex justify-content-center gap-2">
                                <a href="sales?action=view&saleId=<%= sale.getSaleId() %>&userId=<%= sale.getUserId() %>" class="btn btn-primary">Detail</a>
                            </div>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="5" class="text-center">No sales found.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
