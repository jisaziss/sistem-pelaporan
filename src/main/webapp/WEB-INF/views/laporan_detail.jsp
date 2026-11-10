<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.sistem.model.*, java.util.List, com.sistem.util.HtmlUtil" %>
<% User user = (User) session.getAttribute("user");
   Laporan laporan = (Laporan) request.getAttribute("laporan");
   List<TindakLanjut> tindakLanjutList = (List<TindakLanjut>) request.getAttribute("tindakLanjutList");
   List<Pesan> pesanList = (List<Pesan>) request.getAttribute("pesanList");
   String namaPelaporDisplay = (String) request.getAttribute("namaPelaporDisplay");

   String status = laporan.getStatus() == null ? "" : laporan.getStatus().toUpperCase();
   String badge = status.equals("SELESAI") ? "bg-[#DCEBE2] text-[#4F7A63]"
                : status.contains("PENANGANAN") ? "bg-[#5C7FA8]/15 text-[#5C7FA8]"
                : "bg-[#FBE7A1] text-[#C99A1E]";

   String backUrl = request.getContextPath() + (user instanceof Petugas ? "/petugas/dashboard" : "/pelapor/dashboard");
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Detail Laporan - PPKS UNSOED</title>
    <jsp:include page="includes/head.jsp" />

    <style>
        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(16px); }
            to   { opacity: 1; transform: translateY(0); }
        }
        .anim-up { animation: fadeUp .7s ease both; }

        .js .reveal { opacity: 0; transform: translateY(18px);
                      transition: opacity .6s ease, transform .6s ease; }
        .js .reveal.show { opacity: 1; transform: none; }

        @media (prefers-reduced-motion: reduce) {
            .anim-up { animation: none; }
            .js .reveal { opacity: 1; transform: none; transition: none; }
        }

        /* Animasi Gelombang Garis Berjalan (Kiri ke Kanan) */
        /* Animasi Gelombang yang Lebih Tenang & Lembut */
        @keyframes waveLine {
            0% {
                transform: translateX(-100%);
                opacity: 0;
            }
            50% {
                opacity: 0.6; /* Dibuat tidak terlalu terang agar tidak mencolok */
            }
            100% {
                transform: translateX(100%);
                opacity: 0;
            }
        }

        .wave-line-container, .wave-line-hero, .wave-line-section {
            position: relative;
            height: 3px; /* Dibuat sedikit lebih tipis agar lebih minimalis */
            overflow: hidden;
            border-radius: 9999px;
            background-color: rgba(94, 140, 115, 0.08); /* Background jalur lebih samar */
        }

        /* Lebar container disesuaikan */
        .wave-line-hero { width: 100%; max-width: 36rem; margin: 0 auto; }
        .wave-line-section, .wave-line-container { width: 9rem; margin: 0 auto; } /* Untuk section judul */

        .wave-line-bar {
            position: absolute;
            top: 0;
            left: 0;
            width: 50%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(246, 211, 101, 0.7), rgba(94, 140, 115, 0.7), transparent);
            border-radius: 9999px;
            animation: waveLine 4s ease-in-out infinite; /* Durasi diperlambat menjadi 4 detik agar gerakannya lambat & menenangkan */
        }
    </style>
    <script>document.documentElement.classList.add('js');</script>
