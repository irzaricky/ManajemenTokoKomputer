package com.toko.komputer.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.toko.komputer.dao.ProductDAO;
import com.toko.komputer.dao.SaleDAO;
import com.toko.komputer.dao.SaleDetailDAO;
import com.toko.komputer.dao.UserDAO;
import com.toko.komputer.model.Sale;
import com.toko.komputer.model.SaleDetail;
import com.toko.komputer.model.User;

@WebServlet("/sales")
public class SaleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SaleDAO saleDAO;
    private SaleDetailDAO saleDetailDAO;
    private UserDAO userDAO;

    public void init() {
        saleDAO = new SaleDAO();
        saleDetailDAO = new SaleDetailDAO();
        userDAO = new UserDAO();
        
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null && action.equals("view")) {
            int saleId = Integer.parseInt(request.getParameter("saleId"));
            int userId = Integer.parseInt(request.getParameter("userId"));

            // Fetch data from DAOs
            Sale sale = saleDAO.getSaleById(saleId);
            List<SaleDetail> saleDetails = saleDetailDAO.getSaleDetailsBySaleId(saleId);
            User user = userDAO.getUserById(userId);
            ProductDAO productDAO = new ProductDAO();
            
            for (SaleDetail saleDetail : saleDetails) {
                String productName = productDAO.getProductNameById(saleDetail.getProductId());
                saleDetail.setProductName(productName); // Add productName to SaleDetail model
            }
            

            // Pass data to JSP
            request.setAttribute("sale", sale);
            request.setAttribute("saleDetails", saleDetails);
            request.setAttribute("user", user); // Fix here: Use single User object

            // Forward to the JSP page
            request.getRequestDispatcher("/saleDetail.jsp").forward(request, response);
        } else {
            List<Sale> sales = saleDAO.getAllSales();
            List<User> users = userDAO.getAllUsers();
            request.setAttribute("sales", sales);
            request.setAttribute("users", users);
            request.getRequestDispatcher("/saleList.jsp").forward(request, response);
        }
    }

}
