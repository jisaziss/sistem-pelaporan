<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.sistem.util.HtmlUtil" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Daftar - PPKS UNSOED</title>
    <jsp:include page="includes/head.jsp" />
</head>
<body class="bg-gradient-to-br from-gray-950 via-gray-900 to-gray-950 min-h-screen flex flex-col">
    <jsp:include page="includes/navbar.jsp" />

    <main class="flex-grow flex items-center justify-center px-4 py-12">
        <div class="max-w-md w-full glass-card relative overflow-hidden">
            <div class="absolute top-0 left-0 w-full h-1 bg-gradient-to-r from-[#FFDF16] via-[#FFAA16] to-[#FF5516]"></div>
            
            <div class="text-center mb-8 relative z-10">
                <h1 class="text-3xl font-bold text-white mb-2">Daftar Akun Pelapor</h1>
                <p class="text-gray-400">Buat akun untuk mulai membuat laporan secara aman</p>
            </div>

            <% String error = (String) request.getAttribute("error"); %>
            <% if (error != null) { %>
                <div class="mb-6 p-4 bg-[#FF5516]/20 text-[#FF5516] border border-[#FF5516]/50 rounded-xl text-sm font-medium">
                    <%= HtmlUtil.escape(error) %>
                </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/register" method="post" class="space-y-6 relative z-10">
                <div>
                    <label for="nama" class="block text-sm font-semibold text-gray-300 mb-2">Nama Lengkap</label>
                    <input type="text" id="nama" name="nama" required
                           class="w-full px-4 py-3 bg-gray-800/50 border border-gray-700 rounded-xl focus:ring-2 focus:ring-[#FFAA16]/50 focus:border-[#FFAA16] transition outline-none text-white placeholder-gray-500">
                </div>

                <div>
                    <label for="nim" class="block text-sm font-semibold text-gray-300 mb-2">NIM / NIP (Opsional)</label>
                    <input type="text" id="nim" name="nim"
                           class="w-full px-4 py-3 bg-gray-800/50 border border-gray-700 rounded-xl focus:ring-2 focus:ring-[#FFAA16]/50 focus:border-[#FFAA16] transition outline-none text-white placeholder-gray-500">
                </div>

                <div>
                    <label for="username" class="block text-sm font-semibold text-gray-300 mb-2">Username</label>
                    <input type="text" id="username" name="username" required
                           class="w-full px-4 py-3 bg-gray-800/50 border border-gray-700 rounded-xl focus:ring-2 focus:ring-[#FFAA16]/50 focus:border-[#FFAA16] transition outline-none text-white placeholder-gray-500">
                </div>

                <div>
                    <label for="password" class="block text-sm font-semibold text-gray-300 mb-2">Kata Sandi</label>
                    <input type="password" id="password" name="password" required
                           class="w-full px-4 py-3 bg-gray-800/50 border border-gray-700 rounded-xl focus:ring-2 focus:ring-[#FFAA16]/50 focus:border-[#FFAA16] transition outline-none text-white placeholder-gray-500">
                </div>

                <button type="submit" class="w-full bg-gradient-to-r from-[#FF5516] to-[#FFAA16] text-white py-3 rounded-xl font-bold hover:shadow-lg hover:shadow-[#FF5516]/50 transition-all duration-300">
                    Daftar Sekarang
                </button>
            </form>

            <div class="mt-8 pt-6 border-t border-gray-800 text-center relative z-10">
                <p class="text-gray-400">Sudah punya akun?</p>
                <a href="${pageContext.request.contextPath}/login" class="text-[#FFAA16] font-bold hover:text-[#FFDF16] transition mt-1 inline-block">
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
