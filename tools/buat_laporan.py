import sys
sys.stdout.reconfigure(encoding='utf-8')

from docx import Document
from docx.shared import Pt, Cm, RGBColor, Inches
from docx.enum.text import WD_ALIGN_PARAGRAPH, WD_LINE_SPACING
from docx.enum.table import WD_ALIGN_VERTICAL
from docx.oxml.ns import qn
from docx.oxml import OxmlElement

doc = Document()

# Page setup A4
section = doc.sections[0]
section.page_width = Cm(21.0)
section.page_height = Cm(29.7)
section.left_margin = Cm(4.0)
section.right_margin = Cm(3.0)
section.top_margin = Cm(3.0)
section.bottom_margin = Cm(3.0)

# ===== STYLES =====
style = doc.styles['Normal']
style.font.name = 'Times New Roman'
style.font.size = Pt(12)
style.paragraph_format.line_spacing = 1.5
style.paragraph_format.space_after = Pt(6)
r = style.element.rPr.rFonts
r.set(qn('w:eastAsia'), 'Times New Roman')

def h1(text, color=(0,0,0)):
    p = doc.add_paragraph()
    p.alignment = WD_ALIGN_PARAGRAPH.CENTER
    p.paragraph_format.space_before = Pt(18)
    p.paragraph_format.space_after = Pt(12)
    run = p.add_run(text)
    run.bold = True
    run.font.size = Pt(14)
    run.font.color.rgb = RGBColor(*color)
    return p

def h2(text):
    p = doc.add_paragraph()
    p.paragraph_format.space_before = Pt(12)
    p.paragraph_format.space_after = Pt(6)
    run = p.add_run(text)
    run.bold = True
    run.font.size = Pt(13)
    return p

def h3(text):
    p = doc.add_paragraph()
    p.paragraph_format.space_before = Pt(10)
    p.paragraph_format.space_after = Pt(4)
    run = p.add_run(text)
    run.bold = True
    run.font.size = Pt(12)
    return p

def para(text, bold=False, italic=False, align=None, size=12):
    p = doc.add_paragraph()
    if align == 'center':
        p.alignment = WD_ALIGN_PARAGRAPH.CENTER
    elif align == 'justify':
        p.alignment = WD_ALIGN_PARAGRAPH.JUSTIFY
    run = p.add_run(text)
    run.bold = bold
    run.italic = italic
    run.font.size = Pt(size)
    return p

def bullet(text, level=0):
    p = doc.add_paragraph(style='List Bullet')
    p.paragraph_format.left_indent = Cm(1.0 + level*0.7)
    p.paragraph_format.line_spacing = 1.15
    p.paragraph_format.space_after = Pt(2)
    run = p.add_run(text)
    run.font.size = Pt(12)
    return p

def code(text):
    p = doc.add_paragraph()
    p.paragraph_format.left_indent = Cm(1.0)
    p.paragraph_format.line_spacing = 1.0
    p.paragraph_format.space_after = Pt(0)
    run = p.add_run(text)
    run.font.name = 'Consolas'
    run.font.size = Pt(9.5)
    run.font.color.rgb = RGBColor(0x30, 0x30, 0x30)
    r = run.element.rPr.rFonts
    r.set(qn('w:eastAsia'), 'Consolas')
    return p

def table_header_row(table, headers):
    hdr = table.rows[0]
    for i, t in enumerate(headers):
        cell = hdr.cells[i]
        cell.text = ''
        p = cell.paragraphs[0]
        run = p.add_run(t)
        run.bold = True
        run.font.size = Pt(11)
        # shading
        tcPr = cell._tc.get_or_add_tcPr()
        shd = OxmlElement('w:shd')
        shd.set(qn('w:val'), 'clear')
        shd.set(qn('w:fill'), 'D9E2F3')
        tcPr.append(shd)

