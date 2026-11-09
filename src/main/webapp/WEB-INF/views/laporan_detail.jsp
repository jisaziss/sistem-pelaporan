<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.sistem.model.*, java.util.List, com.sistem.util.HtmlUtil" %>
<% User user = (User) session.getAttribute("user"); 
   Laporan laporan = (Laporan) request.getAttribute("laporan");
   List<TindakLanjut> tindakLanjutList = (List<TindakLanjut>) request.getAttribute("tindakLanjutList");
   List<Pesan> pesanList = (List<Pesan>) request.getAttribute("pesanList");
   String namaPelaporDisplay = (String) request.getAttribute("namaPelaporDisplay"); %>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Detail Laporan - PPKS UNSOED</title>
    <jsp:include page="includes/head.jsp" />
</head>
<body class="bg-gray-50 min-h-screen">
    <jsp:include page="includes/navbar.jsp" />

    <main class="container mx-auto px-4 py-8 max-w-4xl">
        <header class="mb-6 flex items-center justify-between">
            <h1 class="text-3xl font-bold text-gray-900">Detail Laporan #<%= laporan.getId() %></h1>
        </header>

        <!-- Laporan Summary Card -->
        <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 mb-6">
            <div class="flex flex-wrap gap-4 mb-6 text-sm">
                <div class="flex items-center">
                    <span class="w-24 text-gray-600">Judul:</span>
                    <strong class="text-gray-900"><%= HtmlUtil.escape(laporan.getJudul()) %></strong>
                </div>
                <div class="flex items-center">
                    <span class="w-24 text-gray-600">Kategori:</span>
                    <strong class="text-blue-700"><%= HtmlUtil.escape(laporan.getKategori()) %></strong>
                </div>
                <div class="flex items-center">
                    <span class="w-24 text-gray-600">Status:</span>
                    <span class="px-3 py-1 rounded-full text-xs font-bold
                        <%= laporan.getStatus().equals("SELESAI") ? "bg-green-100 text-green-700" : 
                            laporan.getStatus().contains("PENANGANAN") ? "bg-blue-100 text-blue-700" : "bg-yellow-100 text-yellow-700" %>">
                        <%= laporan.getStatusDisplay() %>
                    </span>
                </div>
                <div class="flex items-center">
                    <span class="w-24 text-gray-600">Dibuat:</span>
                    <strong class="text-gray-900"><%= laporan.getCreatedAt() %></strong>
                </div>
            </div>

            <div class="border-t border-gray-200 pt-4">
                <h2 class="text-lg font-bold text-gray-900 mb-3">Identitas Pelapor</h2>
                <div class="grid md:grid-cols-2 gap-4 text-sm">
                    <div>
                        <span class="text-gray-500">Nama:</span>
                        <strong class="block text-gray-900"><%= HtmlUtil.escape(namaPelaporDisplay) %></strong>
                    </div>
                    <div>
                        <span class="text-gray-500">Dikirim Anonim:</span>
                        <span class="<%= laporan.isSembunyikanIdentitas() ? "text-red-600 font-bold" : "text-gray-900" %>">
                            <%= laporan.isSembunyikanIdentitas() ? "Ya" : "Tidak" %>
                        </span>
                    </div>
                </div>
            </div>

            <% if (laporan.getLokasi() != null && !laporan.getLokasi().isEmpty() || 
                   laporan.getTanggalKejadian() != null && !laporan.getTanggalKejadian().isEmpty()) { %>
            <div class="border-t border-gray-200 pt-4 mt-4">
                <div class="grid md:grid-cols-2 gap-4 text-sm">
                    <% if (laporan.getLokasi() != null && !laporan.getLokasi().isEmpty()) { %>
                    <div>
                        <span class="text-gray-500">Lokasi:</span>
                        <strong class="block text-gray-900"><%= HtmlUtil.escape(laporan.getLokasi()) %></strong>
                    </div>
                    <% } %>
                    <% if (laporan.getTanggalKejadian() != null && !laporan.getTanggalKejadian().isEmpty()) { %>
                    <div>
                        <span class="text-gray-500">Tanggal Kejadian:</span>
                        <strong class="block text-gray-900"><%= HtmlUtil.escape(laporan.getTanggalKejadian()) %></strong>
                    </div>
                    <% } %>
                </div>
            </div>
            <% } %>

            <div class="border-t border-gray-200 pt-4 mt-4">
                <h2 class="text-lg font-bold text-gray-900 mb-3">Kronologi Kejadian</h2>
                <div class="bg-gray-50 rounded-xl p-4 text-sm text-gray-700 whitespace-pre-wrap">
                    <%= HtmlUtil.escape(laporan.getKronologi()) %>
                </div>
            </div>

            <% if (laporan.getBuktiList() != null && !laporan.getBuktiList().isEmpty()) { %>
            <div class="border-t border-gray-200 pt-4 mt-4">
                <h2 class="text-lg font-bold text-gray-900 mb-3">Bukti Laporan (Foto/Video)</h2>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <% for (BuktiLaporan bukti : laporan.getBuktiList()) { %>
                    <div class="rounded-xl border border-gray-200 overflow-hidden">
                        <% if ("FOTO".equals(bukti.getJenis())) { %>
                            <img src="${pageContext.request.contextPath}/bukti/<%= bukti.getFilePath() %>" 
                                 alt="Bukti Foto" class="w-full h-48 object-cover">
                        <% } else if ("VIDEO".equals(bukti.getJenis())) { %>
                            <video controls class="w-full h-48 bg-black">
                                <source src="${pageContext.request.contextPath}/bukti/<%= bukti.getFilePath() %>" type="video/mp4">
                            </video>
                        <% } %>
                        <div class="p-3 bg-gray-50 text-center text-xs text-gray-600">
                            <%= bukti.getJenis() %>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
            <% } %>
        </div>

        <% if (laporan.getPetugasId() != null && laporan.getPetugasId() != 0) { %>
        <div class="bg-blue-50 rounded-2xl border border-blue-100 p-6 mb-6">
            <h2 class="text-lg font-bold text-blue-900 mb-2">Petugas Penanggung Jawab</h2>
            <p class="text-blue-700"><strong><%= HtmlUtil.escape(laporan.getPetugasNama()) %></strong></p>
        </div>
        <% } %>

        <!-- Petugas Actions -->
        <% if (user instanceof Petugas && laporan.getPetugasId() == null) { %>
        <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 mb-6">
            <h2 class="text-lg font-bold text-gray-900 mb-4">Aksi Petugas</h2>
            <form method="post" action="${pageContext.request.contextPath}/petugas/laporan/aksi" class="flex gap-4">
                <input type="hidden" name="id" value="<%= laporan.getId() %>">
                <input type="hidden" name="aksi" value="verifikasi">
                <button type="submit" class="bg-green-600 text-white px-6 py-3 rounded-xl font-bold hover:bg-green-700 transition shadow-lg">
                    Verifikasi & Terima Laporan
                </button>
            </form>
        </div>
        <% } %>

        <!-- Petugas Update Actions -->
        <% if (user instanceof Petugas && laporan.getPetugasId() != null && laporan.getPetugasId() == ((Petugas) user).getId()) { %>
        <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 mb-6">
            <h2 class="text-lg font-bold text-gray-900 mb-4">Pembaruan Status & Tindak Lanjut</h2>
            
            <form method="post" action="${pageContext.request.contextPath}/petugas/laporan/aksi" class="space-y-4 mb-6">
                <input type="hidden" name="id" value="<%= laporan.getId() %>">
                <input type="hidden" name="aksi" value="update_status">
                
                <div>
                    <label class="block text-sm font-bold text-gray-700 mb-2">Ubah Status</label>
                    <select name="status" class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition outline-none">
                        <option value="MENUNGGU_VERIFIKASI" <%= "MENUNGGU_VERIFIKASI".equals(laporan.getStatus()) ? "selected" : "" %>>Menunggu Verifikasi</option>
                        <option value="PERLU_INFORMASI" <%= "PERLU_INFORMASI".equals(laporan.getStatus()) ? "selected" : "" %>>Perlu Informasi</option>
                        <option value="DALAM_PENANGANAN" <%= "DALAM_PENANGANAN".equals(laporan.getStatus()) ? "selected" : "" %>>Dalam Penanganan</option>
                        <option value="SELESAI" <%= "SELESAI".equals(laporan.getStatus()) ? "selected" : "" %>>Selesai</option>
                    </select>
                </div>
                
                <button type="submit" class="bg-blue-600 text-white px-6 py-3 rounded-xl font-bold hover:bg-blue-700 transition shadow-lg">
                    Perbarui Status
                </button>
            </form>

            <form method="post" action="${pageContext.request.contextPath}/petugas/laporan/aksi">
                <input type="hidden" name="id" value="<%= laporan.getId() %>">
                <input type="hidden" name="aksi" value="tambah_tindak_lanjut">
                
                <div>
                    <label class="block text-sm font-bold text-gray-700 mb-2">Catatan Tindak Lanjut</label>
                    <textarea name="catatan" rows="4" placeholder="Tulis catatan tindak lanjut..."
                              class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition outline-none"></textarea>
                </div>
                
                <button type="submit" class="bg-blue-600 text-white px-6 py-3 rounded-xl font-bold hover:bg-blue-700 transition shadow-lg mt-4">
                    Simpan Catatan
                </button>
            </form>
        </div>
        <% } %>

        <!-- Tindak Lanjut List -->
        <% if (tindakLanjutList != null && !tindakLanjutList.isEmpty()) { %>
        <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 mb-6">
            <h2 class="text-lg font-bold text-gray-900 mb-4">Riwayat Tindak Lanjut</h2>
            <div class="space-y-4">
                <% for (TindakLanjut tl : tindakLanjutList) { %>
                <div class="border-l-4 border-blue-500 pl-4 py-2">
                    <div class="flex justify-between items-start mb-2">
                        <strong class="text-gray-900"><%= tl.getNamaPetugas() != null ? HtmlUtil.escape(tl.getNamaPetugas()) : "Petugas" %></strong>
                        <span class="text-gray-500 text-sm"><%= tl.getCreatedAt() %></span>
                    </div>
                    <p class="text-gray-700 text-sm whitespace-pre-wrap"><%= HtmlUtil.escape(tl.getCatatan()) %></p>
                </div>
                <% } %>
            </div>
        </div>
        <% } %>

        <!-- Chat Section -->
        <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6">
            <h2 class="text-lg font-bold text-gray-900 mb-4">Pesan & Chat</h2>
            
            <% if (pesanList == null || pesanList.isEmpty()) { %>
                <div class="text-center py-8 text-gray-500">Belum ada pesan.</div>
            <% } else { %>
            <div class="space-y-4 mb-6">
                <% for (Pesan p : pesanList) { %>
                <div class="flex items-start gap-3 <%= "PELAPOR".equals(p.getRolePengirim()) ? "flex-row" : "flex-row-reverse" %>">
                    <div class="w-10 h-10 rounded-full flex items-center justify-center flex-shrink-0
                        <%= "PELAPOR".equals(p.getRolePengirim()) ? "bg-blue-100 text-blue-700" : "bg-green-100 text-green-700" %>">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/></svg>
                    </div>
                    <div class="flex-grow">
                        <div class="bg-gray-50 <%= "PELAPOR".equals(p.getRolePengirim()) ? "rounded-r-xl" : "rounded-l-xl" %> p-3 text-sm">
                            <div class="flex justify-between mb-1">
                                <strong class="text-gray-900"><%= HtmlUtil.escape(p.getNamaPengirim()) %></strong>
                                <span class="text-gray-500"><%= p.getCreatedAt() %></span>
                            </div>
                            <p class="text-gray-700"><%= HtmlUtil.escape(p.getIsi()) %></p>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
            <% } %>

            <form method="post" action="${pageContext.request.contextPath}/laporan/chat">
                <input type="hidden" name="id" value="<%= laporan.getId() %>">
                <textarea name="isi" rows="3" placeholder="Tulis pesan..."
                          class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition outline-none mb-3"></textarea>
                <button type="submit" class="bg-blue-600 text-white px-6 py-3 rounded-xl font-bold hover:bg-blue-700 transition shadow-lg">
                    Kirim Pesan
                </button>
            </form>
        </div>

        <div class="mt-8 text-center">
            <a href="<%
                if (user instanceof Pelapor) {
            %> ${pageContext.request.contextPath}/pelapor/dashboard <%
                } else if (user instanceof Petugas) {
            %> ${pageContext.request.contextPath}/petugas/dashboard <%
                }
            %>" class="text-blue-600 font-bold hover:underline">
                ← Kembali ke Dashboard
            </a>
        </div>
    </main>
</body>
</html>
