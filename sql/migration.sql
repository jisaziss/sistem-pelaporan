-- Jalankan sekali pada database yang sudah ada (upgrade fitur bukti foto/video):
USE sistem_pelaporan;

-- Tambah kolom nomor laporan jika belum ada
-- Cek dulu: DESCRIBE laporan; jika kolom nomor_laporan belum ada, jalankan:
ALTER TABLE laporan ADD COLUMN nomor_laporan VARCHAR(50) NOT NULL UNIQUE AFTER pelapor_id;

-- Tabel bukti laporan (foto/video)
CREATE TABLE IF NOT EXISTS bukti_laporan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    laporan_id INT NOT NULL,
    jenis ENUM('FOTO', 'VIDEO') NOT NULL,
    file_path VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (laporan_id) REFERENCES laporan(id)
);

-- Isi nomor laporan untuk data lama
UPDATE laporan SET nomor_laporan = CONCAT('LP-', id) WHERE nomor_laporan = '' OR nomor_laporan IS NULL;
