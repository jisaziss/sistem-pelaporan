package com.sistem.model;

public abstract class User {
    protected int id;
    protected String username;
    protected String nama;
    protected String role;

    public User() {}

    public User(int id, String username, String nama, String role) {
        this.id = id;
        this.username = username;
        this.nama = nama;
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public abstract String getIdentifier();

    public abstract boolean bolehAksesLaporan(Laporan laporan);
}
