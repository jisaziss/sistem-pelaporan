package com.sistem.model;

import java.sql.Timestamp;

public class Laporan {
    private int id;
    private int pelaporId;
    private String judul;
    private String kategori;
    private String kronologi;
    private String lokasi;
    private String tanggalKejadian;
    private boolean sembunyikanIdentitas;
    private String status;
    private Integer petugasId;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    private String pelaporNama;
    private String petugasNama;

    public Laporan() {}

    public Laporan(int pelaporId, String judul, String kategori, String kronologi, 
                   String lokasi, String tanggalKejadian, boolean sembunyikanIdentitas) {
        this.pelaporId = pelaporId;
        this.judul = judul;
        this.kategori = kategori;
        this.kronologi = kronologi;
        this.lokasi = lokasi;
        this.tanggalKejadian = tanggalKejadian;
        this.sembunyikanIdentitas = sembunyikanIdentitas;
        this.status = "MENUNGGU_VERIFIKASI";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPelaporId() {
        return pelaporId;
    }

    public void setPelaporId(int pelaporId) {
        this.pelaporId = pelaporId;
    }

    public String getJudul() {
        return judul;
    }

    public void setJudul(String judul) {
        this.judul = judul;
    }

    public String getKategori() {
        return kategori;
    }

    public void setKategori(String kategori) {
        this.kategori = kategori;
    }

    public String getKronologi() {
        return kronologi;
    }

    public void setKronologi(String kronologi) {
        this.kronologi = kronologi;
    }

    public String getLokasi() {
        return lokasi;
    }

    public void setLokasi(String lokasi) {
        this.lokasi = lokasi;
    }

    public String getTanggalKejadian() {
        return tanggalKejadian;
    }

    public void setTanggalKejadian(String tanggalKejadian) {
        this.tanggalKejadian = tanggalKejadian;
    }

    public boolean isSembunyikanIdentitas() {
        return sembunyikanIdentitas;
    }

    public void setSembunyikanIdentitas(boolean sembunyikanIdentitas) {
        this.sembunyikanIdentitas = sembunyikanIdentitas;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getPetugasId() {
        return petugasId;
    }

    public void setPetugasId(Integer petugasId) {
        this.petugasId = petugasId;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getPelaporNama() {
        return pelaporNama;
    }

    public void setPelaporNama(String pelaporNama) {
        this.pelaporNama = pelaporNama;
    }

    public String getPetugasNama() {
        return petugasNama;
    }

    public void setPetugasNama(String petugasNama) {
        this.petugasNama = petugasNama;
    }

    public String getStatusDisplay() {
        switch (status) {
            case "MENUNGGU_VERIFIKASI": return "Menunggu Verifikasi";
            case "PERLU_INFORMASI": return "Perlu Informasi";
            case "DALAM_PENANGANAN": return "Dalam Penanganan";
            case "SELESAI": return "Selesai";
            default: return status;
        }
    }
}
