<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.sistem.model.*, com.sistem.util.HtmlUtil, java.util.List" %>
<% 
User user = (User) session.getAttribute("user"); 
Pelapor pelapor = (Pelapor) user;
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Dashboard Pelapor - PPKS UNSOED</title>
    <jsp:include page="includes/head.jsp" />
</head>
<body class="bg-gradient-to-br from-gray-950 via-gray-900 to-gray-950 min-h-screen">
    <jsp:include page="includes/navbar.jsp" />

    <main class="container mx-auto px-4 py-8">
        <header class="mb-8">
            <h1 class="text-3xl font-bold text-white">Dashboard</h1>
            <p class="text-gray-400">Halo, <span class="text-[#FFDF16] font-semibold"><%= HtmlUtil.escape(pelapor.getNama()) %></span>. Selamat datang kembali.</p>
        </header>

        <section class="glass-card mb-8 flex flex-col md:flex-row items-start md:items-center justify-between gap-4 border-t-2 border-[#FFAA16]/50">
            <div>
                <h2 class="text-xl font-bold text-[#FFDF16] mb-2">Ingin membuat laporan baru?</h2>
                <p class="text-gray-400">Gunakan tombol berikut untuk memulai proses pelaporan secara aman.</p>
            </div>
            <a href="${pageContext.request.contextPath}/pelapor/laporan/baru" 
               class="bg-gradient-to-r from-[#FF5516] to-[#FFAA16] text-white px-6 py-3 rounded-xl font-bold hover:shadow-lg hover:shadow-[#FF5516]/50 transition-all duration-300 whitespace-nowrap">
                + Buat Laporan Baru
            </a>
        </section>

        <section>
            <h2 class="text-2xl font-bold mb-6 text-white">Laporan Saya</h2>
            <% List<Laporan> laporanList = (List<Laporan>) request.getAttribute("laporanList"); %>
            <% if (laporanList == null || laporanList.isEmpty()) { %>
                <div class="text-center py-16 glass-card border border-dashed border-gray-700">
                    <svg class="w-16 h-16 mx-auto text-gray-600 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M9 12h6m-6 4h6M9 8h.01M15 8h.01M5 21h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v14a2 2 0 002 2z"/></svg>
                    <p class="text-gray-400">Anda belum memiliki laporan.</p>
                </div>
            <% } else { %>
                <div class="glass-card overflow-hidden p-0">
                    <table class="w-full text-left">
                        <thead class="bg-gray-800/60 text-[#FFAA16] uppercase text-xs tracking-wider">
                            <tr>
                                <th class="px-6 py-4">Judul</th>
                                <th class="px-6 py-4">Status</th>
                                <th class="px-6 py-4">Dibuat</th>
                                <th class="px-6 py-4 text-right">Aksi</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-800 text-gray-300">
                            <% for (Laporan l : laporanList) { %>
                            <tr class="hover:bg-gray-800/40 transition">
                                <td class="px-6 py-4 font-semibold text-white"><%= HtmlUtil.escape(l.getJudul()) %></td>
                                <td class="px-6 py-4">
                                    <span class="badge
                                        <%= l.getStatus().equals("Selesai") ? "bg-[#A5FF16]/20 text-[#A5FF16] border border-[#A5FF16]/40" : 
                                            l.getStatus().contains("Penanganan") ? "bg-[#FF5516]/20 text-[#FF5516] border border-[#FF5516]/40" : "bg-[#FFDF16]/20 text-[#FFDF16] border border-[#FFDF16]/40" %>">
                                        <%= l.getStatusDisplay() %>
                                    </span>
                                </td>
                                <td class="px-6 py-4 text-gray-400"><%= l.getCreatedAt() %></td>
                                <td class="px-6 py-4 text-right">
                                    <a href="${pageContext.request.contextPath}/laporan/detail?id=<%= l.getId() %>" 
                                       class="text-[#FFAA16] font-bold hover:text-[#FFDF16] transition">Detail →</a>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            <% } %>
        </section>
    </main>
</body>
</html>
