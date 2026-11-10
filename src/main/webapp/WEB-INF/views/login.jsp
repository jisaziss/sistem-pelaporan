<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.sistem.util.HtmlUtil" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Masuk - PPKS UNSOED</title>
    <jsp:include page="includes/head.jsp" />

    <style>
        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(16px); }
            to   { opacity: 1; transform: translateY(0); }
        }
        .anim-up { animation: fadeUp .7s ease both; }
        .delay-1 { animation-delay: .1s; }

        @media (prefers-reduced-motion: reduce) {
            .anim-up { animation: none; }
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
</head>
<body class="page-shell min-h-screen flex flex-col text-[#2F4A3E]">
    <jsp:include page="includes/navbar.jsp" />

    <main class="flex-grow flex items-center justify-center px-4 py-12">
        <div class="anim-up max-w-md w-full bg-white rounded-2xl p-8 border border-[#5E8C73]/25 shadow-[0_6px_20px_rgba(47,74,62,.07)] relative overflow-hidden">
            <div class="absolute left-0 top-0 w-full h-1.5 bg-gradient-to-r from-[#5E8C73] to-[#F6D365]"></div>

            <div class="text-center mb-8 pt-2">
                <h1 class="text-3xl font-extrabold leading-tight">
                    <span class="text-[#2F4A3E]">Selamat</span>
                    <span class="text-hijau-kuning">Datang</span>
                </h1>
                <div class="wave-line-section mx-auto my-4">
                    <div class="wave-line-bar"></div>
                </div>
                <p class="text-[#6B7F74]">Silakan masuk ke akun Anda</p>
            </div>

            <% if (request.getParameter("logout") != null) { %>
                <div class="mb-6 p-4 bg-[#DCEBE2] text-[#4F7A63] border border-[#5E8C73]/30 rounded-xl text-sm font-medium">
                    Anda berhasil keluar. Silakan login kembali.
                </div>
            <% } %>

            <% if (request.getParameter("registered") != null) { %>
                <div class="mb-6 p-4 bg-[#FFF9E3] text-[#2F4A3E] border border-[#F6D365] rounded-xl text-sm font-medium">
                    Pendaftaran berhasil! Silakan masuk dengan akun baru Anda.
                </div>
            <% } %>

            <% String error = (String) request.getAttribute("error"); %>
            <% if (error != null) { %>
                <div class="mb-6 p-4 bg-red-50 text-red-700 border border-red-200 rounded-xl text-sm font-medium">
                    <%= HtmlUtil.escape(error) %>
                </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/login" method="post" class="space-y-6">
                <div>
                    <label for="username" class="block text-sm font-bold text-[#2F4A3E] mb-2">Username</label>
                    <input type="text" id="username" name="username" required
                           class="w-full px-4 py-3 border border-[#C9DAD0] rounded-xl focus:ring-2 focus:ring-[#7FA892] focus:border-[#7FA892] transition outline-none">
                </div>

                <div>
                    <label for="password" class="block text-sm font-bold text-[#2F4A3E] mb-2">Kata Sandi</label>
                    <input type="password" id="password" name="password" required
                           class="w-full px-4 py-3 border border-[#C9DAD0] rounded-xl focus:ring-2 focus:ring-[#7FA892] focus:border-[#7FA892] transition outline-none">
                </div>

                <button type="submit"
                        class="w-full bg-[#5C7FA8] text-white py-3.5 rounded-xl font-bold text-base hover:bg-[#5E8C73] hover:-translate-y-0.5 transition shadow-[0_8px_18px_rgba(92,127,168,.28)]">
                    Masuk
                </button>
            </form>

            <div class="mt-8 pt-6 border-t border-[#5E8C73]/15 text-center">
                <p class="text-[#6B7F74]">Belum punya akun?</p>
                <a href="${pageContext.request.contextPath}/register"
                   class="text-[#5C7FA8] font-bold hover:text-[#5E8C73] hover:underline mt-1 inline-block transition">
                    Daftar sebagai Pelapor
                </a>
            </div>
        </div>
    </main>

    <footer class="bg-[#F7FAF8] text-[#2F4A3E] py-8 border-t-4 border-[#F6D365]">
        <div class="container mx-auto px-4 text-center">
            <p class="mb-2 font-bold">
                <span class="text-[#4F7A63]">Satuan Tugas</span> <span class="text-[#C99A1E]">PPKS UNSOED</span>
            </p>
            <p class="text-xs sm:text-sm text-[#6B7F74]">&copy; 2026 Universitas Jenderal Soedirman. Dibuat untuk Proyek PBO.</p>
        </div>
    </footer>
</body>
</html>