def add_table(rows, headers=None, widths=None):
    if headers:
        table = doc.add_table(rows=1+len(rows), cols=len(headers))
        table.style = 'Table Grid'
        table_header_row(table, headers)
        start = 1
    else:
        table = doc.add_table(rows=len(rows), cols=len(rows[0]))
        table.style = 'Table Grid'
        start = 0
    for r_i, row in enumerate(rows):
        for c_i, val in enumerate(row):
            cell = table.rows[start+r_i].cells[c_i]
            cell.text = ''
            p = cell.paragraphs[0]
            run = p.add_run(str(val))
            run.font.size = Pt(10.5)
            p.paragraph_format.line_spacing = 1.0
    if widths:
        for row in table.rows:
            for c_i, w in enumerate(widths):
                row.cells[c_i].width = Cm(w)
    return table

def spacer(n=1):
    for _ in range(n):
        doc.add_paragraph()

# =========================================================
# COVER
# =========================================================
para('LAPORAN PROYEK AKHIR', align='center', bold=True, size=14)
para('PEMROGRAMAN BERORIENTASI OBJEK', align='center', bold=True, size=14)
spacer(2)
para('SISTEM PELAPORAN PPKS', align='center', bold=True, size=20)
para('(Pencegahan dan Penanganan Kekerasan Seksual)', align='center', italic=True, size=13)
para(' Universitas Jenderal Soedirman ', align='center', size=13)
spacer(2)
para('Disusun oleh:', align='center', size=12)
para('[Nama Mahasiswa 1]', align='center', size=12)
para('NIM: [NIM 1]', align='center', size=12)
para('[Nama Mahasiswa 2]', align='center', size=12)
para('NIM: [NIM 2]', align='center', size=12)
spacer(2)
para('JURUSAN [NAMA JURUSAN]', align='center', bold=True, size=13)
para('FAKULTAS [NAMA FAKULTAS]', align='center', bold=True, size=13)
para('UNIVERSITAS JENDERAL SOEDIRMAN', align='center', bold=True, size=13)
para('PURWOKERTO', align='center', bold=True, size=13)
para('2026', align='center', bold=True, size=13)

doc.add_page_break()

# =========================================================
# DAFTAR ISI (manual placeholder)
# =========================================================
h1('DAFTAR ISI')
para('(Update nomor halaman setelah dokumen final)', italic=True, size=10)
toc_items = [
    'BAB 1 PENDAHULUAN',
    '   1.1 Latar Belakang',
    '   1.2 Rumusan Masalah',
    '   1.3 Tujuan',
    '   1.4 Manfaat',
    '   1.5 Batasan Masalah',
    'BAB 2 LANDASAN TEORI',
    '   2.1 Pemrograman Berorientasi Objek',
    '   2.2 Java Servlet dan JSP',
    '   2.3 MySQL dan JDBC',
    '   2.4 Keamanan Aplikasi Web',
    'BAB 3 ANALISIS KEBUTUHAN',
    '   3.1 Analisis Kebutuhan Fungsional',
    '   3.2 Analisis Kebutuhan Non-Fungsional',
    '   3.3 Aktor Pengguna',
    'BAB 4 PERANCANGAN SISTEM',
    '   4.1 Arsitektur Sistem',
    '   4.2 Perancangan Database',
    '   4.3 Perancangan Kelas (Class Diagram)',
    '   4.4 Perancangan Antarmuka',
    'BAB 5 IMPLEMENTASI',
    '   5.1 Struktur Proyek',
    '   5.2 Implementasi Kelas Model',
    '   5.3 Implementasi Layer DAO',
    '   5.4 Implementasi Layer Service',
    '   5.5 Implementasi Servlet Controller',
    '   5.6 Implementasi Antarmuka (JSP)',
    '   5.7 Implementasi Keamanan',
    'BAB 6 PENGUJIAN',
    '   6.1 Skenario Pengujian',
    '   6.2 Hasil Pengujian Fungsional',
    '   6.3 Hasil Pengujian Keamanan',
    'BAB 7 PENDEPLOYAN',
    '   7.1 Deployment Lokal',
    '   7.2 Deployment ke Server Kampus',
    'BAB 8 PENUTUP',
    '   8.1 Kesimpulan',
    '   8.2 Saran',
]
for item in toc_items:
    is_bab = item.startswith('BAB')
    p = para(item, bold=is_bab, size=12)
    p.paragraph_format.line_spacing = 1.3
    p.paragraph_format.space_after = Pt(0)

