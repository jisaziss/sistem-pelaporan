-- ========================================================
-- SISTEM PELAPORAN PPKS UNSOED - DATABASE SCHEMA + DATA AWAL
-- ========================================================

-- Buat database jika belum ada
CREATE DATABASE IF NOT EXISTS sistem_pelaporan CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE sistem_pelaporan;

-- 1. Table Users (Pelapor & Petugas)
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    nama VARCHAR(150) NOT NULL,
    role ENUM('PELAPOR', 'PETUGAS') NOT NULL,
    nim_nip VARCHAR(50) DEFAULT NULL,
    unit_prodi VARCHAR(100) DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_username (username),
    INDEX idx_role (role)
) ENGINE=InnoDB;

-- 2. Table Laporan
CREATE TABLE IF NOT EXISTS laporan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pelapor_id INT NOT NULL,
    petugas_id INT DEFAULT NULL,
    nomor_laporan VARCHAR(50) NOT NULL UNIQUE,
    judul VARCHAR(255) NOT NULL,
    kategori VARCHAR(100) NOT NULL,
    kronologi TEXT NOT NULL,
    lokasi VARCHAR(255),
    tanggal_kejadian VARCHAR(50),
    sembunyikan_identitas BOOLEAN DEFAULT FALSE,
    status VARCHAR(50) DEFAULT 'Menunggu Verifikasi',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (pelapor_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (petugas_id) REFERENCES users(id) ON DELETE SET NULL,
    INDEX idx_pelapor (pelapor_id),
    INDEX idx_petugas (petugas_id),
    INDEX idx_status (status)
) ENGINE=InnoDB;

-- 3. Table Bukti Laporan (Foto/Video)
CREATE TABLE IF NOT EXISTS bukti_laporan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    laporan_id INT NOT NULL,
    jenis VARCHAR(20) NOT NULL,
    file_path VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (laporan_id) REFERENCES laporan(id) ON DELETE CASCADE,
    INDEX idx_laporan (laporan_id)
) ENGINE=InnoDB;

-- 4. Table Tindak Lanjut Petugas
CREATE TABLE IF NOT EXISTS tindak_lanjut (
    id INT AUTO_INCREMENT PRIMARY KEY,
    laporan_id INT NOT NULL,
    petugas_id INT NOT NULL,
    catatan TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (laporan_id) REFERENCES laporan(id) ON DELETE CASCADE,
    FOREIGN KEY (petugas_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_laporan (laporan_id)
) ENGINE=InnoDB;

-- 5. Table Pesan / Chat
CREATE TABLE IF NOT EXISTS pesan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    laporan_id INT NOT NULL,
    pengirim_id INT NOT NULL,
    isi TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (laporan_id) REFERENCES laporan(id) ON DELETE CASCADE,
    FOREIGN KEY (pengirim_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_laporan (laporan_id)
) ENGINE=InnoDB;

-- ========================================================
-- DATA AWAL (SEED)
-- Akun Petugas Default: username = petugas, password = Petugas123!
-- (PBKDF2 Hashed Password)
-- ========================================================
INSERT INTO users (username, password_hash, nama, role)
SELECT 'petugas', '1000:a1b2c3d4e5f6:7e8d9c0b1a2f3e4d5c6b7a8f9e0d1c2b3a4f5e6d7c8b9a0f1e2d3c4b5a6f7e8d', 'Petugas PPKS', 'PETUGAS'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM users WHERE username = 'petugas');
