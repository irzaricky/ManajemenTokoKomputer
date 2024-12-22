package com.toko.komputer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.toko.komputer.model.Sale;
import com.toko.komputer.util.database_koneksi;

public class SaleDAO {
    public List<Sale> getAllSales() {
        List<Sale> sales = new ArrayList<>();
        String sql = "SELECT * FROM sales";
        try (Connection conn = database_koneksi.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Sale sale = new Sale();
                sale.setSaleId(rs.getInt("sale_id"));
                sale.setSaleDate(rs.getTimestamp("sale_date"));
                sale.setTotalAmount(rs.getDouble("total_amount"));
                sale.setUserId(rs.getInt("user_id"));
                sales.add(sale);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sales;
    }

    public Sale getSaleById(int saleId) {
        Sale sale = null;
        String sql = "SELECT * FROM sales WHERE sale_id = ?";
        try (Connection conn = database_koneksi.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, saleId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    sale = new Sale();
                    sale.setSaleId(rs.getInt("sale_id"));
                    sale.setSaleDate(rs.getTimestamp("sale_date"));
                    sale.setTotalAmount(rs.getDouble("total_amount"));
                    sale.setUserId(rs.getInt("user_id"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sale;
    }

    public void addSale(Connection conn, Sale sale) throws SQLException {
        String sql = "INSERT INTO sales (sale_date, total_amount, user_id) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setTimestamp(1, sale.getSaleDate());
            stmt.setDouble(2, sale.getTotalAmount());
            stmt.setInt(3, sale.getUserId());
            stmt.executeUpdate();

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    sale.setSaleId(generatedKeys.getInt(1));
                }
            }
        }
    }

    public int getLastInsertedSaleId(Connection conn) throws SQLException {
        String sql = "SELECT LAST_INSERT_ID()";
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return -1;
    }

    public void updateSale(Sale sale) {
        String sql = "UPDATE sales SET sale_date = ?, total_amount = ?, user_id = ? WHERE sale_id = ?";
        try (Connection conn = database_koneksi.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setTimestamp(1, sale.getSaleDate());
            stmt.setDouble(2, sale.getTotalAmount());
            stmt.setInt(3, sale.getUserId());
            stmt.setInt(4, sale.getSaleId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteSale(int saleId) {
        String sql = "DELETE FROM sales WHERE sale_id = ?";
        try (Connection conn = database_koneksi.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, saleId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
