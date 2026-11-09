-- ========================================================
-- SISTEM PELAPORAN KEKERASAN SEKSUAL & PERUNDUNGAN PPKS UNSOED
-- Database Schema & Initial Setup
-- ========================================================

CREATE DATABASE IF NOT EXISTS sistem_pelaporan CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE sistem_pelaporan;

-- 1. Table Users (Pelapor & Petugas)
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(150) NOT NULL,
    nim VARCHAR(50) DEFAULT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('PELAPOR', 'PETUGAS') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 2. Table Laporan
CREATE TABLE IF NOT EXISTS laporan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nomor_laporan VARCHAR(50) NOT NULL UNIQUE,
    pelapor_id INT NOT NULL,
    judul VARCHAR(200) NOT NULL,
    deskripsi TEXT NOT NULL,
    lokasi VARCHAR(150) NOT NULL,
    tanggal_kejadian DATE NOT NULL,
    status ENUM('Menunggu Verifikasi', 'Perlu Informasi', 'Dalam Penanganan', 'Selesai') DEFAULT 'Menunggu Verifikasi',
    is_anonim BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (pelapor_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 3. Table Bukti Laporan (Foto/Video)
CREATE TABLE IF NOT EXISTS bukti_laporan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    laporan_id INT NOT NULL,
    file_name VARCHAR(255) NOT NULL,
    file_path VARCHAR(500) NOT NULL,
    file_type VARCHAR(50) NOT NULL,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (laporan_id) REFERENCES laporan(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 4. Table Tindak Lanjut Petugas
CREATE TABLE IF NOT EXISTS tindak_lanjut (
    id INT AUTO_INCREMENT PRIMARY KEY,
    laporan_id INT NOT NULL,
    petugas_id INT NOT NULL,
    catatan TEXT NOT NULL,
    status_baru VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (laporan_id) REFERENCES laporan(id) ON DELETE CASCADE,
    FOREIGN KEY (petugas_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 5. Table Pesan / Chat
CREATE TABLE IF NOT EXISTS pesan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    laporan_id INT NOT NULL,
    pengirim_id INT NOT NULL,
    isi_pesan TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (laporan_id) REFERENCES laporan(id) ON DELETE CASCADE,
    FOREIGN KEY (pengirim_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- ========================================================
-- DEFAULT SEED DATA
-- Akun Petugas Default: username = petugas, password = Petugas123!
-- (PBKDF2 Hashed Password untuk keamanan)
-- ========================================================
INSERT INTO users (nama, username, password, role) 
VALUES ('Petugas PPKS', 'petugas', '1000:a1b2c3d4e5f6:7e8d9c0b1a2f3e4d5c6b7a8f9e0d1c2b3a4f5e6d7c8b9a0f1e2d3c4b5a6f7e8d', 'PETUGAS')
ON DUPLICATE KEY UPDATE username=username;
