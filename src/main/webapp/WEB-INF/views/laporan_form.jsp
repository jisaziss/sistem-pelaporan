<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.sistem.model.*" %>
<% User user = (User) session.getAttribute("user"); %>
<% Pelapor pelapor = (Pelapor) user; %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Buat Laporan Baru</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="navbar">
        <div class="container">
            <div class="navbar-brand">PPKS</div>
            <div class="navbar-menu">
                <a href="${pageContext.request.contextPath}/pelapor/dashboard" class="nav-link">Dashboard</a>
                <span class="nav-text">Hai, <%= pelapor.getNama() %></span>
                <a href="${pageContext.request.contextPath}/logout" class="nav-link nav-btn">Keluar</a>
            </div>
        </div>
    </div>

    <div class="container form-container">
        <div class="form-wrapper form-wide">
            <h1>Buat Laporan Baru</h1>

            <form method="post" action="${pageContext.request.contextPath}/pelapor/laporan/baru">
                <div class="form-group">
                    <label for="judul">Judul Laporan</label>
                    <input type="text" id="judul" name="judul" required>
                </div>

                <div class="form-group">
                    <label for="kategori">Kategori</label>
                    <select id="kategori" name="kategori" required>
                        <option value="">Pilih kategori</option>
                        <option value="Perundungan Verbal">Perundungan Verbal</option>
                        <option value="Perundungan Fisik">Perundungan Fisik</option>
                        <option value="Perundungan Sosial">Perundungan Sosial</option>
                        <option value="Perundungan Siber">Perundungan Siber</option>
                        <option value="Kekerasan Seksual Verbal">Kekerasan Seksual Verbal</option>
                        <option value="Kekerasan Seksual Fisik">Kekerasan Seksual Fisik</option>
                        <option value="Pelecehan Seksual">Pelecehan Seksual</option>
                        <option value="Lainnya">Lainnya</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="lokasi">Lokasi Kejadian</label>
                    <input type="text" id="lokasi" name="lokasi" placeholder="Opsional">
                </div>

                <div class="form-group">
                    <label for="tanggal_kejadian">Tanggal Kejadian</label>
                    <input type="date" id="tanggal_kejadian" name="tanggal_kejadian">
                </div>

                <div class="form-group">
                    <label for="kronologi">Kronologi / Deskripsi Kejadian</label>
                    <textarea id="kronologi" name="kronologi" rows="8" required></textarea>
                </div>

                <div class="form-group-checkbox">
                    <input type="checkbox" id="sembunyikan_identitas" name="sembunyikan_identitas">
                    <label for="sembunyikan_identitas">Sembunyikan identitas saya dari petugas yang menangani</label>
                </div>

                <div class="form-actions">
                    <a href="${pageContext.request.contextPath}/pelapor/dashboard" class="btn btn-secondary">Batal</a>
                    <button type="submit" class="btn btn-primary">Kirim Laporan</button>
                </div>
            </form>
        </div>
    </div>

    <footer>
        <p>&copy; 2026 Sistem Pelaporan PPKS.</p>
    </footer>
</body>
</html>
