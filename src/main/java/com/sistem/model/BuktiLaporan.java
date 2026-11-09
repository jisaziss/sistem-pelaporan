package com.sistem.model;

import java.sql.Timestamp;

public class BuktiLaporan {
    private int id;
    private int laporanId;
    private String jenis; // FOTO or VIDEO
    private String filePath;
    private Timestamp createdAt;

    public BuktiLaporan() {}

    public BuktiLaporan(int laporanId, String jenis, String filePath) {
        this.laporanId = laporanId;
        this.jenis = jenis;
        this.filePath = filePath;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getLaporanId() { return laporanId; }
    public void setLaporanId(int laporanId) { this.laporanId = laporanId; }

    public String getJenis() { return jenis; }
    public void setJenis(String jenis) { this.jenis = jenis; }

    public String getFilePath() { return filePath; }
    public void setFilePath(String filePath) { this.filePath = filePath; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}
