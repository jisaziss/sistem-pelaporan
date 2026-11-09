<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.sistem.util.HtmlUtil" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Masuk - PPKS UNSOED</title>
    <jsp:include page="includes/head.jsp" />
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">
    <jsp:include page="includes/navbar.jsp" />

    <main class="flex-grow flex items-center justify-center px-4 py-12">
        <div class="max-w-md w-full bg-white rounded-2xl shadow-xl p-8">
            <div class="text-center mb-8">
                <h1 class="text-3xl font-bold text-gray-900">Selamat Datang</h1>
                <p class="text-gray-500 mt-2">Silakan masuk ke akun Anda</p>
            </div>

            <% if (request.getParameter("logout") != null) { %>
                <div class="mb-6 p-4 bg-green-50 text-green-700 border border-green-200 rounded-lg text-sm">
                    Anda berhasil keluar. Silakan login kembali.
                </div>
            <% } %>

            <% if (request.getParameter("registered") != null) { %>
                <div class="mb-6 p-4 bg-blue-50 text-blue-700 border border-blue-200 rounded-lg text-sm">
                    Pendaftaran berhasil! Silakan masuk dengan akun baru Anda.
                </div>
            <% } %>

            <% String error = (String) request.getAttribute("error"); %>
            <% if (error != null) { %>
                <div class="mb-6 p-4 bg-red-50 text-red-700 border border-red-200 rounded-lg text-sm font-medium">
                    <%= HtmlUtil.escape(error) %>
                </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/login" method="post" class="space-y-6">
                <div>
                    <label for="username" class="block text-sm font-semibold text-gray-700 mb-2">Username</label>
                    <input type="text" id="username" name="username" required 
                           class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition outline-none">
                </div>

                <div>
                    <label for="password" class="block text-sm font-semibold text-gray-700 mb-2">Kata Sandi</label>
                    <input type="password" id="password" name="password" required
                           class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition outline-none">
                </div>

                <button type="submit" class="w-full bg-blue-600 text-white py-3 rounded-xl font-bold hover:bg-blue-700 transition shadow-lg">
                    Masuk
                </button>
            </form>

            <div class="mt-8 pt-6 border-t border-gray-100 text-center">
                <p class="text-gray-600">Belum punya akun?</p>
                <a href="${pageContext.request.contextPath}/register" class="text-blue-600 font-bold hover:underline mt-1 inline-block">
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
