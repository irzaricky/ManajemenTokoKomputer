package com.toko.komputer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.toko.komputer.model.Product;
import com.toko.komputer.util.database_koneksi;

public class ProductDAO {
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products";
        try (Connection conn = database_koneksi.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setProductDescription(rs.getString("product_description"));
                product.setPrice(rs.getDouble("price"));
                product.setStock(rs.getInt("stock"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setTypeId(rs.getInt("type_id"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public Product getProductById(int productId) {
        Product product = null;
        String sql = "SELECT * FROM products WHERE product_id = ?";
        try (Connection conn = database_koneksi.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, productId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    product = new Product();
                    product.setProductId(rs.getInt("product_id"));
                    product.setProductName(rs.getString("product_name"));
                    product.setProductDescription(rs.getString("product_description"));
                    product.setPrice(rs.getDouble("price"));
                    product.setStock(rs.getInt("stock"));
                    product.setCategoryId(rs.getInt("category_id"));
                    product.setTypeId(rs.getInt("type_id"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }
    
    public String getProductNameById(int productId) {
        String productName = null;
        String query = "SELECT product_name FROM products WHERE product_id = ?";
        try (Connection connection = database_koneksi.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, productId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    productName = resultSet.getString("product_name");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productName;
    }

    public void addProduct(Product product) {
        String sql = "INSERT INTO products (product_name, product_description, price, stock, category_id, type_id) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = database_koneksi.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, product.getProductName());
            stmt.setString(2, product.getProductDescription());
            stmt.setDouble(3, product.getPrice());
            stmt.setInt(4, product.getStock());
            stmt.setInt(5, product.getCategoryId());
            stmt.setInt(6, product.getTypeId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateProduct(Product product) {
        String sql = "UPDATE products SET product_name = ?, product_description = ?, price = ?, stock = ?, category_id = ?, type_id = ? WHERE product_id = ?";
        try (Connection conn = database_koneksi.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, product.getProductName());
            stmt.setString(2, product.getProductDescription());
            stmt.setDouble(3, product.getPrice());
            stmt.setInt(4, product.getStock());
            stmt.setInt(5, product.getCategoryId());
            stmt.setInt(6, product.getTypeId());
            stmt.setInt(7, product.getProductId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteProduct(int productId) {
        String sql = "DELETE FROM products WHERE product_id = ?";
        try (Connection conn = database_koneksi.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, productId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
