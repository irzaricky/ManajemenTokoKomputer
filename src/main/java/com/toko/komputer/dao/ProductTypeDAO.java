package com.toko.komputer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.toko.komputer.model.ProductType;
import com.toko.komputer.util.database_koneksi;

public class ProductTypeDAO {
    public List<ProductType> getAllProductTypes() {
        List<ProductType> productTypes = new ArrayList<>();
        String sql = "SELECT * FROM product_types";
        try (Connection conn = database_koneksi.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                ProductType productType = new ProductType();
                productType.setTypeId(rs.getInt("type_id"));
                productType.setTypeName(rs.getString("type_name"));
                productType.setDescription(rs.getString("description"));
                productTypes.add(productType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productTypes;
    }
    
    public ProductType getProductTypeById(int typeId) {
        ProductType productType = null;
        String sql = "SELECT * FROM product_types WHERE type_id = ?";
        try (Connection conn = database_koneksi.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, typeId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    productType = new ProductType();
                    productType.setTypeId(rs.getInt("type_id"));
                    productType.setTypeName(rs.getString("type_name"));
                    productType.setDescription(rs.getString("description"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productType;
    }
}