# 🛡️ Sistem Pelaporan PPKS UNSOED

Sistem Pelaporan Pencegahan & Penanganan Kekerasan Seksual (PPKS) Universitas Jenderal Soedirman berbasis Java Web (Servlet/JSP) tanpa framework (Native OOP Architecture).

---

## 🛠️ Prasyarat & Link Download

Sebelum menjalankan proyek ini, pastikan perangkat Anda telah terinstall perangkat lunak berikut:

1. **JDK (Java Development Kit) 17+**
   - 📥 [Download OpenJDK 17](https://adoptium.net/temurin/releases/?version=17)
2. **Apache Tomcat 10.1+** *(Jakarta EE 10 Compatible)*
   - 📥 [Download Apache Tomcat 10.1](https://tomcat.apache.org/download-10.html)
3. **MySQL Community Server 8.0+**
   - 📥 [Download MySQL Installer](https://dev.mysql.com/downloads/installer/)
4. **Git**
   - 📥 [Download Git](https://git-scm.com/downloads)
5. **IDE (Opsional)**
   - 📥 [Download IntelliJ IDEA Community Edition](https://www.jetbrains.org/intellij/download/) *(Disarankan, gunakan plugin **Smart Tomcat**)*

---

## 🚀 Langkah Instalasi & Memulai

### 1. Kloning Repository
Buka terminal/Command Prompt dan jalankan:
```bash
git clone https://github.com/jisaziss/sistem-pelaporan.git
cd sistem-pelaporan
```

---

### 2. Konfigurasi Database MySQL

1. Buka MySQL Client / phpMyAdmin / DBeaver / Navicat.
2. Import file SQL utama yang ada di proyek:
   ```bash
   mysql -u root -p < sql/app.sql
   ```
   *Atau jalankan seluruh isi file `sql/app.sql` melalui GUI MySQL Anda.*

3. Sesuaikan kredensial koneksi database pada file:
   `src/main/java/com/sistem/util/DBConnection.java`
   ```java
   private static final String URL = "jdbc:mysql://localhost:3306/sistem_pelaporan";
   private static final String USER = "root";       // Ganti dengan username MySQL Anda
   private static final String PASSWORD = "password"; // Ganti dengan password MySQL Anda
   ```

---

### 3. Konfigurasi Directory File Upload (Lampiran Bukti)
Secara default, file bukti (foto/video) disimpan di folder lokal:
- `C:\sistem-pelaporan-uploads` (Windows)
- `/tmp/sistem-pelaporan-uploads` (Linux/macOS)

Folder ini akan dibuat otomatis oleh aplikasi saat pertama kali ada file bukti diunggah.

---

### 4. Menjalankan Aplikasi

#### Cara A: Menggunakan IntelliJ IDEA + Smart Tomcat (Disarankan)
1. Buka folder `sistem-pelaporan` di IntelliJ IDEA.
2. Install plugin **Smart Tomcat** via `Settings` -> `Plugins`.
3. Tambah Run Configuration:
   - **Name**: Smart Tomcat
   - **Tomcat Server**: Pilih lokasi instalasi Tomcat 10.1 Anda
   - **Deployment Directory**: Pilih folder `src/main/webapp`
   - **Context Path**: `/sistem-pelaporan`
4. Klik **Run** atau press `Shift + F10`.

#### Cara B: Menggunakan Script Build Manual (`build.bat`)
1. Buka file `build.bat` dan sesuaikan path `TOMCAT_HOME` ke lokasi Tomcat Anda.
2. Jalankan script:
   ```cmd
   build.bat
   ```
3. Copy file `dist/sistem-pelaporan.war` yang terbentuk ke folder `webapps` di Tomcat Anda.
4. Jalankan Tomcat (`startup.bat` di folder `bin` Tomcat).

---

## 🔑 Akun Default

Setelah database di-import via `sql/app.sql`, akun default berikut sudah siap digunakan:

| Role | Username | Password | Keterangan |
| :--- | :--- | :--- | :--- |
| **Petugas** | `petugas` | `Petugas123!` | Akses dashboard petugas, verifikasi & tindak lanjut |
| **Pelapor** | *(Daftar Sendiri)* | *(Bebas)* | Melalui halaman Registrasi di aplikasi |

---

## 🌐 Akses Aplikasi

Buka browser dan kunjungi:
```text
http://localhost:8080/sistem-pelaporan
```

---

## 📁 Struktur Direktori

```text
sistem-pelaporan/
├── sql/
│   └── app.sql                 # Schema & Initial Seed Data
├── src/
│   └── main/
│       ├── java/com/sistem/    # Native Java Servlets, DAO, Model, & Utilities
│       └── webapp/             # JSP Views, Tailwind CSS, & Static Assets (Images)
├── build.bat                   # Script Kompilasi & Packaging Manual
└── README.md                   # Panduan Proyek
```

---

## 📜 Lisensi & Penggunaan
Dibuat untuk memenuhi Tugas Proyek Pemrograman Berbasis Objek (PBO) - Universitas Jenderal Soedirman.
