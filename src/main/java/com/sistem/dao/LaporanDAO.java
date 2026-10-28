package com.sistem.dao;

import com.sistem.model.Laporan;
import com.sistem.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LaporanDAO {
    public boolean createLaporan(Laporan laporan) {
        String sql = "INSERT INTO laporan (pelapor_id, judul, kategori, kronologi, lokasi, tanggal_kejadian, sembunyikan_identitas, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            pstmt.setInt(1, laporan.getPelaporId());
            pstmt.setString(2, laporan.getJudul());
            pstmt.setString(3, laporan.getKategori());
            pstmt.setString(4, laporan.getKronologi());
            pstmt.setString(5, laporan.getLokasi());
            pstmt.setString(6, laporan.getTanggalKejadian());
            pstmt.setBoolean(7, laporan.isSembunyikanIdentitas());
            pstmt.setString(8, laporan.getStatus());
            
            int affectedRows = pstmt.executeUpdate();
            
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        laporan.setId(generatedKeys.getInt(1));
                    }
                }
            }
            
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private static final String BASE_SELECT =
        "SELECT l.*, u.nama AS pelapor_nama, p.nama AS petugas_nama FROM laporan l " +
        "JOIN users u ON l.pelapor_id = u.id " +
        "LEFT JOIN users p ON l.petugas_id = p.id ";

    public List<Laporan> getLaporanByPelapor(int pelaporId) {
        List<Laporan> list = new ArrayList<>();
        String sql = BASE_SELECT + "WHERE l.pelapor_id = ? ORDER BY l.created_at DESC";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, pelaporId);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                list.add(mapResultSetToLaporan(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /** Laporan yang belum ditugaskan ke petugas mana pun (antrean verifikasi). */
    public List<Laporan> getLaporanBelumDitugaskan() {
        List<Laporan> list = new ArrayList<>();
        String sql = BASE_SELECT + "WHERE l.petugas_id IS NULL ORDER BY l.created_at ASC";
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                list.add(mapResultSetToLaporan(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /** Laporan yang ditugaskan ke satu petugas tertentu. */
    public List<Laporan> getLaporanByPetugas(int petugasId) {
        List<Laporan> list = new ArrayList<>();
        String sql = BASE_SELECT + "WHERE l.petugas_id = ? ORDER BY l.updated_at DESC";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, petugasId);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                list.add(mapResultSetToLaporan(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Laporan getLaporanById(int id) {
        String sql = BASE_SELECT + "WHERE l.id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return mapResultSetToLaporan(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateStatus(int laporanId, String status, Integer petugasId) {
        String sql = "UPDATE laporan SET status = ?, petugas_id = ?, updated_at = CURRENT_TIMESTAMP WHERE id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, status);
            if (petugasId != null) {
                pstmt.setInt(2, petugasId);
            } else {
                pstmt.setNull(2, Types.INTEGER);
            }
            pstmt.setInt(3, laporanId);
            
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean assignPetugas(int laporanId, int petugasId) {
        String sql = "UPDATE laporan SET petugas_id = ?, updated_at = CURRENT_TIMESTAMP WHERE id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, petugasId);
            pstmt.setInt(2, laporanId);
            
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int countByStatus(String status) {
        String sql = "SELECT COUNT(*) FROM laporan WHERE status = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, status);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int countByPelapor(int pelaporId) {
        String sql = "SELECT COUNT(*) FROM laporan WHERE pelapor_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, pelaporId);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    private Laporan mapResultSetToLaporan(ResultSet rs) throws SQLException {
        Laporan laporan = new Laporan();
        laporan.setId(rs.getInt("id"));
        laporan.setPelaporId(rs.getInt("pelapor_id"));
        laporan.setJudul(rs.getString("judul"));
        laporan.setKategori(rs.getString("kategori"));
        laporan.setKronologi(rs.getString("kronologi"));
        laporan.setLokasi(rs.getString("lokasi"));
        laporan.setTanggalKejadian(rs.getString("tanggal_kejadian"));
        laporan.setSembunyikanIdentitas(rs.getBoolean("sembunyikan_identitas"));
        laporan.setStatus(rs.getString("status"));
        
        int petugasId = rs.getInt("petugas_id");
        if (!rs.wasNull()) {
            laporan.setPetugasId(petugasId);
        }
        
        laporan.setPelaporNama(rs.getString("pelapor_nama"));
        laporan.setPetugasNama(rs.getString("petugas_nama"));
        laporan.setCreatedAt(rs.getTimestamp("created_at"));
        laporan.setUpdatedAt(rs.getTimestamp("updated_at"));
        return laporan;
    }
}
