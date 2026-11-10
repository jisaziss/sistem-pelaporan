<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.sistem.model.*" %>
<% User user = (User) session.getAttribute("user");
   Pelapor pelapor = (Pelapor) user; %>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Buat Laporan - PPKS UNSOED</title>
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

        /* Animasi Gelombang yang Tenang & Lembut */
        @keyframes waveLine {
            0% { transform: translateX(-100%); opacity: 0; }
            50% { opacity: 0.6; }
            100% { transform: translateX(100%); opacity: 0; }
        }

        .wave-line-section {
            position: relative;
            width: 14rem;
            height: 3px;
            overflow: hidden;
            border-radius: 9999px;
            background-color: rgba(94, 140, 115, 0.08);
        }

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
</head>
<body class="page-shell flex flex-col min-h-screen text-[#2F4A3E]">
    <jsp:include page="includes/navbar.jsp" />

    <main class="flex-grow container mx-auto px-4 py-10 max-w-3xl">

        <!-- Header -->
        <header class="anim-up mb-8">
            <h1 class="text-3xl md:text-4xl font-extrabold leading-tight mb-3">
                <span class="text-[#2F4A3E]">Buat Laporan</span>
                <span class="text-hijau-kuning">Baru</span>
            </h1>
            <div class="wave-line-section mb-4">
                <div class="wave-line-bar"></div>
            </div>
            <p class="text-base md:text-lg text-[#4F6B5D] font-medium">
                Isi formulir di bawah dengan lengkap dan jujur. Identitas Anda akan terlindungi.
            </p>
        </header>

        <form method="post" action="${pageContext.request.contextPath}/pelapor/laporan/baru" enctype="multipart/form-data"
              class="anim-up delay-1 relative overflow-hidden bg-white rounded-2xl border border-[#5E8C73]/25 shadow-[0_6px_20px_rgba(47,74,62,.07)] p-6 md:p-8 space-y-6">
            <div class="absolute left-0 top-0 w-full h-1.5 bg-gradient-to-r from-[#5E8C73] to-[#F6D365]"></div>

            <div class="pt-2">
                <label for="judul" class="block text-sm font-bold text-[#2F4A3E] mb-2">Judul Laporan <span class="text-[#C99A1E]">*</span></label>
                <input type="text" id="judul" name="judul" required
                       class="w-full px-4 py-3 border border-[#C9DAD0] rounded-xl focus:ring-2 focus:ring-[#7FA892] focus:border-[#7FA892] transition outline-none">
            </div>

            <div>
                <label for="kategori" class="block text-sm font-bold text-[#2F4A3E] mb-2">Kategori <span class="text-[#C99A1E]">*</span></label>
                <select id="kategori" name="kategori" required
                        class="w-full px-4 py-3 border border-[#C9DAD0] rounded-xl focus:ring-2 focus:ring-[#7FA892] focus:border-[#7FA892] transition outline-none">
                    <option value="">Pilih kategori</option>
                    <option value="Perundungan Verbal">Perundungan Verbal</option>
                    <option value="Perundungan Fisik">Perundungan Fisik</option>
                    <option value="Perundungan Sosial">Perundungan Sosial</option>
                    <option value="Perundungan Siber">Perundungan Siber</option>
                    <option value="Kekerasan Seksual Verbal">Kekerasan Seksual Verbal</option>
                    <option value="Kekerasan Seksual Fisik">Kekerasan Seksual Fisik</option>
                    <option value="Pelecehan Seksual">Pelecehan Seksual</option>
                    <option value="Lainnya">Lainnya</option>
                </select>
            </div>

            <div class="grid md:grid-cols-2 gap-6">
                <div>
                    <label for="lokasi" class="block text-sm font-bold text-[#2F4A3E] mb-2">Lokasi Kejadian</label>
                    <input type="text" id="lokasi" name="lokasi" placeholder="Contoh: Gedung A Lantai 2"
                           class="w-full px-4 py-3 border border-[#C9DAD0] rounded-xl focus:ring-2 focus:ring-[#7FA892] focus:border-[#7FA892] transition outline-none">
                </div>
                <div>
                    <label for="tanggal_kejadian" class="block text-sm font-bold text-[#2F4A3E] mb-2">Tanggal Kejadian</label>
                    <input type="date" id="tanggal_kejadian" name="tanggal_kejadian"
                           class="w-full px-4 py-3 border border-[#C9DAD0] rounded-xl focus:ring-2 focus:ring-[#7FA892] focus:border-[#7FA892] transition outline-none">
                </div>
            </div>

            <div>
                <label for="kronologi" class="block text-sm font-bold text-[#2F4A3E] mb-2">Kronologi / Deskripsi Kejadian <span class="text-[#C99A1E]">*</span></label>
                <textarea id="kronologi" name="kronologi" rows="8" required
                          placeholder="Jelaskan secara detail kronologi kejadian yang Anda alami..."
                          class="w-full px-4 py-3 border border-[#C9DAD0] rounded-xl focus:ring-2 focus:ring-[#7FA892] focus:border-[#7FA892] transition outline-none"></textarea>
            </div>

            <div>
                <label for="buktiFiles" class="block text-sm font-bold text-[#2F4A3E] mb-2">Unggah Bukti (Foto/Video)</label>
                <div class="border-2 border-dashed border-[#5E8C73]/40 bg-[#F7FAF8] rounded-xl p-4">
                    <input type="file" id="buktiFiles" name="buktiFiles" multiple accept="image/*,video/*"
                           class="w-full text-sm text-[#4F6B5D]
                                  file:mr-4 file:py-2 file:px-4 file:rounded-lg file:border-0
                                  file:bg-[#DCEBE2] file:text-[#4F7A63] file:font-semibold
                                  hover:file:bg-[#CFE3D6] file:cursor-pointer file:transition">
                </div>
                <p class="text-xs text-[#6B7F74] mt-2">Unggah foto atau video sebagai bukti. Maksimal 50MB per file.</p>
            </div>

            <div class="bg-[#FFF9E3] border border-[#F6D365] rounded-xl p-4">
                <label class="flex items-start cursor-pointer">
                    <input type="checkbox" id="sembunyikan_identitas" name="sembunyikan_identitas"
                           class="mt-1 mr-3 w-5 h-5 accent-[#5E8C73] rounded cursor-pointer">
                    <span class="text-sm">
                        <strong class="text-[#2F4A3E]">Sembunyikan identitas saya dari petugas</strong>
                        <p class="text-[#6B7F74] mt-1">Jika dicentang, petugas tidak akan mengetahui nama Anda.</p>
                    </span>
                </label>
            </div>

            <div class="flex flex-col-reverse sm:flex-row gap-3 sm:gap-4 pt-2">
                <a href="${pageContext.request.contextPath}/pelapor/dashboard"
                   class="flex-1 text-center bg-white text-[#2F4A3E] border-2 border-[#E9C24A] px-6 py-3 rounded-xl font-bold hover:bg-[#FFF9E3] hover:border-[#F6D365] hover:-translate-y-0.5 transition">
                    Batal
                </a>
                <button type="submit"
                        class="flex-1 bg-[#5C7FA8] text-white px-6 py-3 rounded-xl font-bold hover:bg-[#5E8C73] hover:-translate-y-0.5 transition shadow-[0_8px_18px_rgba(92,127,168,.28)]">
                    Kirim Laporan
                </button>
            </div>
        </form>
    </main>

    <footer class="bg-[#F7FAF8] text-[#2F4A3E] py-10 md:py-12 border-t-4 border-[#F6D365]">
        <div class="container mx-auto px-4 text-center">
            <p class="mb-3 font-bold text-base md:text-lg">
                <span class="text-[#4F7A63]">Satuan Tugas</span> <span class="text-[#C99A1E]">PPKS UNSOED</span>
            </p>
            <p class="text-xs sm:text-sm text-[#6B7F74]">&copy; 2026 Universitas Jenderal Soedirman. Dibuat untuk Proyek PBO.</p>
        </div>
    </footer>
</body>
</html>