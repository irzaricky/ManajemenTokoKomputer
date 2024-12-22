package com.toko.komputer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.toko.komputer.model.ProductCategory;
import com.toko.komputer.util.database_koneksi;

public class CategoryDAO {
    public List<ProductCategory> getAllCategories() {
        List<ProductCategory> categories = new ArrayList<>();
        String sql = "SELECT * FROM product_categories";
        try (Connection conn = database_koneksi.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                ProductCategory category = new ProductCategory();
                category.setCategoryId(rs.getInt("category_id"));
                category.setCategoryName(rs.getString("category_name"));
                category.setDescription(rs.getString("description"));
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    public List<ProductCategory> getCategoriesByTypeId(int typeId) {
        List<ProductCategory> categories = new ArrayList<>();
        String sql = "SELECT * FROM product_categories WHERE type_id = ?";
        try (Connection conn = database_koneksi.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, typeId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    ProductCategory category = new ProductCategory();
                    category.setCategoryId(rs.getInt("category_id"));
                    category.setCategoryName(rs.getString("category_name"));
                    category.setDescription(rs.getString("description"));
                    categories.add(category);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }
    
    public ProductCategory getCategoryById(int categoryId) {
        ProductCategory category = null;
        String sql = "SELECT * FROM product_categories WHERE category_id = ?";
        try (Connection conn = database_koneksi.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, categoryId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    category = new ProductCategory();
                    category.setCategoryId(rs.getInt("category_id"));
                    category.setCategoryName(rs.getString("category_name"));
                    category.setDescription(rs.getString("description"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return category;
    }

}
