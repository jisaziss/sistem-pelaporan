<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Sistem Pelaporan PPKS UNSOED</title>
    <jsp:include page="includes/head.jsp" />
    <style>
        .particle-bg {
            position: absolute;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
        .particle {
            position: absolute;
            background: radial-gradient(circle, rgba(255, 223, 22, 0.8) 0%, transparent 70%);
            border-radius: 50%;
            animation: float 15s infinite ease-in-out;
        }
        @keyframes float {
            0%, 100% { transform: translateY(0px) translateX(0px); opacity: 0.3; }
            50% { transform: translateY(-30px) translateX(20px); opacity: 0.8; }
        }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-950 via-gray-900 to-gray-950 text-white min-h-screen flex flex-col">
    <jsp:include page="includes/navbar.jsp" />

    <!-- Hero Section with Particles -->
    <main class="flex-grow relative overflow-hidden">
        <div class="particle-bg">
            <div class="particle" style="width: 4px; height: 4px; left: 10%; top: 20%; animation-delay: 0s;"></div>
            <div class="particle" style="width: 3px; height: 3px; left: 20%; top: 60%; animation-delay: 2s;"></div>
            <div class="particle" style="width: 5px; height: 5px; left: 70%; top: 30%; animation-delay: 4s;"></div>
            <div class="particle" style="width: 4px; height: 4px; left: 85%; top: 70%; animation-delay: 6s;"></div>
            <div class="particle" style="width: 3px; height: 3px; left: 50%; top: 15%; animation-delay: 8s;"></div>
            <div class="particle" style="width: 6px; height: 6px; left: 30%; top: 80%; animation-delay: 3s;"></div>
        </div>

        <section class="relative py-32 px-4">
            <div class="container mx-auto text-center max-w-5xl relative z-10">
                <h1 class="text-6xl md:text-7xl font-extrabold mb-6 bg-gradient-to-r from-[#FFDF16] via-[#FFAA16] to-[#FF5516] bg-clip-text text-transparent leading-tight">
                    Sistem Pelaporan PPKS
                </h1>
                <p class="text-xl md:text-2xl text-gray-300 mb-12 max-w-3xl mx-auto leading-relaxed font-light">
                    Platform aman, rahasia, dan terpercaya untuk melaporkan kasus kekerasan seksual di lingkungan Universitas Jenderal Soedirman.
                </p>
                <div class="flex flex-col sm:flex-row justify-center gap-6">
                    <a href="${pageContext.request.contextPath}/register" class="group relative bg-gradient-to-r from-[#FF5516] to-[#FFAA16] text-white px-10 py-4 rounded-xl font-bold text-lg hover:shadow-2xl hover:shadow-[#FF5516]/50 transition-all duration-300 transform hover:scale-105">
                        <span class="relative z-10">Lapor Sekarang</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/login" class="bg-white/10 backdrop-blur-md text-white border-2 border-[#FFAA16]/50 px-10 py-4 rounded-xl font-bold text-lg hover:bg-white/20 hover:border-[#FFAA16] transition-all duration-300">
                        Masuk Ke Akun
                    </a>
                </div>
            </div>
        </section>

        <!-- Features Glass Cards -->
        <section class="relative py-20 px-4">
            <div class="container mx-auto max-w-7xl">
                <div class="text-center mb-16">
                    <h2 class="text-4xl font-bold mb-4 text-white">Mengapa Melapor Lewat Sini?</h2>
                    <div class="w-32 h-1 bg-gradient-to-r from-[#FFDF16] to-[#FF5516] mx-auto rounded-full"></div>
                </div>

                <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
                    <!-- Feature 1 -->
                    <div class="glass-card hover:bg-gray-800/80 transition-all duration-300 group">
                        <div class="w-16 h-16 bg-gradient-to-br from-[#FFDF16] to-[#FFAA16] rounded-2xl flex items-center justify-center mb-6 group-hover:scale-110 transition-transform duration-300">
                            <svg class="w-8 h-8 text-gray-900" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"/></svg>
                        </div>
                        <h3 class="text-xl font-bold mb-3 text-[#FFDF16]">Privasi Terjaga</h3>
                        <p class="text-gray-400 leading-relaxed">Opsi anonim tersedia. Identitas Anda tidak akan diketahui petugas jika Anda memilih untuk menyembunyikannya.</p>
                    </div>

                    <!-- Feature 2 -->
                    <div class="glass-card hover:bg-gray-800/80 transition-all duration-300 group">
                        <div class="w-16 h-16 bg-gradient-to-br from-[#FFAA16] to-[#FF5516] rounded-2xl flex items-center justify-center mb-6 group-hover:scale-110 transition-transform duration-300">
                            <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"/></svg>
                        </div>
                        <h3 class="text-xl font-bold mb-3 text-[#FFAA16]">Lacak Status</h3>
                        <p class="text-gray-400 leading-relaxed">Pantau perkembangan laporan Anda secara real-time dari proses verifikasi hingga penyelesaian kasus.</p>
                    </div>

                    <!-- Feature 3 -->
                    <div class="glass-card hover:bg-gray-800/80 transition-all duration-300 group">
                        <div class="w-16 h-16 bg-gradient-to-br from-[#FF5516] to-red-600 rounded-2xl flex items-center justify-center mb-6 group-hover:scale-110 transition-transform duration-300">
                            <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z"/></svg>
                        </div>
                        <h3 class="text-xl font-bold mb-3 text-[#FF5516]">Chat Langsung</h3>
                        <p class="text-gray-400 leading-relaxed">Berkomunikasi langsung dengan petugas melalui sistem pesan terintegrasi untuk memberikan informasi tambahan.</p>
                    </div>

                    <!-- Feature 4 -->
                    <div class="glass-card hover:bg-gray-800/80 transition-all duration-300 group">
                        <div class="w-16 h-16 bg-gradient-to-br from-[#A5FF16] to-green-500 rounded-2xl flex items-center justify-center mb-6 group-hover:scale-110 transition-transform duration-300">
                            <svg class="w-8 h-8 text-gray-900" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"/></svg>
                        </div>
                        <h3 class="text-xl font-bold mb-3 text-[#A5FF16]">Tindak Lanjut</h3>
                        <p class="text-gray-400 leading-relaxed">Terima catatan resmi dari petugas mengenai langkah-langkah penanganan yang sedang dilakukan.</p>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <footer class="relative border-t border-gray-800 bg-gray-900/50 backdrop-blur-sm py-12">
        <div class="container mx-auto px-4 text-center">
            <p class="mb-4 text-[#FFDF16] font-bold text-lg">Satuan Tugas PPKS UNSOED</p>
            <p class="text-gray-500">&copy; 2026 Universitas Jenderal Soedirman. Dibuat untuk Proyek PBO.</p>
        </div>
    </footer>
</body>
</html>
