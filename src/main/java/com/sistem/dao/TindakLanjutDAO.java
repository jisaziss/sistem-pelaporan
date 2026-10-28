package com.sistem.dao;

import com.sistem.model.TindakLanjut;
import com.sistem.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TindakLanjutDAO {
    public boolean createTindakLanjut(TindakLanjut tindakLanjut) {
        String sql = "INSERT INTO tindak_lanjut (laporan_id, petugas_id, catatan) VALUES (?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, tindakLanjut.getLaporanId());
            pstmt.setInt(2, tindakLanjut.getPetugasId());
            pstmt.setString(3, tindakLanjut.getCatatan());
            
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<TindakLanjut> getTindakLanjutByLaporan(int laporanId) {
        List<TindakLanjut> list = new ArrayList<>();
        String sql = "SELECT t.*, u.nama FROM tindak_lanjut t " +
                     "LEFT JOIN users u ON t.petugas_id = u.id " +
                     "WHERE t.laporan_id = ? ORDER BY t.created_at DESC";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, laporanId);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                TindakLanjut tl = new TindakLanjut();
                tl.setId(rs.getInt("id"));
                tl.setLaporanId(rs.getInt("laporan_id"));
                tl.setPetugasId(rs.getInt("petugas_id"));
                tl.setCatatan(rs.getString("catatan"));
                tl.setCreatedAt(rs.getTimestamp("created_at"));
                tl.setNamaPetugas(rs.getString("nama"));
                list.add(tl);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
