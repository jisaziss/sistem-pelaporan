<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.sistem.model.*, com.sistem.util.HtmlUtil, java.util.List" %>
<% User user = (User) session.getAttribute("user"); %>
<% Pelapor pelapor = (Pelapor) user; %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard Pelapor</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="navbar">
        <div class="container">
            <div class="navbar-brand">PPKS</div>
            <div class="navbar-menu">
                <a href="${pageContext.request.contextPath}/pelapor/dashboard" class="nav-link">Dashboard</a>
                <span class="nav-text">Hai, <%= HtmlUtil.escape(pelapor.getNama()) %></span>
                <a href="${pageContext.request.contextPath}/logout" class="nav-link nav-btn">Keluar</a>
            </div>
        </div>
    </div>

    <div class="container dashboard-container">
        <h1>Dashboard Pelapor</h1>
        
        <div class="dashboard-actions">
            <a href="${pageContext.request.contextPath}/pelapor/laporan/baru" class="btn btn-primary">Buat Laporan Baru</a>
        </div>

        <h2>Laporan Saya</h2>
        
        <% List<Laporan> laporanList = (List<Laporan>) request.getAttribute("laporanList"); %>
        <% if (laporanList == null || laporanList.isEmpty()) { %>
            <p class="empty-state">Anda belum memiliki laporan. Klik tombol di atas untuk membuat laporan baru.</p>
        <% } else { %>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Judul</th>
                            <th>Kategori</th>
                            <th>Status</th>
                            <th>Tanggal Dibuat</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Laporan l : laporanList) { %>
                        <tr>
                            <td><%= HtmlUtil.escape(l.getJudul()) %></td>
                            <td><%= HtmlUtil.escape(l.getKategori()) %></td>
                            <td><span class="badge badge-<%= l.getStatus().toLowerCase() %>"><%= l.getStatusDisplay() %></span></td>
                            <td><%= l.getCreatedAt() %></td>
                            <td>
                                <a href="${pageContext.request.contextPath}/laporan/detail?id=<%= l.getId() %>" class="btn btn-sm">Detail</a>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        <% } %>
    </div>

    <footer>
        <p>&copy; 2026 Sistem Pelaporan PPKS.</p>
    </footer>
</body>
</html>
