package com.toko.komputer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.toko.komputer.model.SaleDetail;
import com.toko.komputer.util.database_koneksi;

public class SaleDetailDAO {
    public List<SaleDetail> getSaleDetailsBySaleId(int saleId) {
        List<SaleDetail> saleDetails = new ArrayList<>();
        String sql = "SELECT * FROM sale_details WHERE sale_id = ?";
        try (Connection conn = database_koneksi.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, saleId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    SaleDetail saleDetail = new SaleDetail();
                    saleDetail.setSaleDetailId(rs.getInt("sale_detail_id"));
                    saleDetail.setSaleId(rs.getInt("sale_id"));
                    saleDetail.setProductId(rs.getInt("product_id"));
                    saleDetail.setQuantity(rs.getInt("quantity"));
                    saleDetail.setPrice(rs.getDouble("price"));
                    saleDetails.add(saleDetail);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return saleDetails;
    }

    public void addSaleDetail(Connection conn, SaleDetail saleDetail) throws SQLException {
        String sql = "INSERT INTO sale_details (sale_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, saleDetail.getSaleId());
            stmt.setInt(2, saleDetail.getProductId());
            stmt.setInt(3, saleDetail.getQuantity());
            stmt.setDouble(4, saleDetail.getPrice());
            stmt.executeUpdate();
        }
    }

    public void updateSaleDetail(SaleDetail saleDetail) {
        String sql = "UPDATE sale_details SET sale_id = ?, product_id = ?, quantity = ?, price = ? WHERE sale_detail_id = ?";
        try (Connection conn = database_koneksi.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, saleDetail.getSaleId());
            stmt.setInt(2, saleDetail.getProductId());
            stmt.setInt(3, saleDetail.getQuantity());
            stmt.setDouble(4, saleDetail.getPrice());
            stmt.setInt(5, saleDetail.getSaleDetailId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteSaleDetail(int saleDetailId) {
        String sql = "DELETE FROM sale_details WHERE sale_detail_id = ?";
        try (Connection conn = database_koneksi.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, saleDetailId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    
}