doc.add_page_break()

# =========================================================
# BAB 1 PENDAHULUAN
# =========================================================
h1('BAB 1 PENDAHULUAN')

h2('1.1 Latar Belakang')
para('Kekerasan seksual di lingkungan perguruan tinggi merupakan persoalan serius yang dapat berdampak pada aspek psikologis, akademik, dan sosial korban. Permendikbudristek No. 30 Tahun 2021 mewajibkan setiap perguruan tinggi membentuk Satuan Tugas Pencegahan dan Penanganan Kekerasan Seksual (PPKS). Universitas Jenderal Soedirman telah membentuk gugus tugas PPKS untuk menangani kasus tersebut.', align='justify')
para('Permasalahan yang sering dihadapi korban maupun saksi dalam melaporkan kejadian kekerasan seksual antara lain: tidak adanya saluran pelaporan yang terpusat, ketakutan identitas terbuka kepada pihak lain, proses penanganan yang tidak transparan sehingga pelapor tidak mengetahui perkembangan laporannya, serta komunikasi antara pelapor dan petugas yang belum terdokumentasi dengan baik.', align='justify')
para('Berdasarkan permasalahan tersebut, dikembangkan Sistem Pelaporan PPKS Universitas Jenderal Soedirman. Sistem ini berbasis web dan dibangun menggunakan bahasa pemrograman Java dengan paradigma Pemrograman Berorientasi Objek (PBO) murni tanpa framework, sehinggamahasiswa dapat memahami sepenuhnya prinsip-prinsip OOP seperti enkapsulasi, pewarisan, dan polimorfisme yang diterapkan langsung pada kode program.', align='justify')

h2('1.2 Rumusan Masalah')
para('Bagaimana membangun sistem pelaporan kekerasan seksual berbasis web yang aman, mudah digunakan, dan melindungi identitas pelapor di lingkungan Universitas Jenderal Soedirman?')

h2('1.3 Tujuan')
bullet('Menyediakan saluran pelaporan kekerasan seksual yang terpusat dan mudah diakses.')
bullet('Melindungi privasi pelapor melalui fitur penyembunyian identitas (anonim).')
bullet('Menyediakan pelacakan status laporan secara transparan.')
bullet('Memfasilitasi komunikasi pelapor–petugas melalui fitur pesan dan tindak lanjut.')
bullet('Menerapkan konsep PBO secara utuh: enkapsulasi, inheritance, polymorphism, dan layered architecture.')

h2('1.4 Manfaat')
para('Bagi korban dan saksi: tersedia kanal pelaporan yang aman dengan opsi anonim. Bagi petugas PPKS: pengelolaan laporan lebih terstruktur dan terdokumentasi. Bagi universitas: terpenuhi kewajiban regulasi Permendikbudristek No. 30 Tahun 2021. Bagi akademik: menjadi contoh penerapan PBO pada aplikasi web nyata.', align='justify')

h2('1.5 Batasan Masalah')
para('Ruang lingkup sistem dibatasi sebagai berikut:', align='justify')
bullet('Aplikasi khusus untuk lingkungan Universitas Jenderal Soedirman (UNSOED).')
bullet('Pengguna hanya terdiri dari dua peran (role): Pelapor dan Petugas PPKS; tidak ada role admin.')
bullet('Data yang dilaporkan berupa teks; belum mendukung unggah foto/video/dokumen.')
bullet('Fitur pesan bersifat asinkron (seperti pesan singkat), bukan percakapan real-time.')
bullet('Sistem tidak mencakup proses sidang etik, penetapan sanksi, maupun integrasi dengan SIE/SIAKAD UNSOED.')
bullet('Autentikasi menggunakan akun lokal (username–password), bukan SSO universitas.')
bullet('Aplikasi berjalan di jaringan internal kampus (intranet) untuk deployment lokal.')

# =========================================================
# BAB 2 LANDASAN TEORI
# =========================================================
doc.add_page_break()
h1('BAB 2 LANDASAN TEORI')

