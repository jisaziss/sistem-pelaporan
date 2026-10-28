package com.sistem.dao;

import com.sistem.model.Pesan;
import com.sistem.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PesanDAO {
    public boolean createPesan(Pesan pesan) {
        String sql = "INSERT INTO pesan (laporan_id, pengirim_id, isi) VALUES (?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, pesan.getLaporanId());
            pstmt.setInt(2, pesan.getPengirimId());
            pstmt.setString(3, pesan.getIsi());
            
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Pesan> getPesanByLaporan(int laporanId) {
        List<Pesan> list = new ArrayList<>();
        String sql = "SELECT p.*, u.nama, u.role FROM pesan p " +
                     "LEFT JOIN users u ON p.pengirim_id = u.id " +
                     "WHERE p.laporan_id = ? ORDER BY p.created_at ASC";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, laporanId);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                Pesan pesan = new Pesan();
                pesan.setId(rs.getInt("id"));
                pesan.setLaporanId(rs.getInt("laporan_id"));
                pesan.setPengirimId(rs.getInt("pengirim_id"));
                pesan.setIsi(rs.getString("isi"));
                pesan.setCreatedAt(rs.getTimestamp("created_at"));
                pesan.setNamaPengirim(rs.getString("nama"));
                pesan.setRolePengirim(rs.getString("role"));
                list.add(pesan);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
