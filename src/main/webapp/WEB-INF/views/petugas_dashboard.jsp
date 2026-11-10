<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.sistem.model.*, com.sistem.util.HtmlUtil, java.util.List" %>
<% User user = (User) session.getAttribute("user"); 
   Petugas petugas = (Petugas) user;

   List<Laporan> laporanList = (List<Laporan>) request.getAttribute("laporanList");
   int total = 0, selesai = 0, diproses = 0, belumDiambil = 0;
   if (laporanList != null) {
       total = laporanList.size();
       for (Laporan x : laporanList) {
           String s = x.getStatus() == null ? "" : x.getStatus().toUpperCase();
           if (s.contains("SELESAI")) selesai++;
           else if (s.contains("PENANGANAN")) diproses++;
           if (x.getPetugasNama() == null) belumDiambil++;
       }
   }
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Dashboard Petugas - PPKS UNSOED</title>
    <jsp:include page="includes/head.jsp" />

    <style>
        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(16px); }
            to   { opacity: 1; transform: translateY(0); }
        }
        .anim-up { animation: fadeUp .7s ease both; }
        .delay-1 { animation-delay: .1s; }

        .js .reveal { opacity: 0; transform: translateY(18px);
                      transition: opacity .6s ease, transform .6s ease; }
        .js .reveal.show { opacity: 1; transform: none; }

        @media (prefers-reduced-motion: reduce) {
            .anim-up { animation: none; }
            .js .reveal { opacity: 1; transform: none; transition: none; }
        }

        /* Animasi Gelombang yang Lebih Tenang & Lembut */
        @keyframes waveLine {
            0% {
                transform: translateX(-100%);
                opacity: 0;
            }
            50% {
                opacity: 0.6;
            }
            100% {
                transform: translateX(100%);
                opacity: 0;
            }
        }

        .wave-line-container, .wave-line-hero, .wave-line-section {
            position: relative;
            height: 3px;
            overflow: hidden;
            border-radius: 9999px;
            background-color: rgba(94, 140, 115, 0.08);
        }

        .wave-line-hero { width: 100%; max-width: 36rem; margin: 0 auto; }

        /* Diatur rata kiri (tanpa margin auto agar sejajar dengan judul) */
        .wave-line-section, .wave-line-container { width: 14rem; }

        .wave-line-bar {
            position: absolute;
            top: 0;
            left: 0;
            width: 50%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(246, 211, 101, 0.7), rgba(94, 140, 115, 0.7), transparent);
            border-radius: 9999px;
            animation: waveLine 4s ease-in-out infinite;
        }
    </style>
    <script>document.documentElement.classList.add('js');</script>
