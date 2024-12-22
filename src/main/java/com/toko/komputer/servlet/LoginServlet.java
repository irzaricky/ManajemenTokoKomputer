package com.toko.komputer.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.toko.komputer.dao.UserDAO;
import com.toko.komputer.model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

//        System.out.println("Login attempt with username: " + username);

        User user = userDAO.getUserByUsernameAndPassword(username, password);
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
//            System.out.println("Login successful, redirecting to products");
            response.sendRedirect("products");
        } else {
//            System.out.println("Invalid username or password");
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
