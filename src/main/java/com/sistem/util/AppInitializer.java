package com.sistem.util;

import com.sistem.dao.UserDAO;
import com.sistem.model.Petugas;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebListener
public class AppInitializer implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Aplikasi dimulai. Memeriksa data petugas...");
        seedPetugasIfEmpty();
    }

    private void seedPetugasIfEmpty() {
        String checkSql = "SELECT id FROM users WHERE role = 'PETUGAS' LIMIT 1";
        String insertSql = "INSERT INTO users (username, password_hash, nama, role, nim_nip, unit_prodi) VALUES (?, ?, ?, 'PETUGAS', ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement checkStmt = conn.prepareStatement(checkSql);
             ResultSet rs = checkStmt.executeQuery()) {
            
            if (!rs.next()) {
                System.out.println("Tabel petugas kosong. Melakukan seeding...");
                try (PreparedStatement insertStmt = conn.prepareStatement(insertSql)) {
                    insertStmt.setString(1, "petugas");
                    insertStmt.setString(2, PasswordUtil.hashPassword("Petugas123!"));
                    insertStmt.setString(3, "Budi Petugas");
                    insertStmt.setString(4, "19800101");
                    insertStmt.setString(5, "Satgas PPKS");
                    insertStmt.executeUpdate();
                    System.out.println("Petugas default berhasil dibuat: petugas / Petugas123!");
                }
            } else {
                System.out.println("Data petugas sudah ada.");
            }
        } catch (SQLException e) {
            System.err.println("Gagal seeding petugas: " + e.getMessage());
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
