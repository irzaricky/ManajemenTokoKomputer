<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.toko.komputer.model.Sale" %>
<%@ page import="com.toko.komputer.model.SaleDetail" %>
<%@ page import="com.toko.komputer.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sale Detail</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
    <!-- Include Navbar -->
    <jsp:include page="navbar.jsp" />

    <div class="container">
        <h1 class="text-center">Sale Detail</h1>
        <%
            Sale sale = (Sale) request.getAttribute("sale");
            List<SaleDetail> saleDetails = (List<SaleDetail>) request.getAttribute("saleDetails");
            User user = (User) request.getAttribute("user");
            if (sale != null) {
        %>
            <table class="table table-bordered">
                <tr>
                    <th>Sale ID</th>
                    <td><%= sale.getSaleId() %></td>
                </tr>
                <tr>
                    <th>Sale Date</th>
                    <td><%= sale.getSaleDate() %></td>
                </tr>
                <tr>
                    <th>Total Amount</th>
                    <td><%= sale.getTotalAmount() %></td>
                </tr>
                <tr>
                    <th>User Name</th>
                    <td><%= user.getUsername() %></td>
                </tr>
            </table>
            <h2 class="mt-4">Sale Details</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (saleDetails != null) {
                            for (SaleDetail saleDetail : saleDetails) {
                    %>
                    <tr>
                        <td><%= saleDetail.getProductName() %></td>
                        <td><%= saleDetail.getQuantity() %></td>
                        <td><%= saleDetail.getPrice() %></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        <%
            } else {
        %>
            <p class="text-center">Sale not found.</p>
        <%
            }
        %>
        <div class="text-center">
            <a href="sales" class="btn btn-primary">Back to Sale List</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
