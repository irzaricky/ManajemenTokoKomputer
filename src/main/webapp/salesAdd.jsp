<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.toko.komputer.model.Product"%>
<%@ page import="com.toko.komputer.model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Sale</title>
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
    padding: 40px; /
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

.form-control, .product-select {
    border-radius: 5px;
    box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
    font-size: 13px; 
    height: 35px; 
    padding: 6px; 
}

.form-control:focus {
    border-color: #007bff;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
}

button {
    border-radius: 5px;
    transition: all 0.3s ease;
    font-size: 13px;
    padding: 6px 12px; 
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

button.btn-secondary {
    background-color: #6c757d;
    border-color: #5a6268;
}

button.btn-secondary:hover {
    background-color: #5a6268;
    border-color: #545b62;
}

button.remove-product {
    background-color: #dc3545;
    border-color: #c82333;
    color: white;
    font-weight: bold;
}

button.remove-product:hover {
    background-color: #c82333;
    border-color: #bd2130;
}

#product-container .row {
    border-radius: 8px;
    margin-top: 10px;
}

#product-container .col-md-5,
#product-container .col-md-3,
#product-container .col-md-1 {
    padding-left: 5px;
    padding-right: 5px;
}

#add-product {
    background-color: #007bff;
    border-color: #0056b3;
    font-weight: 600;
    margin-bottom: 30px;
    padding: 6px 12px; /* Mengurangi padding */
}

#add-product:hover {
    background-color: #0056b3;
    border-color: #004085;
}

.w-100 {
    width: 100% !important;
}

.mb-4 {
    margin-bottom: 2rem !important;
}

.product-select, .form-control {
    font-size: 13px;
    height: 35px;
    padding: 6px;
}

.mb-3 {
    margin-bottom: 15px;
}

</style>
</head>
<body>
	<!-- Include Navbar -->
	<jsp:include page="navbar.jsp" />

	<div class="container">
		<h1 class="text-center mb-4">Add New Sale</h1>
		<form action="salesAdd" method="post">
			<input type="hidden" name="action" value="add">
			<div class="mb-3">
				<label for="saleDate" class="form-label">Sale Date:</label>
				<input type="datetime-local" id="saleDate" name="saleDate" class="form-control" required>
			</div>
			<div class="mb-3">
				<label for="userId" class="form-label">Username:</label>
				<select id="userId" name="userId" class="form-control" required>
					<option value="" disabled selected>Select Username</option>
					<%
						
						List<User> users = (List<User>) request.getAttribute("users");
						if (users != null && !users.isEmpty()) {
							for (User user : users) {
					%>
					<option value="<%= user.getUserId() %>"><%= user.getUsername() %></option>
					<%
							}
						} else {
					%>
					<option value="" disabled>No users available</option>
					<%
						}
					%>
				</select>
			</div>
			<div class="mb-3">
				<label for="products" class="form-label">Products:</label>
				<div id="product-container">
					<div class="row mb-3">
						<div class="col-md-3">
							<select name="productIds" class="form-control product-select" required>
								<option value="" disabled selected>Select Product</option>
								<%
									List<Product> products = (List<Product>) request.getAttribute("products");
									for (Product product : products) {
								%>
								<option value="<%= product.getProductId() %>"><%= product.getProductName() %></option>
								<%
									}
								%>
							</select>
						</div>
						<div class="col-md-3">
							<input type="number" name="quantities" class="form-control" placeholder="Quantity" required>
						</div>
						<div class="col-md-3">
							<input type="number" name="prices" class="form-control" placeholder="Price" readonly>
						</div>
						<div class="col-md-1">
							<button type="button" class="btn btn-danger remove-product">Remove</button>
						</div>
					</div>
				</div>
				<button type="button" class="btn btn-secondary" id="add-product">Add Product</button>
			</div>
			<button type="submit" class="btn btn-success w-100">Add Sale</button>
		</form>
	</div>

	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		document.getElementById('add-product').addEventListener('click', function() {
			var container = document.getElementById('product-container');
			var row = document.createElement('div');
			row.className = 'row mb-3';
			row.innerHTML = `
				<div class="col-md-3">
					<select name="productIds" class="form-control product-select" required>
						<option value="" disabled selected>Select Product</option>
						<%
							for (Product product : products) {
						%>
						<option value="<%= product.getProductId() %>"><%= product.getProductName() %></option>
						<%
							}
						%>
					</select>
				</div>
				<div class="col-md-3">
					<input type="number" name="quantities" class="form-control" placeholder="Quantity" required>
				</div>
				<div class="col-md-3">
					<input type="number" name="prices" class="form-control" placeholder="Price" readonly>
				</div>
				<div class="col-md-1">
					<button type="button" class="btn btn-danger remove-product">Remove</button>
				</div>
			`;
			container.appendChild(row);
			attachPriceFetchEvent(row);
		});

		document.addEventListener('click', function(event) {
			if (event.target.classList.contains('remove-product')) {
				event.target.closest('.row').remove();
			}
		});

		function attachPriceFetchEvent(row) {
			var select = row.querySelector('.product-select');
			select.addEventListener('change', function() {
				var productId = select.value;
				var priceInput = row.querySelector('input[name="prices"]');
				fetchProductPrice(productId, priceInput);
			});
		}

		function fetchProductPrice(productId, priceInput) {
			fetch('getProductPrice?productId=' + productId)
				.then(response => response.json())
				.then(data => {
					priceInput.value = data.price;
				})
				.catch(error => {
					console.error('Error fetching product price:', error);
				});
		}

		document.querySelectorAll('.product-select').forEach(function(select) {
			attachPriceFetchEvent(select.closest('.row'));
		});
	</script>
</body>
</html>