h2('2.1 Pemrograman Berorientasi Objek')
para('PBO adalah paradigma pemrograman yang memodelkan program sebagai kumpulan objek yang memiliki data (atribut) dan perilaku (method). Empat pilar PBO diterapkan dalam sistem ini:', align='justify')
bullet('Enkapsulasi: atribut kelas dibuat private dan diakses melalui getter/setter.')
bullet('Pewarisan (inheritance): kelas Pelapor dan Petugas mewarisi kelas abstrak User.')
bullet('Polimorfisme: method bolehAksesLaporan() di-override oleh setiap subclass sehingga logika kontrol akses berbeda sesuai peran.')
bullet('Abstraksi: kelas abstrak User mendefinisikan kontrak perilaku umum pengguna.')

h2('2.2 Java Servlet dan JSP')
para('Servlet adalah kelas Java yang menangani permintaan HTTP dan menghasilkan respons dinamis. JSP (Jakarta Server Pages) digunakan untuk membangun tampilan. Sistem ini menggunakan Jakarta EE 10 (Servlet 6.0) yang berjalan di atas Apache Tomcat 10.1. Pola MVC diterapkan: Servlet sebagai controller, JSP sebagai view, kelas model + DAO sebagai model.', align='justify')

h2('2.3 MySQL dan JDBC')
para('MySQL merupakan sistem manajemen basis data relasional. JDBC (Java Database Connectivity) menjadi jembatan antara aplikasi Java dan MySQL melalui driver MySQL Connector/J. Seluruh operasi database menggunakan PreparedStatement untuk mencegah serangan SQL Injection.', align='justify')

h2('2.4 Keamanan Aplikasi Web')
bullet('Password Hashing: kata sandi tidak disimpan sebagai teks biasa, melainkan di-hash dengan algoritma PBKDF2WithHmacSHA256 yang disediakan Java Cryptography Architecture.')
bullet('SQL Injection Prevention: seluruh query memakai parameter PreparedStatement.')
bullet('XSS Prevention: seluruh data pengguna yang dirender ke HTML di-escape melalui kelas utilitas HtmlUtil.escape().')
bullet('Session-based Access Control: setiap Servlet memeriksa sesi login dan peran pengguna melalui method polymorphic bolehAksesLaporan().')

# =========================================================
# BAB 3 ANALISIS KEBUTUHAN
# =========================================================
doc.add_page_break()
h1('BAB 3 ANALISIS KEBUTUHAN')

h2('3.1 Analisis Kebutuhan Fungsional')
para('Berikut daftar kebutuhan fungsional sistem:', align='justify')
add_table(
    rows=[
        ('F01', 'Registrasi akun pelapor baru', 'Pelapor'),
        ('F02', 'Login dan logout dengan sesi', 'Semua pengguna'),
        ('F03', 'Membuat laporan baru (judul, deskripsi, lokasi, tanggal kejadian)', 'Pelapor'),
        ('F04', 'Opsi menyembunyikan identitas (anonim) saat melapor', 'Pelapor'),
        ('F05', 'Melihat daftar laporan milik sendiri beserta statusnya', 'Pelapor'),
        ('F06', 'Mengirim dan menerima pesan terkait laporan', 'Pelapor & Petugas'),
        ('F07', 'Melihat daftar laporan masuk yang belum ditangani', 'Petugas'),
        ('F08', 'Mengambil (meng-assign) laporan untuk ditangani', 'Petugas'),
        ('F09', 'Memverifikasi laporan (menyetujui / meminta informasi tambahan)', 'Petugas'),
        ('F10', 'Memperbarui status laporan melalui 4 tahapan', 'Petugas'),
        ('F11', 'Menambahkan catatan tindak lanjut pada laporan', 'Petugas'),
        ('F12', 'Melihat detail laporan lengkap', 'Pelapor & Petugas'),
    ],
    headers=['Kode', 'Kebutuhan', 'Aktor'],
    widths=[1.7, 6.8, 4.5]
)

