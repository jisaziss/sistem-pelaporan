<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Sistem Pelaporan PPKS UNSOED</title>
    <jsp:include page="includes/head.jsp" />
</head>
<body class="bg-gray-50 flex flex-col min-h-screen">
    <jsp:include page="includes/navbar.jsp" />

    <!-- Hero Section -->
    <main class="flex-grow">
        <section class="bg-blue-600 text-white py-20 px-4">
            <div class="container mx-auto text-center max-w-4xl">
                <h1 class="text-4xl md:text-6xl font-extrabold mb-6">Sistem Pelaporan PPKS</h1>
                <p class="text-xl md:text-2xl text-blue-100 mb-10 leading-relaxed">
                    Platform aman, rahasia, dan terpercaya untuk melaporkan kasus kekerasan seksual di lingkungan Universitas Jenderal Soedirman.
                </p>
                <div class="flex flex-col sm:flex-row justify-center gap-4">
                    <a href="${pageContext.request.contextPath}/register" class="bg-white text-blue-600 px-8 py-4 rounded-xl font-bold text-lg hover:bg-blue-50 transition shadow-lg">
                        Lapor Sekarang
                    </a>
                    <a href="${pageContext.request.contextPath}/login" class="bg-blue-700 text-white border border-blue-500 px-8 py-4 rounded-xl font-bold text-lg hover:bg-blue-800 transition">
                        Masuk Ke Akun
                    </a>
                </div>
            </div>
        </section>

        <!-- Features -->
        <section class="py-20 bg-white">
            <div class="container mx-auto px-4">
                <div class="text-center mb-16">
                    <h2 class="text-3xl font-bold text-gray-900 mb-4">Mengapa Melapor Lewat Sini?</h2>
                    <div class="w-24 h-1 bg-blue-600 mx-auto"></div>
                </div>

                <div class="grid md:grid-cols-4 gap-8">
                    <!-- Feature 1 -->
                    <div class="p-8 border border-gray-100 rounded-2xl shadow-sm hover:shadow-md transition">
                        <div class="w-14 h-14 bg-blue-100 text-blue-600 rounded-lg flex items-center justify-center mb-6">
                            <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"/></svg>
                        </div>
                        <h3 class="text-xl font-bold mb-3">Privasi Terjaga</h3>
                        <p class="text-gray-600">Opsi anonim tersedia. Identitas Anda tidak akan diketahui petugas jika Anda memilih untuk menyembunyikannya.</p>
                    </div>

                    <!-- Feature 2 -->
                    <div class="p-8 border border-gray-100 rounded-2xl shadow-sm hover:shadow-md transition">
                        <div class="w-14 h-14 bg-blue-100 text-blue-600 rounded-lg flex items-center justify-center mb-6">
                            <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"/></svg>
                        </div>
                        <h3 class="text-xl font-bold mb-3">Lacak Status</h3>
                        <p class="text-gray-600">Pantau perkembangan laporan Anda secara real-time dari proses verifikasi hingga penyelesaian kasus.</p>
                    </div>

                    <!-- Feature 3 -->
                    <div class="p-8 border border-gray-100 rounded-2xl shadow-sm hover:shadow-md transition">
                        <div class="w-14 h-14 bg-blue-100 text-blue-600 rounded-lg flex items-center justify-center mb-6">
                            <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z"/></svg>
                        </div>
                        <h3 class="text-xl font-bold mb-3">Chat Langsung</h3>
                        <p class="text-gray-600">Berkomunikasi langsung dengan petugas melalui sistem pesan terintegrasi untuk memberikan informasi tambahan.</p>
                    </div>

                    <!-- Feature 4 -->
                    <div class="p-8 border border-gray-100 rounded-2xl shadow-sm hover:shadow-md transition">
                        <div class="w-14 h-14 bg-blue-100 text-blue-600 rounded-lg flex items-center justify-center mb-6">
                            <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04 interaxct 0 00-2.25 10.555a11.942 11.942 0 005.105 8.355L12 21.5l1.763-1.046a11.942 11.942 0 005.105-8.355V7.984a2.25 2.25 0 00-2.25-2.25h-.022z"/></svg>
                        </div>
                        <h3 class="text-xl font-bold mb-3">Tindak Lanjut</h3>
                        <p class="text-gray-600">Terima catatan resmi dari petugas mengenai langkah-langkah penanganan yang sedang dilakukan.</p>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <footer class="bg-gray-900 text-gray-400 py-12">
        <div class="container mx-auto px-4 text-center">
            <p class="mb-4 text-white font-bold text-lg">Satuan Tugas PPKS UNSOED</p>
            <p>&copy; 2026 Universitas Jenderal Soedirman. Dibuat untuk Proyek PBO.</p>
        </div>
    </footer>
</body>
</html>
