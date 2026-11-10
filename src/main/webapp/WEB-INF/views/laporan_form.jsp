<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.sistem.model.*" %>
<% User user = (User) session.getAttribute("user"); 
   Pelapor pelapor = (Pelapor) user; %>
<!DOCTYPE html>
<html lang="id">
<head>
    <title>Buat Laporan - PPKS UNSOED</title>
    <jsp:include page="includes/head.jsp" />
</head>
<body class="page-shell min-h-screen">
    <jsp:include page="includes/navbar.jsp" />

    <main class="container mx-auto px-4 py-8 max-w-3xl">
        <header class="mb-8">
            <h1 class="text-3xl font-bold text-gray-900">Buat Laporan Baru</h1>
            <p class="text-gray-600 mt-2">Isi formulir di bawah dengan lengkap dan jujur. Identitas Anda akan terlindungi.</p>
        </header>

        <form method="post" action="${pageContext.request.contextPath}/pelapor/laporan/baru" enctype="multipart/form-data"
              class="bg-white rounded-2xl shadow-sm border border-gray-100 p-8 space-y-6">
            
            <div>
                <label for="judul" class="block text-sm font-bold text-gray-700 mb-2">Judul Laporan *</label>
                <input type="text" id="judul" name="judul" required
                       class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-green-600 focus:border-green-600 transition outline-none">
            </div>

            <div>
                <label for="buktiFiles" class="block text-sm font-bold text-gray-700 mb-2">Unggah Bukti (Foto/Video)</label>
                <input type="file" id="buktiFiles" name="buktiFiles" multiple accept="image/*,video/*"
                       class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-green-600 focus:border-green-600 transition outline-none">
                <p class="text-xs text-gray-500 mt-2">Unggah foto atau video sebagai bukti. Maksimal 50MB per file.</p>
            </div>

            <div>
                <label for="kategori" class="block text-sm font-bold text-gray-700 mb-2">Kategori *</label>
                <select id="kategori" name="kategori" required
                        class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-green-600 focus:border-green-600 transition outline-none">
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

            <div>
                <label for="lokasi" class="block text-sm font-bold text-gray-700 mb-2">Lokasi Kejadian</label>
                <input type="text" id="lokasi" name="lokasi" placeholder="Contoh: Gedung A Lantai 2"
                       class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-green-600 focus:border-green-600 transition outline-none">
            </div>

            <div>
                <label for="tanggal_kejadian" class="block text-sm font-bold text-gray-700 mb-2">Tanggal Kejadian</label>
                <input type="date" id="tanggal_kejadian" name="tanggal_kejadian"
                       class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-green-600 focus:border-green-600 transition outline-none">
            </div>

            <div>
                <label for="kronologi" class="block text-sm font-bold text-gray-700 mb-2">Kronologi / Deskripsi Kejadian *</label>
                <textarea id="kronologi" name="kronologi" rows="8" required
                          placeholder="Jelaskan secara detail kronologi kejadian yang Anda alami..."
                          class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-green-600 focus:border-green-600 transition outline-none"></textarea>
            </div>

            <div class="bg-yellow-50 border border-yellow-200 rounded-xl p-4">
                <label class="flex items-start cursor-pointer">
                    <input type="checkbox" id="sembunyikan_identitas" name="sembunyikan_identitas"
                           class="mt-1 mr-3 w-5 h-5 text-green-700 border-gray-300 rounded focus:ring-green-600">
                    <span class="text-sm">
                        <strong class="text-gray-900">Sembunyikan identitas saya dari petugas</strong>
                        <p class="text-gray-600 mt-1">Jika dicentang, petugas tidak akan mengetahui nama Anda.</p>
                    </span>
                </label>
            </div>

            <div class="flex gap-4 pt-4">
                <a href="${pageContext.request.contextPath}/pelapor/dashboard" 
                   class="flex-1 text-center bg-gray-100 text-gray-700 px-6 py-3 rounded-xl font-bold hover:bg-gray-200 transition">
                    Batal
                </a>
                <button type="submit" 
                        class="flex-1 bg-green-700 text-white px-6 py-3 rounded-xl font-bold hover:bg-green-800 transition shadow-lg">
                    Kirim Laporan
                </button>
            </div>
        </form>
    </main>
</body>
</html>
