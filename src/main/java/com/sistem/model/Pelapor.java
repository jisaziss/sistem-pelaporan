package com.sistem.model;

public class Pelapor extends User {
    private String nim;
    private String prodi;

    public Pelapor() {
        super();
        this.role = "PELAPOR";
    }

    public Pelapor(int id, String username, String nama, String nim, String prodi) {
        super(id, username, nama, "PELAPOR");
        this.nim = nim;
        this.prodi = prodi;
    }

    public String getNim() {
        return nim;
    }

    public void setNim(String nim) {
        this.nim = nim;
    }

    public String getProdi() {
        return prodi;
    }

    public void setProdi(String prodi) {
        this.prodi = prodi;
    }

    @Override
    public String getIdentifier() {
        return "NIM: " + nim;
    }

    @Override
    public boolean bolehAksesLaporan(Laporan laporan) {
        return laporan != null && laporan.getPelaporId() == getId();
    }
}
