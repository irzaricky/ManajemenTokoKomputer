package com.toko.komputer.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.toko.komputer.dao.CategoryDAO;
import com.toko.komputer.dao.ProductDAO;
import com.toko.komputer.dao.ProductTypeDAO;
import com.toko.komputer.model.Product;
import com.toko.komputer.model.ProductCategory;
import com.toko.komputer.model.ProductType;

@WebServlet("/productAdd")
public class ProductAddServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;
    private CategoryDAO categoryDAO;
    private ProductTypeDAO productTypeDAO;

    public void init() {
        productDAO = new ProductDAO();
        categoryDAO = new CategoryDAO();
        productTypeDAO = new ProductTypeDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Ambil daftar kategori dari database
        List<ProductCategory> categories = categoryDAO.getAllCategories();
        request.setAttribute("categories", categories);
        List<ProductType> productTypes = productTypeDAO.getAllProductTypes();
        request.setAttribute("productTypes", productTypes);
        request.getRequestDispatcher("/productAdd.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product product = new Product();
        product.setProductName(request.getParameter("productName"));
        product.setProductDescription(request.getParameter("productDescription"));
        product.setPrice(Double.parseDouble(request.getParameter("price")));
        product.setStock(Integer.parseInt(request.getParameter("stock")));
        product.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
        product.setTypeId(Integer.parseInt(request.getParameter("typeId")));
        productDAO.addProduct(product);
        response.sendRedirect("products");
    }
}
