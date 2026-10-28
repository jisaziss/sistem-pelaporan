<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sistem Pelaporan Perundungan & Kekerasan Seksual</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="navbar">
        <div class="container">
            <div class="navbar-brand">PPKS - Pelaporan & Tindak Lanjut</div>
            <div class="navbar-menu">
                <a href="${pageContext.request.contextPath}/" class="nav-link">Beranda</a>
                <a href="${pageContext.request.contextPath}/login" class="nav-link nav-btn">Masuk</a>
                <a href="${pageContext.request.contextPath}/register" class="nav-link nav-btn nav-btn-primary">Daftar</a>
            </div>
        </div>
    </div>

    <div class="hero">
        <div class="container">
            <h1>Sistem Pelaporan Perundungan & Kekerasan Seksual</h1>
            <p>Platform aman untuk melaporkan kasus perundungan dan kekerasan seksual.</p>
            <div class="hero-buttons">
                <a href="${pageContext.request.contextPath}/login" class="btn btn-primary">Masuk</a>
                <a href="${pageContext.request.contextPath}/register" class="btn btn-secondary">Daftar Baru</a>
            </div>
        </div>
    </div>

    <div class="features">
        <div class="container">
            <h2>Fitur Utama</h2>
            <div class="feature-grid">
                <div class="feature-card">
                    <h3>Lapor Aman</h3>
                    <p>Buat laporan dengan opsi untuk menyembunyikan identitas Anda dari petugas.</p>
                </div>
                <div class="feature-card">
                    <h3>Pantau Status</h3>
                    <p>Lihat perkembangan laporan Anda dari Menunggu Verifikasi hingga Selesai.</p>
                </div>
                <div class="feature-card">
                    <h3>Komunikasi Langsung</h3>
                    <p>Kirim pesan dan tanya jawab dengan petugas yang menangani kasus Anda.</p>
                </div>
                <div class="feature-card">
                    <h3>Tindak Lanjut Tertulis</h3>
                    <p>Lihat catatan penanganan dan tindak lanjut dari petugas secara jelas.</p>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2026 Sistem Pelaporan PPKS. Semua hak dilindungi.</p>
    </footer>
</body>
</html>
