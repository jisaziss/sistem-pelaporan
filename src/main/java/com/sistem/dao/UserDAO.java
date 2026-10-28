package com.sistem.dao;

import com.sistem.model.*;
import com.sistem.util.DBConnection;
import com.sistem.util.PasswordUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    public LoginResult authenticate(String username, String password) {
        String sql = "SELECT id, username, password_hash, nama, role, nim_nip, unit_prodi FROM users WHERE username = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                String storedHash = rs.getString("password_hash");
                if (PasswordUtil.checkPassword(password, storedHash)) {
                    User user;
                    String role = rs.getString("role");
                    
                    if ("PELAPOR".equals(role)) {
                        user = new Pelapor(
                            rs.getInt("id"),
                            rs.getString("username"),
                            rs.getString("nama"),
                            rs.getString("nim_nip"),
                            rs.getString("unit_prodi")
                        );
                    } else if ("PETUGAS".equals(role)) {
                        user = new Petugas(
                            rs.getInt("id"),
                            rs.getString("username"),
                            rs.getString("nama"),
                            rs.getString("nim_nip"),
                            rs.getString("unit_prodi")
                        );
                    } else {
                        return new LoginResult(false, "Role tidak valid");
                    }
                    
                    return new LoginResult(true, "Login berhasil", user);
                } else {
                    return new LoginResult(false, "Password salah");
                }
            } else {
                return new LoginResult(false, "Username tidak ditemukan");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return new LoginResult(false, "Terjadi kesalahan pada sistem");
        }
    }

    public boolean registerPelapor(String username, String password, String nama, String nim, String prodi) {
        String checkSql = "SELECT id FROM users WHERE username = ?";
        String insertSql = "INSERT INTO users (username, password_hash, nama, role, nim_nip, unit_prodi) VALUES (?, ?, ?, 'PELAPOR', ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement checkStmt = conn.prepareStatement(checkSql);
             PreparedStatement insertStmt = conn.prepareStatement(insertSql)) {
            
            // Cek username sudah ada
            checkStmt.setString(1, username);
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next()) {
                return false;
            }
            
            // Insert user baru
            String hash = PasswordUtil.hashPassword(password);
            insertStmt.setString(1, username);
            insertStmt.setString(2, hash);
            insertStmt.setString(3, nama);
            insertStmt.setString(4, nim);
            insertStmt.setString(5, prodi);
            
            int affectedRows = insertStmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Petugas> getAllPetugas() {
        List<Petugas> list = new ArrayList<>();
        String sql = "SELECT id, username, nama, nim_nip, unit_prodi FROM users WHERE role = 'PETUGAS'";
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Petugas petugas = new Petugas(
                    rs.getInt("id"),
                    rs.getString("username"),
                    rs.getString("nama"),
                    rs.getString("nim_nip"),
                    rs.getString("unit_prodi")
                );
                list.add(petugas);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public User getUserById(int id) {
        String sql = "SELECT id, username, nama, role, nim_nip, unit_prodi FROM users WHERE id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                String role = rs.getString("role");
                if ("PELAPOR".equals(role)) {
                    return new Pelapor(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("nama"),
                        rs.getString("nim_nip"),
                        rs.getString("unit_prodi")
                    );
                } else if ("PETUGAS".equals(role)) {
                    return new Petugas(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("nama"),
                        rs.getString("nim_nip"),
                        rs.getString("unit_prodi")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
