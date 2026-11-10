<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.sistem.util.HtmlUtil" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Daftar - PPKS UNSOED</title>
    <jsp:include page="includes/head.jsp" />
</head>
<body class="page-shell min-h-screen flex flex-col">
    <jsp:include page="includes/navbar.jsp" />

    <main class="flex-grow flex items-center justify-center px-4 py-12">
        <div class="max-w-md w-full bg-white rounded-2xl shadow-xl p-8 border-t-4 border-[#B88A32]">
            <div class="text-center mb-8">
                <h1 class="text-3xl font-bold text-[#174F38]">Daftar Akun Pelapor</h1>
                <p class="text-gray-500 mt-2">Buat akun untuk mulai membuat laporan secara aman</p>
            </div>

            <% String error = (String) request.getAttribute("error"); %>
            <% if (error != null) { %>
                <div class="mb-6 p-4 bg-[#174F38]/10 text-[#174F38] border border-[#174F38] rounded-lg text-sm font-medium">
                    <%= HtmlUtil.escape(error) %>
                </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/register" method="post" class="space-y-6">
                <div>
                    <label for="nama" class="block text-sm font-semibold text-gray-700 mb-2">Nama Lengkap</label>
                    <input type="text" id="nama" name="nama" required
                           class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-[#B88A32] focus:border-[#B88A32] transition outline-none">
                </div>

                <div>
                    <label for="nim" class="block text-sm font-semibold text-gray-700 mb-2">NIM / NIP (Opsional)</label>
                    <input type="text" id="nim" name="nim"
                           class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-[#B88A32] focus:border-[#B88A32] transition outline-none">
                </div>

                <div>
                    <label for="username" class="block text-sm font-semibold text-gray-700 mb-2">Username</label>
                    <input type="text" id="username" name="username" required
                           class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-[#B88A32] focus:border-[#B88A32] transition outline-none">
                </div>

                <div>
                    <label for="password" class="block text-sm font-semibold text-gray-700 mb-2">Kata Sandi</label>
                    <input type="password" id="password" name="password" required
                           class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-[#B88A32] focus:border-[#B88A32] transition outline-none">
                </div>

                <button type="submit" class="w-full bg-[#174F38] text-white py-3 rounded-xl font-bold hover:bg-[#123D2C] transition shadow-lg">
                    Daftar Sekarang
                </button>
            </form>

            <div class="mt-8 pt-6 border-t border-gray-100 text-center">
                <p class="text-gray-600">Sudah punya akun?</p>
                <a href="${pageContext.request.contextPath}/login" class="text-[#174F38] font-bold hover:underline mt-1 inline-block">
                    Masuk di sini
                </a>
            </div>
        </div>
    </main>

    <footer class="py-8 text-center text-gray-500 text-sm">
        &copy; 2026 PPKS UNSOED
    </footer>
</body>
</html>
