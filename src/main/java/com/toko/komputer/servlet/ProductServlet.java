package com.toko.komputer.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.toko.komputer.dao.ProductDAO;
import com.toko.komputer.dao.CategoryDAO;
import com.toko.komputer.dao.ProductTypeDAO;
import com.toko.komputer.model.Product;
import com.toko.komputer.model.ProductCategory;
import com.toko.komputer.model.ProductType;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {
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
        String action = request.getParameter("action");
        if (action != null && action.equals("view")) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            Product product = productDAO.getProductById(productId);

            // Ambil data kategori berdasarkan category_id
            ProductCategory category = categoryDAO.getCategoryById(product.getCategoryId());
            request.setAttribute("category", category);

            // Ambil data tipe produk berdasarkan type_id
            ProductType productType = productTypeDAO.getProductTypeById(product.getTypeId());
            request.setAttribute("productType", productType);

            request.setAttribute("product", product);
            request.getRequestDispatcher("/productDetail.jsp").forward(request, response);
        } else if (action != null && action.equals("edit")) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            Product product = productDAO.getProductById(productId);
            List<ProductCategory> categories = categoryDAO.getAllCategories();
            request.setAttribute("categories", categories);
            List<ProductType> productTypes = productTypeDAO.getAllProductTypes();
            request.setAttribute("productTypes", productTypes);
            request.setAttribute("product", product);
            request.getRequestDispatcher("/productEdit.jsp").forward(request, response);
        } else {
            List<Product> products = productDAO.getAllProducts();
            List<ProductCategory> categories = categoryDAO.getAllCategories();
            List<ProductType> productTypes = productTypeDAO.getAllProductTypes();
            request.setAttribute("products", products);
            request.setAttribute("categories", categories);
            request.setAttribute("productTypes", productTypes);

            request.getRequestDispatcher("/productList.jsp").forward(request, response);
        }
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null && action.equals("update")) {
            Product product = new Product();
            product.setProductId(Integer.parseInt(request.getParameter("productId")));
            product.setProductName(request.getParameter("productName"));
            product.setProductDescription(request.getParameter("productDescription"));
            product.setPrice(Double.parseDouble(request.getParameter("price")));
            product.setStock(Integer.parseInt(request.getParameter("stock")));
            product.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
            product.setTypeId(Integer.parseInt(request.getParameter("typeId")));
            productDAO.updateProduct(product);
            response.sendRedirect("products");
        } else if (action != null && action.equals("delete")) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            productDAO.deleteProduct(productId);
            response.sendRedirect("products");
        }
    }
}
