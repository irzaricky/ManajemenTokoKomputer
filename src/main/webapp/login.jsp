<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-image: url('static/images/background_login_2.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .login-container {
            background: rgba(0, 0, 0, 0.5); /* Black with transparency */
            border: 1px solid rgba(255, 255, 255, 0.2); /* Subtle border */
            backdrop-filter: blur(10px); /* Glass effect */
            -webkit-backdrop-filter: blur(10px); /* For Safari */
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.5); /* Glass shadow */
            width: 100%;
            max-width: 400px;
            color: white;
        }
        h1, p {
            color: white;
        }
        .form-control {
            background: rgba(255, 255, 255, 0.2); /* Transparent input background */
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: white;
            border-radius: 10px;
            transition: all 0.3s ease;
        }
        .form-control:focus {
            background: rgba(255, 255, 255, 0.3); /* Slightly brighter on focus */
            border-color: rgba(255, 255, 255, 0.5);
            box-shadow: 0 0 8px rgba(255, 255, 255, 0.3);
        }
        .form-label {
            font-weight: bold;
        }
        .btn-primary {
            background: linear-gradient(90deg, rgba(76, 175, 80, 1), rgba(56, 142, 60, 1)); /* Gradient button */
            border: none;
            font-weight: bold;
            border-radius: 10px;
            transition: background 0.3s ease;
        }
        .btn-primary:hover {
            background: linear-gradient(90deg, rgba(56, 142, 60, 1), rgba(76, 175, 80, 1));
        }
        .error-message {
            color: #f8d7da;
            background: rgba(220, 53, 69, 0.2);
            padding: 10px;
            border-radius: 5px;
            margin: 20px 0;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1 class="text-center mb-2">LOGIN</h1>
        <p class="text-center mb-0">Selamat datang!</p>
        <p class="text-center">Website Manajemen Toko Komputer</p>
        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
            <p class="error-message"><%= errorMessage %></p>
        <%
            }
        %>
        <form action="login" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Username:</label>
                <input type="text" id="username" name="username" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password:</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Login</button>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
