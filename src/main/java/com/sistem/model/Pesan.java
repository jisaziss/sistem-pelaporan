package com.sistem.model;

import java.sql.Timestamp;

public class Pesan {
    private int id;
    private int laporanId;
    private int pengirimId;
    private String isi;
    private Timestamp createdAt;
    private String namaPengirim;
    private String rolePengirim;

    public Pesan() {}

    public Pesan(int laporanId, int pengirimId, String isi) {
        this.laporanId = laporanId;
        this.pengirimId = pengirimId;
        this.isi = isi;
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

    public int getPengirimId() {
        return pengirimId;
    }

    public void setPengirimId(int pengirimId) {
        this.pengirimId = pengirimId;
    }

    public String getIsi() {
        return isi;
    }

    public void setIsi(String isi) {
        this.isi = isi;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public String getNamaPengirim() {
        return namaPengirim;
    }

    public void setNamaPengirim(String namaPengirim) {
        this.namaPengirim = namaPengirim;
    }

    public String getRolePengirim() {
        return rolePengirim;
    }

    public void setRolePengirim(String rolePengirim) {
        this.rolePengirim = rolePengirim;
    }
}
