package com.sistem.model;

public class Petugas extends User {
    private String nip;
    private String unit;

    public Petugas() {
        super();
        this.role = "PETUGAS";
    }

    public Petugas(int id, String username, String nama, String nip, String unit) {
        super(id, username, nama, "PETUGAS");
        this.nip = nip;
        this.unit = unit;
    }

    public String getNip() {
        return nip;
    }

    public void setNip(String nip) {
        this.nip = nip;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    @Override
    public String getIdentifier() {
        return "NIP: " + nip;
    }

    @Override
    public boolean bolehAksesLaporan(Laporan laporan) {
        if (laporan == null) {
            return false;
        }
        // Laporan belum ditugaskan boleh dilihat semua petugas (antrean),
        // laporan yang sudah ditugaskan hanya boleh diakses petugas pemegangnya.
        return laporan.getPetugasId() == null || laporan.getPetugasId() == getId();
    }
}