</head>
<body class="page-shell flex flex-col min-h-screen text-[#2F4A3E]">
    <jsp:include page="includes/navbar.jsp" />

    <main class="flex-grow container mx-auto px-4 py-10 max-w-4xl">

        <!-- Header -->
        <header class="anim-up mb-8">
            <h1 class="text-3xl md:text-4xl font-extrabold leading-tight">
                <span class="text-[#2F4A3E]">Detail Laporan</span>
                <span class="text-hijau-kuning">#<%= laporan.getId() %></span>
            </h1>
            <div class="wave-line-container my-4">
                <div class="wave-line-bar"></div>
            </div>
        </header>

        <!-- Ringkasan Laporan -->
        <div class="reveal card p-6 md:p-8 mb-6">
            <div class="grid sm:grid-cols-2 gap-5 text-sm">
                <div>
                    <span class="text-[#6B7F74]">Judul</span>
                    <strong class="block text-base text-[#2F4A3E]"><%= HtmlUtil.escape(laporan.getJudul()) %></strong>
                </div>
                <div>
                    <span class="text-[#6B7F74]">Kategori</span>
                    <strong class="block text-base text-[#4F7A63]"><%= HtmlUtil.escape(laporan.getKategori()) %></strong>
                </div>
                <div>
                    <span class="text-[#6B7F74]">Status</span>
                    <span class="mt-1 inline-block px-3 py-1 rounded-full text-xs font-bold <%= badge %>">
                        <%= laporan.getStatusDisplay() %>
                    </span>
                </div>
                <div>
                    <span class="text-[#6B7F74]">Dibuat</span>
                    <strong class="block text-base text-[#2F4A3E]"><%= laporan.getCreatedAt() %></strong>
                </div>
            </div>

            <div class="border-t border-[#5E8C73]/15 pt-5 mt-6">
                <h2 class="text-lg font-bold mb-3">
                    <span class="text-[#2F4A3E]">Identitas</span>
                    <span class="text-[#C99A1E]">Pelapor</span>
                </h2>
                <div class="grid sm:grid-cols-2 gap-5 text-sm">
                    <div>
                        <span class="text-[#6B7F74]">Nama</span>
                        <strong class="block text-base text-[#2F4A3E]"><%= HtmlUtil.escape(namaPelaporDisplay) %></strong>
                    </div>
                    <div>
                        <span class="text-[#6B7F74]">Dikirim Anonim</span>
                        <span class="mt-1 inline-block px-3 py-1 rounded-full text-xs font-bold
                            <%= laporan.isSembunyikanIdentitas() ? "bg-[#FBE7A1] text-[#C99A1E]" : "bg-[#DCEBE2] text-[#4F7A63]" %>">
                            <%= laporan.isSembunyikanIdentitas() ? "Ya" : "Tidak" %>
                        </span>
                    </div>
                </div>
            </div>

            <% if (laporan.getLokasi() != null && !laporan.getLokasi().isEmpty() ||
                   laporan.getTanggalKejadian() != null && !laporan.getTanggalKejadian().isEmpty()) { %>
            <div class="border-t border-[#5E8C73]/15 pt-5 mt-6">
                <div class="grid sm:grid-cols-2 gap-5 text-sm">
                    <% if (laporan.getLokasi() != null && !laporan.getLokasi().isEmpty()) { %>
                    <div>
                        <span class="text-[#6B7F74]">Lokasi</span>
                        <strong class="block text-base text-[#2F4A3E]"><%= HtmlUtil.escape(laporan.getLokasi()) %></strong>
                    </div>
                    <% } %>
                    <% if (laporan.getTanggalKejadian() != null && !laporan.getTanggalKejadian().isEmpty()) { %>
                    <div>
                        <span class="text-[#6B7F74]">Tanggal Kejadian</span>
                        <strong class="block text-base text-[#2F4A3E]"><%= HtmlUtil.escape(laporan.getTanggalKejadian()) %></strong>
                    </div>
                    <% } %>
                </div>
            </div>
            <% } %>

            <div class="border-t border-[#5E8C73]/15 pt-5 mt-6">
                <h2 class="text-lg font-bold mb-3">
                    <span class="text-[#2F4A3E]">Kronologi</span>
                    <span class="text-[#C99A1E]">Kejadian</span>
                </h2>
                <div class="bg-[#F7FAF8] border border-[#5E8C73]/15 rounded-xl p-4 text-sm text-[#4F6B5D] leading-relaxed whitespace-pre-wrap"><%= HtmlUtil.escape(laporan.getKronologi()) %></div>
            </div>

            <% if (laporan.getBuktiList() != null && !laporan.getBuktiList().isEmpty()) { %>
            <div class="border-t border-[#5E8C73]/15 pt-5 mt-6">
                <h2 class="text-lg font-bold mb-3">
                    <span class="text-[#2F4A3E]">Bukti</span>
                    <span class="text-[#C99A1E]">Laporan</span>
                </h2>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <% for (BuktiLaporan bukti : laporan.getBuktiList()) { %>
                    <div class="rounded-xl border border-[#5E8C73]/25 overflow-hidden bg-white">
                        <% if ("FOTO".equals(bukti.getJenis())) { %>
                            <img src="${pageContext.request.contextPath}/bukti/<%= bukti.getFilePath() %>"
                                 alt="Bukti Foto" class="w-full h-48 object-cover">
                        <% } else if ("VIDEO".equals(bukti.getJenis())) { %>
                            <video controls class="w-full h-48 bg-black">
                                <source src="${pageContext.request.contextPath}/bukti/<%= bukti.getFilePath() %>" type="video/mp4">
                            </video>
                        <% } %>
                        <div class="p-2 bg-[#F7FAF8] text-center text-xs font-semibold text-[#6B7F74] uppercase tracking-wider">
                            <%= bukti.getJenis() %>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
            <% } %>
        </div>

        <!-- Petugas Penanggung Jawab -->
        <% if (laporan.getPetugasId() != null && laporan.getPetugasId() != 0) { %>
        <div class="reveal flex items-center gap-4 bg-[#DCEBE2]/50 border border-[#5E8C73]/25 rounded-2xl p-5 mb-6">
            <div class="w-12 h-12 bg-white text-[#4F7A63] rounded-xl flex items-center justify-center flex-shrink-0">
                <svg class="w-7 h-7" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"/></svg>
            </div>
            <div>
                <p class="text-xs font-bold uppercase tracking-wider text-[#4F7A63]">Petugas Penanggung Jawab</p>
                <p class="text-lg font-bold text-[#2F4A3E]"><%= HtmlUtil.escape(laporan.getPetugasNama()) %></p>
            </div>
        </div>
        <% } %>

        <!-- Aksi Petugas: Verifikasi -->
        <% if (user instanceof Petugas && laporan.getPetugasId() == null) { %>
        <div class="reveal card p-6 md:p-8 mb-6">
            <h2 class="text-lg font-bold mb-4">
                <span class="text-[#2F4A3E]">Aksi</span>
                <span class="text-[#C99A1E]">Petugas</span>
            </h2>
            <form method="post" action="${pageContext.request.contextPath}/petugas/laporan/aksi">
                <input type="hidden" name="id" value="<%= laporan.getId() %>">
                <input type="hidden" name="aksi" value="verifikasi">
                <button type="submit" class="btn-primary px-6 py-3 rounded-xl font-bold">
                    Verifikasi &amp; Terima Laporan
                </button>
            </form>
        </div>
        <% } %>

        <!-- Aksi Petugas: Update Status & Tindak Lanjut -->
        <% if (user instanceof Petugas && laporan.getPetugasId() != null && laporan.getPetugasId() == ((Petugas) user).getId()) { %>
        <div class="reveal card p-6 md:p-8 mb-6">
            <h2 class="text-lg font-bold mb-5">
                <span class="text-[#2F4A3E]">Pembaruan Status</span>
                <span class="text-[#C99A1E]">&amp; Tindak Lanjut</span>
            </h2>

            <form method="post" action="${pageContext.request.contextPath}/petugas/laporan/aksi" class="space-y-4 mb-6 pb-6 border-b border-[#5E8C73]/15">
                <input type="hidden" name="id" value="<%= laporan.getId() %>">
                <input type="hidden" name="aksi" value="update_status">

                <div>
                    <label class="block text-sm font-bold text-[#2F4A3E] mb-2">Ubah Status</label>
                    <select name="status" class="w-full px-4 py-3 border border-[#C9DAD0] rounded-xl focus:ring-2 focus:ring-[#7FA892] focus:border-[#7FA892] transition outline-none">
                        <option value="MENUNGGU_VERIFIKASI" <%= "MENUNGGU_VERIFIKASI".equals(laporan.getStatus()) ? "selected" : "" %>>Menunggu Verifikasi</option>
                        <option value="PERLU_INFORMASI" <%= "PERLU_INFORMASI".equals(laporan.getStatus()) ? "selected" : "" %>>Perlu Informasi</option>
                        <option value="DALAM_PENANGANAN" <%= "DALAM_PENANGANAN".equals(laporan.getStatus()) ? "selected" : "" %>>Dalam Penanganan</option>
                        <option value="SELESAI" <%= "SELESAI".equals(laporan.getStatus()) ? "selected" : "" %>>Selesai</option>
                    </select>
                </div>

                <button type="submit" class="btn-primary px-6 py-3 rounded-xl font-bold">
                    Perbarui Status
                </button>
            </form>

            <form method="post" action="${pageContext.request.contextPath}/petugas/laporan/aksi" class="space-y-4">
                <input type="hidden" name="id" value="<%= laporan.getId() %>">
                <input type="hidden" name="aksi" value="tambah_tindak_lanjut">

                <div>
                    <label class="block text-sm font-bold text-[#2F4A3E] mb-2">Catatan Tindak Lanjut</label>
                    <textarea name="catatan" rows="4" placeholder="Tulis catatan tindak lanjut..."
                              class="w-full px-4 py-3 border border-[#C9DAD0] rounded-xl focus:ring-2 focus:ring-[#7FA892] focus:border-[#7FA892] transition outline-none"></textarea>
                </div>

                <button type="submit" class="btn-primary px-6 py-3 rounded-xl font-bold">
                    Simpan Catatan
                </button>
            </form>
        </div>
        <% } %>

        <!-- Riwayat Tindak Lanjut -->
        <% if (tindakLanjutList != null && !tindakLanjutList.isEmpty()) { %>
        <div class="reveal card p-6 md:p-8 mb-6">
            <h2 class="text-lg font-bold mb-5">
                <span class="text-[#2F4A3E]">Riwayat</span>
                <span class="text-[#C99A1E]">Tindak Lanjut</span>
            </h2>
            <div class="space-y-4">
                <% for (TindakLanjut tl : tindakLanjutList) { %>
                <div class="border-l-4 border-[#F6D365] bg-[#F7FAF8] rounded-r-xl pl-4 pr-4 py-3">
                    <div class="flex flex-wrap justify-between items-start gap-1 mb-2">
                        <strong class="text-[#4F7A63]"><%= tl.getNamaPetugas() != null ? HtmlUtil.escape(tl.getNamaPetugas()) : "Petugas" %></strong>
                        <span class="text-[#6B7F74] text-xs"><%= tl.getCreatedAt() %></span>
                    </div>
                    <p class="text-[#4F6B5D] text-sm whitespace-pre-wrap"><%= HtmlUtil.escape(tl.getCatatan()) %></p>
                </div>
                <% } %>
            </div>
        </div>
        <% } %>

        <!-- Chat -->
        <div class="reveal card p-6 md:p-8">
            <h2 class="text-lg font-bold mb-5">
                <span class="text-[#2F4A3E]">Pesan</span>
                <span class="text-[#C99A1E]">&amp; Chat</span>
            </h2>

            <% if (pesanList == null || pesanList.isEmpty()) { %>
                <div class="text-center py-8 mb-6 bg-[#F7FAF8] border border-dashed border-[#5E8C73]/30 rounded-xl text-[#6B7F74] text-sm">
                    Belum ada pesan.
                </div>
            <% } else { %>
            <div class="space-y-4 mb-6">
                <% for (Pesan p : pesanList) {
                    boolean dariPelapor = "PELAPOR".equals(p.getRolePengirim());
                %>
                <div class="flex items-start gap-3 <%= dariPelapor ? "flex-row" : "flex-row-reverse" %>">
                    <div class="w-10 h-10 rounded-full flex items-center justify-center flex-shrink-0
                        <%= dariPelapor ? "bg-[#DCEBE2] text-[#4F7A63]" : "bg-[#5C7FA8]/15 text-[#5C7FA8]" %>">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/></svg>
                    </div>
                    <div class="flex-grow max-w-[85%]">
                        <div class="<%= dariPelapor ? "bg-[#F7FAF8] border-[#5E8C73]/20 rounded-r-xl rounded-bl-xl" : "bg-[#5C7FA8]/10 border-[#5C7FA8]/20 rounded-l-xl rounded-br-xl" %> border p-3 text-sm">
                            <div class="flex justify-between gap-3 mb-1">
                                <strong class="<%= dariPelapor ? "text-[#4F7A63]" : "text-[#5C7FA8]" %>"><%= HtmlUtil.escape(p.getNamaPengirim()) %></strong>
                                <span class="text-[#6B7F74] text-xs"><%= p.getCreatedAt() %></span>
                            </div>
                            <p class="text-[#4F6B5D] whitespace-pre-wrap"><%= HtmlUtil.escape(p.getIsi()) %></p>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
            <% } %>

            <form method="post" action="${pageContext.request.contextPath}/laporan/chat" class="space-y-3">
                <input type="hidden" name="id" value="<%= laporan.getId() %>">
                <textarea name="isi" rows="3" placeholder="Tulis pesan..."
                          class="w-full px-4 py-3 border border-[#C9DAD0] rounded-xl focus:ring-2 focus:ring-[#7FA892] focus:border-[#7FA892] transition outline-none"></textarea>
                <button type="submit" class="btn-primary px-6 py-3 rounded-xl font-bold">
                    Kirim Pesan
                </button>
            </form>
        </div>

        <div class="mt-8 text-center">
            <a href="<%= backUrl %>" class="text-[#5C7FA8] font-bold hover:text-[#5E8C73] hover:underline transition">
                &larr; Kembali ke Dashboard
            </a>
        </div>
    </main>

    <footer class="bg-[#F7FAF8] text-[#2F4A3E] py-10 md:py-12 border-t-4 border-[#F6D365]">
        <div class="container mx-auto px-4 text-center">
            <p class="mb-3 font-bold text-base md:text-lg">
                <span class="text-[#4F7A63]">Satuan Tugas</span> <span class="text-[#C99A1E]">PPKS UNSOED</span>
            </p>
            <p class="text-xs sm:text-sm text-[#6B7F74]">&copy; 2026 Universitas Jenderal Soedirman. Dibuat untuk Proyek PBO.</p>
        </div>
    </footer>

    <script>
        (function () {
            var els = document.querySelectorAll('.reveal');
            if (!('IntersectionObserver' in window)) {
                els.forEach(function (e) { e.classList.add('show'); });
                return;
            }
            var io = new IntersectionObserver(function (entries) {
                entries.forEach(function (en) {
                    if (en.isIntersecting) { en.target.classList.add('show'); io.unobserve(en.target); }
                });
            }, { threshold: 0.15 });
            els.forEach(function (e) { io.observe(e); });
        })();
    </script>
</body>
</html>