h2('3.2 Analisis Kebutuhan Non-Fungsional')
add_table(
    rows=[
        ('Keamanan', 'Password di-hash (PBKDF2), query menggunakan PreparedStatement, output HTML di-escape, kontrol akses per halaman.'),
        ('Kegunaan', 'Antarmuka sederhana berbahasa Indonesia, responsif di desktop dan ponsel.'),
        ('Kinerja', ' waktu respon < 2 detik untuk operasi normal pada skala pengguna kampus satu fakultas.'),
        ('Portabilitas', 'Berjalan di Apache Tomcat 10.1 dengan JDK 17 dan MySQL 8.0, dapat dideploy lokal maupun ke server.'),
    ],
    headers=['Aspek', 'Kriteria'],
    widths=[3.0, 9.5]
)

h2('3.3 Aktor Pengguna')
para('Sistem memiliki dua aktor:', align='justify')
bullet('Pelapor: mahasiswa, dosen, atau tenaga kependidikan UNSOED yang ingin melaporkan kekerasan seksual. Dapat memilih menyembunyikan identitas. Hanya dapat melihat laporan miliknya sendiri.')
bullet('Petugas PPKS: personel gugus tugas yang memverifikasi, menindaklanjuti, dan menyelesaikan laporan. Petugas melihat antrian laporan yang belum ditangani dan laporan yang telah di-assign kepadanya.')
para('Setiap laporan melewati empat status: Menunggu Verifikasi → Perlu Informasi → Dalam Penanganan → Selesai.', align='justify')

# =========================================================
# BAB 4 PERANCANGAN SISTEM
# =========================================================
doc.add_page_break()
h1('BAB 4 PERANCANGAN SISTEM')

h2('4.1 Arsitektur Sistem')
para('Sistem menerapkan arsitektur berlapis (layered architecture) dengan pola MVC:', align='justify')
add_table(
    rows=[
        ('Presentation', 'JSP (7 halaman) + CSS', 'Tampilan dan interaksi pengguna'),
        ('Controller', '10 Servlet', 'Menerima request, validasi sesi, panggil service'),
        ('Business Logic', 'LaporanService, AppInitializer', 'Aturan bisnis: verifikasi, ubah status, tindak lanjut, pesan'),
        ('Data Access', 'UserDAO, LaporanDAO, PesanDAO, TindakLanjutDAO', 'Operasi CRUD dengan PreparedStatement'),
        ('Database', 'MySQL 8.0', 'Penyimpanan data persisten'),
    ],
    headers=['Lapisan', 'Komponen', 'Fungsi'],
    widths=[3.2, 5.6, 5.5]
)
para('Pembagian paket pada kode sumber:', align='justify')
code('com.sistem.model      → kelas entitas (User, Pelapor, Petugas, Laporan, Pesan, ...)')
code('com.sistem.dao        → akses data (UserDAO, LaporanDAO, ...)')
code('com.sistem.service    → logika bisnis (LaporanService, AppInitializer)')
code('com.sistem.controller → servlet (LoginServlet, LaporanServlet, ...)')
code('com.sistem.util       → utilitas (DBConnection, PasswordUtil, HtmlUtil)')

h2('4.2 Perancangan Database')
para('Basis data db_ppks_unsoed terdiri dari empat tabel utama dengan relasi sebagai berikut:', align='justify')
add_table(
    rows=[
        ('users', 'id (PK), username (unik), password_hash, role, nama_lengkap, created_at', 'Menyimpan akun pelapor dan petugas'),
        ('laporan', 'id (PK), nomor_laporan (unik), id_pelapor (FK→users), id_petugas (FK→users, nullable), judul, deskripsi, lokasi, tanggal_kejadian, status, sembunyikan_nama, waktu_lapor', 'Menyimpan laporan'),
        ('pesan', 'id (PK), id_laporan (FK→laporan), id_pengirim (FK→users), isi_pesan, waktu_kirim', 'Percakapan terkait laporan'),
        ('tindak_lanjut', 'id (PK), id_laporan (FK→laporan), id_petugas (FK→users), catatan, waktu_catat', 'Riwayat tindak lanjut petugas'),
    ],
    headers=['Tabel', 'Atribut Utama', 'Keterangan'],
    widths=[2.7, 7.0, 4.3]
)
para('Relasi: satu pelapor dapat memiliki banyak laporan; satu laporan dapat memiliki banyak pesan dan banyak tindak lanjut; satu petugas menangani banyak laporan.', align='justify')
para('[Gambar 4.1 — Sisipkan tangkapan layar ERD dari MySQL Workbench di sini]', italic=True, align='center')

