package com.toko.komputer.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.toko.komputer.dao.ProductDAO;
import com.toko.komputer.model.Product;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;

@WebServlet("/getProductPrice")
public class ProductPriceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        Product product = productDAO.getProductById(productId);

        JsonObjectBuilder jsonBuilder = Json.createObjectBuilder();
        jsonBuilder.add("productId", product.getProductId());
        jsonBuilder.add("productName", product.getProductName());
        jsonBuilder.add("price", product.getPrice());
        JsonObject json = jsonBuilder.build();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(json.toString());
        out.flush();
    }
}
