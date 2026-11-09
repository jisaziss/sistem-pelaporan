package com.sistem.dao;

import com.sistem.model.BuktiLaporan;
import com.sistem.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BuktiLaporanDAO {
    public boolean createBukti(BuktiLaporan bukti) {
        String sql = "INSERT INTO bukti_laporan (laporan_id, jenis, file_path) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, bukti.getLaporanId());
            pstmt.setString(2, bukti.getJenis());
            pstmt.setString(3, bukti.getFilePath());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<BuktiLaporan> getBuktiByLaporanId(int laporanId) {
        List<BuktiLaporan> list = new ArrayList<>();
        String sql = "SELECT id, laporan_id, jenis, file_path, created_at FROM bukti_laporan WHERE laporan_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, laporanId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                BuktiLaporan b = new BuktiLaporan();
                b.setId(rs.getInt("id"));
                b.setLaporanId(rs.getInt("laporan_id"));
                b.setJenis(rs.getString("jenis"));
                b.setFilePath(rs.getString("file_path"));
                b.setCreatedAt(rs.getTimestamp("created_at"));
                list.add(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
