<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.sistem.util.HtmlUtil" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Masuk - PPKS UNSOED</title>
    <jsp:include page="includes/head.jsp" />
</head>
<body class="bg-gradient-to-br from-[#FFF9DD] via-white to-[#FFEFC2] min-h-screen flex flex-col">
    <jsp:include page="includes/navbar.jsp" />

    <main class="flex-grow flex items-center justify-center px-4 py-12">
        <div class="max-w-md w-full bg-white rounded-2xl shadow-xl p-8 border-t-4 border-[#FFDF16]">
            <div class="text-center mb-8">
                <h1 class="text-3xl font-bold text-[#FF5516]">Selamat Datang</h1>
                <p class="text-gray-500 mt-2">Silakan masuk ke akun Anda</p>
            </div>

            <% if (request.getParameter("logout") != null) { %>
                <div class="mb-6 p-4 bg-[#A5FF16]/30 text-green-800 border border-[#A5FF16] rounded-lg text-sm">
                    Anda berhasil keluar. Silakan login kembali.
                </div>
            <% } %>

            <% if (request.getParameter("registered") != null) { %>
                <div class="mb-6 p-4 bg-[#FFDF16]/40 text-[#7a4a00] border border-[#FFAA16] rounded-lg text-sm">
                    Pendaftaran berhasil! Silakan masuk dengan akun baru Anda.
                </div>
            <% } %>

            <% String error = (String) request.getAttribute("error"); %>
            <% if (error != null) { %>
                <div class="mb-6 p-4 bg-[#FF5516]/10 text-[#FF5516] border border-[#FF5516] rounded-lg text-sm font-medium">
                    <%= HtmlUtil.escape(error) %>
                </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/login" method="post" class="space-y-6">
                <div>
                    <label for="username" class="block text-sm font-semibold text-gray-700 mb-2">Username</label>
                    <input type="text" id="username" name="username" required
                           class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-[#FFAA16] focus:border-[#FFAA16] transition outline-none">
                </div>

                <div>
                    <label for="password" class="block text-sm font-semibold text-gray-700 mb-2">Kata Sandi</label>
                    <input type="password" id="password" name="password" required
                           class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-[#FFAA16] focus:border-[#FFAA16] transition outline-none">
                </div>

                <button type="submit" class="w-full bg-[#FF5516] text-white py-3 rounded-xl font-bold hover:bg-[#e04812] transition shadow-lg">
                    Masuk
                </button>
            </form>

            <div class="mt-8 pt-6 border-t border-gray-100 text-center">
                <p class="text-gray-600">Belum punya akun?</p>
                <a href="${pageContext.request.contextPath}/register" class="text-[#FF5516] font-bold hover:underline mt-1 inline-block">
                    Daftar sebagai Pelapor
                </a>
            </div>
        </div>
    </main>

    <footer class="py-8 text-center text-gray-500 text-sm">
        &copy; 2026 PPKS UNSOED
    </footer>
</body>
</html>