h2('4.3 Perancangan Kelas (Class Diagram)')
para('Kelas inti sistem:', align='justify')
bullet('User (abstrak): atribut id, username, passwordHash, namaLengkap; method abstrak bolehAksesLaporan(Laporan).')
bullet('Pelapor extends User: bolehAksesLaporan() mengembalikan true hanya jika laporan miliknya sendiri.')
bullet('Petugas extends User: bolehAksesLaporan() mengembalikan true jika laporan tersebut di-assign kepadanya.')
bullet('Laporan: entitas laporan dengan nomor_laporan yang digenerate otomatis berformat LAP-YYYYMMDD-XXXX.')
bullet('Pesan, TindakLanjut: entitas pendukung komunikasi dan riwayat penanganan.')
bullet('LaporanService: kelas logika bisnis yang dipanggil semua Servlet.')
para('[Gambar 4.2 — Sisipkan class diagram di sini (dibuat dengan draw.io/StarUML)]', italic=True, align='center')

h2('4.4 Perancangan Antarmuka')
para('Halaman yang dirancang:', align='justify')
add_table(
    rows=[
        ('home.jsp', 'Beranda: pengenalan layanan, tombol masuk/daftar'),
        ('login.jsp / register.jsp', 'Autentikasi dan pendaftaran akun'),
        ('pelapor_dashboard.jsp', 'Daftar laporan milik pelapor + status + tombol buat laporan'),
        ('laporan_form.jsp', 'Formulir laporan baru dengan opsi sembunyikan identitas'),
        ('laporan_detail.jsp', 'Detail laporan, riwayat status, tindak lanjut, ruang pesan'),
        ('petugas_dashboard.jsp', 'Antrian laporan belum ditangani + daftar laporan milik petugas'),
    ],
    headers=['Halaman', 'Fungsi'],
    widths=[5.5, 9.0]
)
para('[Gambar 4.3 — Sisipkan tangkapan layar halaman utama di sini]', italic=True, align='center')

# =========================================================
# BAB 5 IMPLEMENTASI
# =========================================================
doc.add_page_break()
h1('BAB 5 IMPLEMENTASI')

h2('5.1 Struktur Proyek')
code('sistem-pelaporan/')
code('├── src/main/java/com/sistem/')
code('│   ├── model/        (User, Pelapor, Petugas, Laporan, Pesan, TindakLanjut, LoginResult)')
code('│   ├── dao/          (UserDAO, LaporanDAO, PesanDAO, TindakLanjutDAO)')
code('│   ├── service/      (LaporanService, AppInitializer)')
code('│   ├── controller/   (10 Servlet)')
code('│   └── util/         (DBConnection, PasswordUtil, HtmlUtil)')
code('├── src/main/webapp/')
code('│   ├── WEB-INF/  (web.xml, views/*.jsp, lib/mysql-connector-j)')
code('│   ├── css/style.css')
code('│   └── index → home.jsp')
code('├── sql/schema.sql')
code('└── build.bat')

h2('5.2 Implementasi Kelas Model')
para('Contoh penerapan inheritance dan polymorphism pada kelas User:', align='justify')
code('public abstract class User {')
code('    private int id;')
code('    private String username;')
code('    private String passwordHash;')
code('    private String namaLengkap;')
code('')
code('    public abstract boolean bolehAksesLaporan(Laporan laporan);')
code('    // getter & setter ...')
code('}')
para('Subclass Pelapor dan Petugas meng-override bolehAksesLaporan() dengan aturan berbeda', align='justify')

h2('5.3 Implementasi Layer DAO')
para('Seluruh DAO menggunakan JDBC PreparedStatement. Contoh:', align='justify')
code('String sql = "INSERT INTO laporan (nomor_laporan, id_pelapor, judul, ...) VALUES (?, ?, ?, ...)";')
code('try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {')
code('    ps.setString(1, laporan.getNomorLaporan());')
code('    ps.setInt(2, laporan.getIdPelapor());')
code('    ps.setString(3, laporan.getJudul());')
code('    ps.executeUpdate();')
code('}')