</head>
<body class="page-shell flex flex-col min-h-screen text-[#2F4A3E]">
    <jsp:include page="includes/navbar.jsp" />

    <main class="flex-grow container mx-auto px-4 py-10 max-w-6xl">

        <!-- Header -->
        <header class="anim-up mb-8">
            <h1 class="text-3xl md:text-4xl font-extrabold leading-tight mb-3">
                <span class="text-[#2F4A3E]">Panel Kendali</span>
                <span class="text-hijau-kuning">Petugas</span>
            </h1>
            <!-- Garis rata kiri tepat di bawah judul -->
            <div class="wave-line-section mb-4">
                <div class="wave-line-bar"></div>
            </div>
            <p class="text-base md:text-lg text-[#4F6B5D] font-medium">
                Petugas: <span class="text-[#4F7A63] font-semibold"><%= HtmlUtil.escape(petugas.getNama()) %></span>
            </p>
        </header>

        <!-- Statistik -->
        <section class="grid grid-cols-2 lg:grid-cols-4 gap-4 md:gap-6 mb-12">
            <div class="reveal p-5 md:p-6 bg-white border border-[#5E8C73]/25 rounded-2xl shadow-[0_6px_20px_rgba(47,74,62,.07)] hover:shadow-lg hover:shadow-[#5C7FA8]/15 hover:-translate-y-1 transition duration-300">
                <div class="w-12 h-12 bg-[#DCEBE2] text-[#4F7A63] rounded-xl flex items-center justify-center mb-4">
                    <svg class="w-7 h-7" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"/></svg>
                </div>
                <p class="text-3xl font-extrabold text-[#4F7A63]"><%= total %></p>
                <p class="text-sm text-[#6B7F74] mt-1">Total Laporan Masuk</p>
            </div>

            <div class="reveal p-5 md:p-6 bg-white border border-[#F6D365]/70 rounded-2xl shadow-[0_6px_20px_rgba(47,74,62,.07)] hover:shadow-lg hover:shadow-[#5C7FA8]/15 hover:-translate-y-1 transition duration-300" style="transition-delay:.08s">
                <div class="w-12 h-12 bg-[#FBE7A1] text-[#2F4A3E] rounded-xl flex items-center justify-center mb-4">
                    <svg class="w-7 h-7" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
                </div>
                <p class="text-3xl font-extrabold text-[#C99A1E]"><%= belumDiambil %></p>
                <p class="text-sm text-[#6B7F74] mt-1">Belum Ada Petugas</p>
            </div>

            <div class="reveal p-5 md:p-6 bg-white border border-[#5E8C73]/25 rounded-2xl shadow-[0_6px_20px_rgba(47,74,62,.07)] hover:shadow-lg hover:shadow-[#5C7FA8]/15 hover:-translate-y-1 transition duration-300" style="transition-delay:.16s">
                <div class="w-12 h-12 bg-[#DCEBE2] text-[#4F7A63] rounded-xl flex items-center justify-center mb-4">
                    <svg class="w-7 h-7" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"/></svg>
                </div>
                <p class="text-3xl font-extrabold text-[#4F7A63]"><%= diproses %></p>
                <p class="text-sm text-[#6B7F74] mt-1">Dalam Penanganan</p>
            </div>

            <div class="reveal p-5 md:p-6 bg-white border border-[#F6D365]/70 rounded-2xl shadow-[0_6px_20px_rgba(47,74,62,.07)] hover:shadow-lg hover:shadow-[#5C7FA8]/15 hover:-translate-y-1 transition duration-300" style="transition-delay:.24s">
                <div class="w-12 h-12 bg-[#FBE7A1] text-[#2F4A3E] rounded-xl flex items-center justify-center mb-4">
                    <svg class="w-7 h-7" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
                </div>
                <p class="text-3xl font-extrabold text-[#C99A1E]"><%= selesai %></p>
                <p class="text-sm text-[#6B7F74] mt-1">Selesai</p>
            </div>
        </section>

        <!-- Daftar Laporan -->
        <section>
            <div class="reveal mb-6">
                <h2 class="text-2xl sm:text-3xl font-bold mb-3">
                    <span class="text-[#2F4A3E]">Daftar Laporan</span>
                    <span class="text-[#C99A1E]">Masuk</span>
                </h2>
                <div class="wave-line-section">
                    <div class="wave-line-bar"></div>
                </div>
            </div>

            <% if (laporanList == null || laporanList.isEmpty()) { %>
                <div class="reveal flex flex-col items-center text-center py-14 px-6 bg-white rounded-2xl border-2 border-dashed border-[#5E8C73]/40">
                    <div class="w-16 h-16 bg-[#DCEBE2] text-[#4F7A63] rounded-xl flex items-center justify-center mb-5">
                        <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/></svg>
                    </div>
                    <h3 class="text-lg sm:text-xl font-bold mb-2 text-[#4F7A63]">Belum Ada Laporan</h3>
                    <p class="text-sm sm:text-base text-[#6B7F74] max-w-md">Tidak ada laporan saat ini. Laporan baru dari pelapor akan muncul di sini.</p>
                </div>
            <% } else { %>
                <div class="reveal bg-white rounded-2xl shadow-[0_6px_20px_rgba(47,74,62,.07)] border border-[#5E8C73]/25 overflow-hidden">
                    <div class="overflow-x-auto">
                        <table class="w-full text-left">
                            <thead class="bg-[#DCEBE2]/60 text-[#4F7A63] uppercase text-xs font-bold tracking-wider">
                                <tr>
                                    <th class="px-6 py-4">ID</th>
                                    <th class="px-6 py-4">Judul</th>
                                    <th class="px-6 py-4">Status</th>
                                    <th class="px-6 py-4">Petugas</th>
                                    <th class="px-6 py-4">Dibuat</th>
                                    <th class="px-6 py-4 text-right">Aksi</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-[#5E8C73]/10">
                                <% for (Laporan l : laporanList) {
                                    String st = l.getStatus() == null ? "" : l.getStatus().toUpperCase();
                                    String badge = st.contains("SELESAI") ? "bg-[#DCEBE2] text-[#4F7A63]"
                                                 : st.contains("PENANGANAN") ? "bg-[#5C7FA8]/15 text-[#5C7FA8]"
                                                 : "bg-[#FBE7A1] text-[#C99A1E]";
                                %>
                                <tr class="hover:bg-[#F7FAF8] transition">
                                    <td class="px-6 py-4 font-bold text-[#6B7F74]">#<%= l.getId() %></td>
                                    <td class="px-6 py-4 font-semibold text-[#2F4A3E]"><%= HtmlUtil.escape(l.getJudul()) %></td>
                                    <td class="px-6 py-4">
                                        <span class="inline-block px-3 py-1 rounded-full text-xs font-bold <%= badge %>">
                                            <%= l.getStatusDisplay() %>
                                        </span>
                                    </td>
                                    <td class="px-6 py-4 text-[#4F6B5D]">
                                        <% if (l.getPetugasNama() != null) { %>
                                            <%= HtmlUtil.escape(l.getPetugasNama()) %>
                                        <% } else { %>
                                            <span class="inline-block px-3 py-1 rounded-full text-xs font-bold bg-[#FBE7A1] text-[#C99A1E]">Belum Ada</span>
                                        <% } %>
                                    </td>
                                    <td class="px-6 py-4 text-[#6B7F74]"><%= l.getCreatedAt() %></td>
                                    <td class="px-6 py-4 text-right">
                                        <a href="${pageContext.request.contextPath}/laporan/detail?id=<%= l.getId() %>"
                                           class="inline-block bg-[#DCEBE2] text-[#4F7A63] px-4 py-2 rounded-lg font-bold hover:bg-[#5C7FA8] hover:text-white transition">Detail</a>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            <% } %>
        </section>
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