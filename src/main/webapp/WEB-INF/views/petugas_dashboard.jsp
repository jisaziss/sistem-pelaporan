<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.sistem.model.*, com.sistem.util.HtmlUtil, java.util.List" %>
<% User user = (User) session.getAttribute("user"); 
   Petugas petugas = (Petugas) user; %>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Dashboard Petugas - PPKS UNSOED</title>
    <jsp:include page="includes/head.jsp" />
</head>
<body class="bg-gray-50 min-h-screen">
    <jsp:include page="includes/navbar.jsp" />

    <main class="container mx-auto px-4 py-8">
        <header class="mb-8">
            <h1 class="text-3xl font-bold text-gray-900">Panel Kendali Petugas</h1>
            <p class="text-gray-600">Petugas: <%= HtmlUtil.escape(petugas.getNama()) %></p>
        </header>

        <section>
            <h2 class="text-2xl font-bold mb-6">Daftar Laporan Masuk</h2>
            <% List<Laporan> laporanList = (List<Laporan>) request.getAttribute("laporanList"); %>
            <% if (laporanList == null || laporanList.isEmpty()) { %>
                <div class="text-center py-16 bg-white rounded-2xl border border-dashed border-gray-300">
                    <p class="text-gray-500">Tidak ada laporan saat ini.</p>
                </div>
            <% } else { %>
                <div class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden">
                    <table class="w-full text-left">
                        <thead class="bg-gray-50 text-gray-600 uppercase text-xs font-bold tracking-wider">
                            <tr>
                                <th class="px-6 py-4">ID</th>
                                <th class="px-6 py-4">Judul</th>
                                <th class="px-6 py-4">Status</th>
                                <th class="px-6 py-4">Petugas</th>
                                <th class="px-6 py-4">Dibuat</th>
                                <th class="px-6 py-4 text-right">Aksi</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-100">
                            <% for (Laporan l : laporanList) { %>
                            <tr class="hover:bg-gray-50 transition">
                                <td class="px-6 py-4 font-bold text-gray-500">#<%= l.getId() %></td>
                                <td class="px-6 py-4 font-medium"><%= HtmlUtil.escape(l.getJudul()) %></td>
                                <td class="px-6 py-4">
                                    <span class="inline-block px-3 py-1 rounded-full text-xs font-bold
                                        <%= l.getStatus().equals("Selesai") ? "bg-green-100 text-green-700" : 
                                            l.getStatus().contains("Penanganan") ? "bg-blue-100 text-blue-700" : "bg-yellow-100 text-yellow-700" %>">
                                        <%= l.getStatusDisplay() %>
                                    </span>
                                </td>
                                <td class="px-6 py-4 text-gray-600">
                                    <%= l.getPetugasNama() != null ? HtmlUtil.escape(l.getPetugasNama()) : "<span class='text-red-500 font-semibold'>Belum Ada</span>" %>
                                </td>
                                <td class="px-6 py-4 text-gray-600"><%= l.getCreatedAt() %></td>
                                <td class="px-6 py-4 text-right">
                                    <a href="${pageContext.request.contextPath}/laporan/detail?id=<%= l.getId() %>" 
                                       class="bg-blue-50 text-blue-600 px-4 py-2 rounded-lg font-bold hover:bg-blue-100 transition">Detail</a>
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
