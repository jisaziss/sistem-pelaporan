CREATE DATABASE IF NOT EXISTS sistem_pelaporan;
USE sistem_pelaporan;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    nama VARCHAR(100) NOT NULL,
    role ENUM('PELAPOR', 'PETUGAS') NOT NULL,
    nim_nip VARCHAR(50),
    unit_prodi VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS laporan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pelapor_id INT NOT NULL,
    judul VARCHAR(255) NOT NULL,
    kategori VARCHAR(100) NOT NULL,
    kronologi TEXT NOT NULL,
    lokasi VARCHAR(255),
    tanggal_kejadian DATE,
    sembunyikan_identitas BOOLEAN DEFAULT FALSE,
    status ENUM('MENUNGGU_VERIFIKASI', 'PERLU_INFORMASI', 'DALAM_PENANGANAN', 'SELESAI') DEFAULT 'MENUNGGU_VERIFIKASI',
    petugas_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (pelapor_id) REFERENCES users(id),
    FOREIGN KEY (petugas_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS tindak_lanjut (
    id INT AUTO_INCREMENT PRIMARY KEY,
    laporan_id INT NOT NULL,
    petugas_id INT NOT NULL,
    catatan TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (laporan_id) REFERENCES laporan(id),
    FOREIGN KEY (petugas_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS pesan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    laporan_id INT NOT NULL,
    pengirim_id INT NOT NULL,
    isi TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (laporan_id) REFERENCES laporan(id),
    FOREIGN KEY (pengirim_id) REFERENCES users(id)
);

-- Akun petugas pertama otomatis dibuat oleh AppInitializer saat aplikasi dijalankan:
--   username : petugas
--   password : Petugas123!