h2('5.4 Implementasi Layer Service')
para('LaporanService menampung aturan bisnis: verifikasi laporan, perubahan status (dengan validasi transisi status yang sah), penambahan tindak lanjut, dan pengiriman pesan. AppInitializer memastikan akun petugas default tersedia saat aplikasi pertama kali dijalankan (username: petugas, password awal: Petugas123!).', align='justify')

h2('5.5 Implementasi Servlet Controller')
para('Sepuluh Servlet bertugas sebagai controller. Setiap Servlet memeriksa sesi login dan memanggil method polymorphic bolehAksesLaporan() sebelum menampilkan atau mengubah data. Contoh alur LaporanServlet:', align='justify')
code('HttpSession session = request.getSession(false);')
code('User user = (User) session.getAttribute("user");')
code('Laporan laporan = laporanDAO.getById(id);')
code('if (laporan == null || !user.bolehAksesLaporan(laporan)) {')
code('    response.sendError(HttpServletResponse.SC_FORBIDDEN);')
code('    return;')
code('}')

h2('5.6 Implementasi Antarmuka (JSP)')
para('Tujuh halaman JSP menyajikan data dengan escaping untuk mencegah XSS:', align='justify')
code('${HtmlUtil.escape(laporan.getJudul())}  →  memastikan karakter khusus HTML aman')
para('Tampilan memakai CSS responsif dengan komponen: kartu laporan, badge status berwarna, formulir, dan ruang pesan.', align='justify')

h2('5.7 Implementasi Keamanan')
bullet('PasswordUtil: has password dengan PBKDF2WithHmacSHA256 (salt acak, iterasi tinggi) dan verifikasi saat login.')
bullet('HtmlUtil.escape(): membold Apex semua teks masukan pengguna sebelum dirender ke HTML.')
bullet('Kontrol akses: tanpa login, semua halaman dialihkan ke halaman masuk; pelapor hanya melihat laporannya sendiri; petugas melihat antrian dan laporan yang ditangani.')
bullet('Nomor laporan otomatis: menghindari tumpang tindih dan memudahkan referensi kasus.')

# =========================================================
# BAB 6 PENGUJIAN
# =========================================================
doc.add_page_break()
h1('BAB 6 PENGUJIAN')

h2('6.1 Metode Pengujian')
para('Pengujian dilakukan dengan metode black-box testing: membandingkan keluaran sistem dengan hasil yang diharapkan untuk tiap skenario.', align='justify')

h2('6.2 Skenario dan Hasil Pengujian Fungsional')
add_table(
    rows=[
        ('TC-01', 'Registrasi akun pelapor baru dengan data lengkap', 'Akun terbentuk dan dapat login', 'Berhasil'),
        ('TC-02', 'Login dengan password salah', 'Muncul pesan kesalahan, tidak masuk', 'Berhasil'),
        ('TC-03', 'Membuat laporan tanpa login', 'Dialihkan ke halaman login', 'Berhasil'),
        ('TC-04', 'Membuat laporan dengan opsi sembunyikan identitas', 'Laporan tersimpan; nama pelapor tidak tampil bagi petugas', 'Berhasil'),
        ('TC-05', 'Pelapor membuka laporan milik orang lain', 'Akses ditolak (403)', 'Berhasil'),
        ('TC-06', 'Petugas mengambil laporan dari antrian', 'Laporan ter-assign ke petugas', 'Berhasil'),
        ('TC-07', 'Petugas mengubah status laporan', 'Status berubah dan tercatat waktu perubahan', 'Berhasil'),
        ('TC-08', 'Petugas menambah tindak lanjut', 'Catatan tersimpan dan tampil pada detail', 'Berhasil'),
        ('TC-09', 'Pertukaran pesan pelapor–petugas', 'Pesan tampil urut berdasarkan waktu', 'Berhasil'),
        ('TC-10', 'Logout kemudian menekan tombol back', 'Sesi hangus, dialihkan ke login', 'Berhasil'),
    ],
    headers=['Kode', 'Skenario', 'Hasil Diharapkan', 'Status'],
    widths=[1.7, 5.8, 5.2, 2.3]
)

