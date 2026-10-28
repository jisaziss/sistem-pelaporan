package com.sistem.model;

import java.sql.Timestamp;

public class TindakLanjut {
    private int id;
    private int laporanId;
    private int petugasId;
    private String catatan;
    private Timestamp createdAt;
    private String namaPetugas;

    public TindakLanjut() {}

    public TindakLanjut(int laporanId, int petugasId, String catatan) {
        this.laporanId = laporanId;
        this.petugasId = petugasId;
        this.catatan = catatan;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLaporanId() {
        return laporanId;
    }

    public void setLaporanId(int laporanId) {
        this.laporanId = laporanId;
    }

    public int getPetugasId() {
        return petugasId;
    }

    public void setPetugasId(int petugasId) {
        this.petugasId = petugasId;
    }

    public String getCatatan() {
        return catatan;
    }

    public void setCatatan(String catatan) {
        this.catatan = catatan;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public String getNamaPetugas() {
        return namaPetugas;
    }

    public void setNamaPetugas(String namaPetugas) {
        this.namaPetugas = namaPetugas;
    }
}
