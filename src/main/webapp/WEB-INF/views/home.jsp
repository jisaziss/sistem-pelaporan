<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Sistem Pelaporan PPKS UNSOED</title>
    <jsp:include page="includes/head.jsp" />

    <style>
        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(16px); }
            to   { opacity: 1; transform: translateY(0); }
        }
        .anim-up { animation: fadeUp .7s ease both; }
        .delay-1 { animation-delay: .1s; }
        .delay-2 { animation-delay: .2s; }
        .delay-3 { animation-delay: .3s; }

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
        .wave-line-section, .wave-line-container { width: 9rem; margin: 0 auto; }

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

    <main class="flex-grow">

        <!-- Hero -->
        <section class="py-14 md:py-20 px-4">
            <div class="container mx-auto text-center max-w-4xl">
                <h1 class="anim-up text-3xl sm:text-4xl md:text-6xl font-extrabold mb-5 md:mb-6 leading-tight">
                    <span class="text-[#2F4A3E]">Sistem Pelaporan</span>
                    <span class="text-hijau-kuning">PPKS</span>
                </h1>
                <!-- Garis Hero -->
                <div class="anim-up delay-1 wave-line-hero max-w-lg mx-auto mb-6">
                    <div class="wave-line-bar"></div>
                </div>
                <p class="anim-up delay-2 text-base sm:text-lg md:text-2xl text-[#4F6B5D] mb-8 md:mb-10 leading-relaxed font-medium">
                    Platform <span class="text-[#4F7A63] font-semibold">aman</span>,
                    <span class="text-[#C99A1E] font-semibold">rahasia</span>, dan
                    <span class="text-[#4F7A63] font-semibold">terpercaya</span> untuk melaporkan kasus kekerasan seksual di lingkungan Universitas Jenderal Soedirman.
                </p>
                <div class="anim-up delay-3 flex flex-col sm:flex-row justify-center gap-3 sm:gap-4">
                    <a href="${pageContext.request.contextPath}/register"
                       class="bg-[#5C7FA8] text-white px-8 py-3.5 sm:py-4 rounded-xl font-bold text-base sm:text-lg hover:bg-[#5E8C73] hover:-translate-y-0.5 transition shadow-[0_8px_18px_rgba(92,127,168,.28)]">
                        Lapor Sekarang
                    </a>
                    <a href="${pageContext.request.contextPath}/login"
                       class="bg-white text-[#2F4A3E] border-2 border-[#E9C24A] px-8 py-3.5 sm:py-4 rounded-xl font-bold text-base sm:text-lg hover:bg-[#FFF9E3] hover:border-[#F6D365] hover:-translate-y-0.5 transition shadow-[0_8px_18px_rgba(246,211,101,.35)]">
                        Masuk Ke Akun
                    </a>
                </div>
            </div>
        </section>

        <!-- Features -->
        <section class="py-14 md:py-20">
            <div class="container mx-auto px-4">
                <div class="reveal text-center mb-10 md:mb-16">
                    <h2 class="text-2xl sm:text-3xl font-bold mb-4">
                        <span class="text-[#2F4A3E]">Mengapa Melapor</span>
                        <span class="text-[#C99A1E]">Lewat Sini?</span>
                    </h2>
                    <div class="wave-line-section mx-auto">
                        <div class="wave-line-bar"></div>
                    </div>
                </div>

                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5 md:gap-8">
                    <!-- Feature 1 -->
                    <div class="reveal p-7 bg-white border border-[#5E8C73]/25 rounded-2xl shadow-[0_6px_20px_rgba(47,74,62,.07)] hover:shadow-lg hover:shadow-[#5C7FA8]/15 hover:-translate-y-1 transition duration-300">
                        <div class="w-14 h-14 bg-[#DCEBE2] text-[#4F7A63] rounded-xl flex items-center justify-center mb-6">
                            <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"/></svg>
                        </div>
                        <h3 class="text-lg sm:text-xl font-bold mb-3 text-[#4F7A63]">Privasi Terjaga</h3>
                        <p class="text-sm sm:text-base text-[#6B7F74]">Opsi anonim tersedia. Identitas Anda tidak akan diketahui petugas jika Anda memilih untuk menyembunyikannya.</p>
                    </div>

                    <!-- Feature 2 -->
                    <div class="reveal p-7 bg-white border border-[#F6D365]/70 rounded-2xl shadow-[0_6px_20px_rgba(47,74,62,.07)] hover:shadow-lg hover:shadow-[#5C7FA8]/15 hover:-translate-y-1 transition duration-300" style="transition-delay:.08s">
                        <div class="w-14 h-14 bg-[#FBE7A1] text-[#2F4A3E] rounded-xl flex items-center justify-center mb-6">
                            <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"/></svg>
                        </div>
                        <h3 class="text-lg sm:text-xl font-bold mb-3 text-[#C99A1E]">Lacak Status</h3>
                        <p class="text-sm sm:text-base text-[#6B7F74]">Pantau perkembangan laporan Anda secara real-time dari proses verifikasi hingga penyelesaian kasus.</p>
                    </div>

                    <!-- Feature 3 -->
                    <div class="reveal p-7 bg-white border border-[#5E8C73]/25 rounded-2xl shadow-[0_6px_20px_rgba(47,74,62,.07)] hover:shadow-lg hover:shadow-[#5C7FA8]/15 hover:-translate-y-1 transition duration-300" style="transition-delay:.16s">
                        <div class="w-14 h-14 bg-[#DCEBE2] text-[#4F7A63] rounded-xl flex items-center justify-center mb-6">
                            <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 10h.01M12 10h.01M16 10h.01M9 16H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-5l-5 5v-5z"/></svg>
                        </div>
                        <h3 class="text-lg sm:text-xl font-bold mb-3 text-[#4F7A63]">Chat Langsung</h3>
                        <p class="text-sm sm:text-base text-[#6B7F74]">Berkomunikasi langsung dengan petugas melalui sistem pesan terintegrasi untuk memberikan informasi tambahan.</p>
                    </div>

                    <!-- Feature 4 -->
                    <div class="reveal p-7 bg-white border border-[#F6D365]/70 rounded-2xl shadow-[0_6px_20px_rgba(47,74,62,.07)] hover:shadow-lg hover:shadow-[#5C7FA8]/15 hover:-translate-y-1 transition duration-300" style="transition-delay:.24s">
                        <div class="w-14 h-14 bg-[#FBE7A1] text-[#2F4A3E] rounded-xl flex items-center justify-center mb-6">
                            <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"/></svg>
                        </div>
                        <h3 class="text-lg sm:text-xl font-bold mb-3 text-[#C99A1E]">Tindak Lanjut</h3>
                        <p class="text-sm sm:text-base text-[#6B7F74]">Terima catatan resmi dari petugas mengenai langkah-langkah penanganan yang sedang dilakukan.</p>
                    </div>
                </div>
            </div>
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