h2('6.3 Pengujian Keamanan')
add_table(
    rows=[
        ('SQL Injection', 'Input \' OR 1=1 -- pada formulir login', 'Login ditolak; input diperlakukan sebagai teks biasa'),
        ('XSS', 'Input <script>alert(1)</script> pada judul laporan', 'Teks dirender aman, skrip tidak dieksekusi'),
        ('Brute Force password', 'Percobaan kombinasi password', 'Password tersimpan sebagai hash, tidak dapat dibaca langsung'),
        ('Akses Lintas Role', 'Pelapor membuka URL milik petugas', 'Akses ditolak, dialihkan ke dashboard masing-masing'),
    ],
    headers=['Aspek', 'Pengujian', 'Hasil'],
    widths=[3.0, 6.0, 6.0]
)
para('[Gambar 6.1 — Sisipkan tangkapan layar halaman login di sini]', italic=True, align='center')

# =========================================================
# BAB 7 PENDEPLOYAN
# =========================================================
doc.add_page_break()
h1('BAB 7 PENDEPLOYAN')

h2('7.1 Deployment Lokal')
para('Langkah menjalankan sistem pada komputer lokal:', align='justify')
para('Langkah 1 — Siapkan basis data. Jalankan script schema.sql pada MySQL:', align='justify')
code('mysql -u root -p < sql/schema.sql')
para('Langkah 2 — Jalankan melalui IntelliJ dengan plugin Smart Tomcat (deployment directory mengarah ke src/main/webapp, context path /sistem-pelaporan) atau melalui build.bat lalu salin hasil build ke folder webapps milik Apache Tomcat 10.1.', align='justify')
para('Langkah 3 — Akses sistem melalui browser:', align='justify')
code('http://localhost:8080/sistem-pelaporan/')
para('Akun petugas default secara otomatis dibuat saat aplikasi pertama kali dijalankan (username petugas, password Petugas123!). Segera ganti kata sandi melalui menu profil setelah digunakan.', align='justify')

h2('7.2 Deployment ke Server Kampus')
para('Untuk ketersediaan bagi seluruh civitas akademika UNSOED, sistem dapat dideploy pada server kampus (atau layanan cloud gratis seperti Oracle Cloud Always Free) dengan topologi: Nginx sebagai reverse proxy → Apache Tomcat 10.1 → MySQL 8.0. Akses dilindungi melalui jaringan internal kampus atau VPN agar sesuai dengan batasan masalah.', align='justify')

# =========================================================
# BAB 8 PENUTUP
# =========================================================
doc.add_page_break()
h1('BAB 8 PENUTUP')

h2('8.1 Kesimpulan')
bullet('Sistem pelaporan PPKS berhasil dibangun dengan Java murni berbasis PBO tanpa framework, meliputi 26 kelas Java, 10 Servlet, dan 7 halaman JSP.')
bullet('Empat pilar OOP (enkapsulasi, inheritance, polymorphism, abstraction) diterapkan secara nyata, terutama pada hierarki User–Pelapor–Petugas dengan method polymorphic bolehAksesLaporan().')
bullet('Fitur utama berjalan: registrasi, login, pelaporan dengan opsi anonim, pelacakan empat status, tindak lanjut, dan pertukaran pesan.')
bullet('Keamanan dasar terpenuhi: hashing password PBKDF2, PreparedStatement terhadap SQL injection, escaping XSS, dan kontrol akses berbasis peran.')

h2('8.2 Saran')
bullet('Menambahkan unggah bukti (foto/dokumen) dengan penyimpanan terenkripsi.')
bullet('Menambahkan notifikasi email kepada petugas saat laporan baru masuk.')
bullet('Integrasi SSO UNSOED untuk autentikasi.')
bullet('Menambahkan dashboard statistik kasus untuk pengambilan keputusan gugus tugas.')
bullet('Implementasi pesan real-time menggunakan WebSocket.')

doc.save(r'C:\Users\Lenovo\sistem-pelaporan\laporan-pbo.docx')
print('OK')
