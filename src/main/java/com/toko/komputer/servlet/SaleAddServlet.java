package com.toko.komputer.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.toko.komputer.model.Product;
import com.toko.komputer.model.Sale;
import com.toko.komputer.model.SaleDetail;
import com.toko.komputer.model.User;
import com.toko.komputer.util.database_koneksi;

@WebServlet("/salesAdd")
public class SaleAddServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private SaleDAO saleDAO;
    private SaleDetailDAO saleDetailDAO;
    private ProductDAO productDAO;
    private UserDAO UserDAO;

    public void init() {
        saleDAO = new SaleDAO();
        saleDetailDAO = new SaleDetailDAO();
        productDAO = new ProductDAO();
        UserDAO = new UserDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = productDAO.getAllProducts();
        request.setAttribute("products", products);
        List<User> users = UserDAO.getAllUsers();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/salesAdd.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        try {
            conn = database_koneksi.getConnection();
            conn.setAutoCommit(false);

            // Simpan data ke tabel sales
            Sale sale = new Sale();
            String saleDateStr = request.getParameter("saleDate");
            Timestamp saleDate = convertToTimestamp(saleDateStr);
            sale.setSaleDate(saleDate);
            sale.setUserId(Integer.parseInt(request.getParameter("userId")));

            String[] productIds = request.getParameterValues("productIds");
            String[] quantities = request.getParameterValues("quantities");
            String[] prices = request.getParameterValues("prices");

            double totalAmount = 0.0;
            for (int i = 0; i < productIds.length; i++) {
                int quantity = Integer.parseInt(quantities[i]);
                double price = Double.parseDouble(prices[i]);
                totalAmount += quantity * price;
            }
            sale.setTotalAmount(totalAmount);
            saleDAO.addSale(conn, sale);

            // Ambil sale_id terakhir yang disisipkan
            int saleId = sale.getSaleId();

            // Simpan data ke tabel sale_details
            for (int i = 0; i < productIds.length; i++) {
                SaleDetail saleDetail = new SaleDetail();
                saleDetail.setSaleId(saleId);
                saleDetail.setProductId(Integer.parseInt(productIds[i]));
                saleDetail.setQuantity(Integer.parseInt(quantities[i]));
                saleDetail.setPrice(Double.parseDouble(prices[i]));
                saleDetailDAO.addSaleDetail(conn, saleDetail);
            }

            conn.commit(); 
            response.sendRedirect("sales");
        } catch (Exception e) {
            if (conn != null) {
                try {
                    conn.rollback(); // Rollback jika ada error
                } catch (Exception rollbackEx) {
                    rollbackEx.printStackTrace();
                }
            }
            e.printStackTrace();
            throw new ServletException("Error while processing sales transaction.");
        } finally {
            if (conn != null) {
                try {
                    conn.setAutoCommit(true);
                    conn.close();
                } catch (Exception closeEx) {
                    closeEx.printStackTrace();
                }
            }
        }
    }

    private Timestamp convertToTimestamp(String dateStr) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
        Date parsedDate = null;
        try {
            parsedDate = dateFormat.parse(dateStr);
        } catch (ParseException e) {
            e.printStackTrace();
            parsedDate = new Date();
        }
        return new Timestamp(parsedDate.getTime());
    }
}
