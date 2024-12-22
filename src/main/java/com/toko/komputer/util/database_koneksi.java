package com.toko.komputer.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class database_koneksi {
	private static final String URL = "jdbc:mysql://localhost:3306/manajemen_toko_komputer";
	private static final String USER = "root";
	private static final String PASSWORD = "";

	public static Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (SQLException e) {
			System.out.println("Error while connecting: " + e.getMessage());
			e.printStackTrace();
			throw e;
		}
		return conn;
	}

	public static void main(String[] args) {
		try (Connection conn = getConnection()) {
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
