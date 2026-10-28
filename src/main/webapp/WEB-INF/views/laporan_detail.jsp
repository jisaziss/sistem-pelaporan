<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.sistem.model.*, java.util.List" %>
<% User user = (User) session.getAttribute("user"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Detail Laporan</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="navbar">
        <div class="container">
            <div class="navbar-brand">PPKS</div>
            <div class="navbar-menu">
                <%
                    if (user instanceof Pelapor) {
                %>
                <a href="${pageContext.request.contextPath}/pelapor/dashboard" class="nav-link">Dashboard</a>
                <%
                    } else if (user instanceof Petugas) {
                %>
                <a href="${pageContext.request.contextPath}/petugas/dashboard" class="nav-link">Dashboard</a>
                <%
                    }
                %>
                <a href="${pageContext.request.contextPath}/logout" class="nav-link nav-btn">Keluar</a>
            </div>
        </div>
    </div>

    <div class="container form-container">
        <div class="form-wrapper">
<%@ page import="com.sistem.model.*, com.sistem.util.HtmlUtil" %>
<% Laporan laporan = (Laporan) request.getAttribute("laporan"); %>
<% String namaPelaporDisplay = (String) request.getAttribute("namaPelaporDisplay"); %>
            <h1>Detail Laporan #<%= laporan.getId() %></h1>
            
            <div class="laporan-meta">
                <span class="meta-item">Judul: <strong><%= HtmlUtil.escape(laporan.getJudul()) %></strong></span>
                <span class="meta-item">Kategori: <strong><%= HtmlUtil.escape(laporan.getKategori()) %></strong></span>
                <span class="meta-item">
                    Status: 
                    <span class="badge badge-<%= laporan.getStatus().toLowerCase() %>">
                        <%= laporan.getStatusDisplay() %>
                    </span>
                </span>
                <span class="meta-item">
                    Dibuat: <strong><%= laporan.getCreatedAt() %></strong>
                </span>
            </div>

            <div class="section">
                <h2>Identitas Pelapor</h2>
                <p><strong>Nama:</strong> <%= HtmlUtil.escape(namaPelaporDisplay) %></p>
                <%
                    if (laporan.getLokasi() != null && !laporan.getLokasi().isEmpty()) {
                %>
                <p><strong>Lokasi:</strong> <%= HtmlUtil.escape(laporan.getLokasi()) %></p>
                <%
                    }
                %>
                <%
                    if (laporan.getTanggalKejadian() != null && !laporan.getTanggalKejadian().isEmpty()) {
                %>
                <p><strong>Tanggal Kejadian:</strong> <%= HtmlUtil.escape(laporan.getTanggalKejadian()) %></p>
                <%
                    }
                %>
                <p><strong>Identitas Disembunyikan dari Petugas:</strong> <%= laporan.isSembunyikanIdentitas() ? "Ya" : "Tidak" %></p>
            </div>

            <div class="section">
                <h2>Kronologi Kejadian</h2>
                <div class="text-content">
                    <p><%= HtmlUtil.escape(laporan.getKronologi()) %></p>
                </div>
            </div>

            <% if (laporan.getPetugasId() != null && laporan.getPetugasId() != 0) { %>
            <div class="section">
                <h2>Petugas Penanggung Jawab</h2>
                <p><strong><%= HtmlUtil.escape(laporan.getPetugasNama()) %></strong></p>
            </div>
            <% } %>

            <% if (user instanceof Petugas && laporan.getPetugasId() == null) { %>
            <div class="section action-box">
                <h2>Aksi Petugas</h2>
                <form method="post" action="${pageContext.request.contextPath}/petugas/laporan/aksi">
                    <input type="hidden" name="id" value="<%= laporan.getId() %>">
                    <input type="hidden" name="aksi" value="verifikasi">
                    <button type="submit" class="btn btn-sm btn-primary">Verifikasi & Terima Laporan</button>
                </form>
            </div>
            <% } %>

            <% if (user instanceof Petugas && laporan.getPetugasId() != null && laporan.getPetugasId() == ((Petugas) user).getId()) { %>
            <div class="section action-box">
                <h2>Pembaruan Status & Tindak Lanjut</h2>
                
                <form method="post" action="${pageContext.request.contextPath}/petugas/laporan/aksi">
                    <input type="hidden" name="id" value="<%= laporan.getId() %>">
                    <input type="hidden" name="aksi" value="update_status">
                    
                    <div class="form-group">
                        <label for="status">Ubah Status</label>
                        <select id="status" name="status">
                            <option value="MENUNGGU_VERIFIKASI" <%= "MENUNGGU_VERIFIKASI".equals(laporan.getStatus()) ? "selected" : "" %>>Menunggu Verifikasi</option>
                            <option value="PERLU_INFORMASI" <%= "PERLU_INFORMASI".equals(laporan.getStatus()) ? "selected" : "" %>>Perlu Informasi</option>
                            <option value="DALAM_PENANGANAN" <%= "DALAM_PENANGANAN".equals(laporan.getStatus()) ? "selected" : "" %>>Dalam Penanganan</option>
                            <option value="SELESAI" <%= "SELESAI".equals(laporan.getStatus()) ? "selected" : "" %>>Selesai</option>
                        </select>
                    </div>
                    
                    <button type="submit" class="btn btn-sm btn-secondary">Perbarui Status</button>
                </form>
            </div>

            <div class="section action-box">
                <h2>Catatan Tindak Lanjut</h2>
                <form method="post" action="${pageContext.request.contextPath}/petugas/laporan/aksi">
                    <input type="hidden" name="id" value="<%= laporan.getId() %>">
                    <input type="hidden" name="aksi" value="tambah_tindak_lanjut">
                    
                    <div class="form-group">
                        <textarea id="catatan" name="catatan" rows="4" placeholder="Tulis catatan tindak lanjut..."></textarea>
                    </div>
                    
                    <button type="submit" class="btn btn-sm btn-secondary">Simpan Catatan</button>
                </form>
            </div>
            <% } %>

            <%-- Tindak Lanjut List --%>
            <% List<TindakLanjut> tindakLanjutList = (List<TindakLanjut>) request.getAttribute("tindakLanjutList"); %>
            <% if (tindakLanjutList != null && !tindakLanjutList.isEmpty()) { %>
            <div class="section">
                <h2>Catatan Tindak Lanjut</h2>
                <div class="tindak-lanjut-list">
                    <% for (TindakLanjut tl : tindakLanjutList) { %>
                    <div class="tindak-lanjut-item">
                        <div class="tl-header">
                            <strong><%= tl.getNamaPetugas() != null ? HtmlUtil.escape(tl.getNamaPetugas()) : "Petugas" %></strong>
                            <span><%= tl.getCreatedAt() %></span>
                        </div>
                        <p><%= HtmlUtil.escape(tl.getCatatan()) %></p>
                    </div>
                    <% } %>
                </div>
            </div>
            <% } %>

            <%-- Chat Section --%>
            <div class="section action-box">
                <h2>Pesan & Chat</h2>
                <% List<Pesan> pesanList = (List<Pesan>) request.getAttribute("pesanList"); %>
                
                <% if (pesanList == null || pesanList.isEmpty()) { %>
                    <p class="empty-state">Belum ada pesan.</p>
                <% } else { %>
                <div class="chat-container">
                    <% for (Pesan p : pesanList) { %>
                    <div class="chat-message <%= "PELAPOR".equals(p.getRolePengirim()) ? "chat-pelapor" : "chat-petugas" %>">
                        <div class="chat-meta">
                            <strong><%= HtmlUtil.escape(p.getNamaPengirim()) %></strong>
                            <span><%= p.getCreatedAt() %></span>
                        </div>
                        <p><%= HtmlUtil.escape(p.getIsi()) %></p>
                    </div>
                    <% } %>
                </div>
                <% } %>

                <form method="post" action="${pageContext.request.contextPath}/laporan/chat">
                    <input type="hidden" name="id" value="<%= laporan.getId() %>">
                    <div class="form-group">
                        <textarea id="isi" name="isi" rows="3" placeholder="Tulis pesan..."></textarea>
                    </div>
                    <button type="submit" class="btn btn-sm btn-secondary">Kirim Pesan</button>
                </form>
            </div>

            <div class="form-actions">
                <a href="<%
                    if (user instanceof Pelapor) {
                %>${pageContext.request.contextPath}/pelapor/dashboard<%
                    } else if (user instanceof Petugas) {
                %>${pageContext.request.contextPath}/petugas/dashboard<%
                    }
                %>" class="btn btn-secondary">Kembali ke Dashboard</a>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2026 Sistem Pelaporan PPKS.</p>
    </footer>
</body>
</html>
