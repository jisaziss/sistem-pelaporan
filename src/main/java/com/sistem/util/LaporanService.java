package com.sistem.util;

import com.sistem.dao.LaporanDAO;
import com.sistem.dao.PesanDAO;
import com.sistem.dao.TindakLanjutDAO;
import com.sistem.model.*;
import java.util.List;

public class LaporanService {
    private LaporanDAO laporanDAO = new LaporanDAO();
    private TindakLanjutDAO tindakLanjutDAO = new TindakLanjutDAO();
    private PesanDAO pesanDAO = new PesanDAO();

    public boolean buatLaporan(Pelapor p, String judul, String kategori, String kronologi, String lokasi, String tgl, boolean sembunyi) {
        Laporan l = new Laporan(p.getId(), judul, kategori, kronologi, lokasi, tgl, sembunyi);
        return laporanDAO.createLaporan(l);
    }

    public List<Laporan> getDaftarLaporan(User user) {
        if (user instanceof Pelapor) {
            return laporanDAO.getLaporanByPelapor(user.getId());
        } else if (user instanceof Petugas) {
            // Petugas melihat antrean (unassigned) + yang ditugaskan ke dirinya
            List<Laporan> list = laporanDAO.getLaporanBelumDitugaskan();
            list.addAll(laporanDAO.getLaporanByPetugas(user.getId()));
            return list;
        }
        return null;
    }

    public Laporan getDetailLaporan(User user, int id) {
        Laporan l = laporanDAO.getLaporanById(id);
        if (l != null && user.bolehAksesLaporan(l)) {
            return l;
        }
        return null;
    }

    public boolean verifikasiLaporan(int id, Petugas p) {
        Laporan l = laporanDAO.getLaporanById(id);
        if (l != null && "MENUNGGU_VERIFIKASI".equals(l.getStatus())) {
            return laporanDAO.updateStatus(id, "DALAM_PENANGANAN", p.getId());
        }
        return false;
    }

    public boolean updateStatus(int id, String statusBaru, Petugas p) {
        Laporan l = laporanDAO.getLaporanById(id);
        if (l != null && userBolehEdit(p, l)) {
            return laporanDAO.updateStatus(id, statusBaru, p.getId());
        }
        return false;
    }

    public boolean tambahTindakLanjut(int id, String catatan, Petugas p) {
        Laporan l = laporanDAO.getLaporanById(id);
        if (l != null && userBolehEdit(p, l)) {
            TindakLanjut tl = new TindakLanjut(id, p.getId(), catatan);
            return tindakLanjutDAO.createTindakLanjut(tl);
        }
        return false;
    }

    public boolean kirimPesan(int id, String isi, User pengirim) {
        Laporan l = laporanDAO.getLaporanById(id);
        if (l != null && pengirim.bolehAksesLaporan(l)) {
            Pesan pesan = new Pesan(id, pengirim.getId(), isi);
            return pesanDAO.createPesan(pesan);
        }
        return false;
    }

    private boolean userBolehEdit(Petugas p, Laporan l) {
        // Petugas boleh edit jika sudah ditugaskan ke dirinya
        return l.getPetugasId() != null && l.getPetugasId() == p.getId();
    }
    
    public String formatNamaPelapor(User viewer, Laporan l) {
        if (l.isSembunyikanIdentitas() && viewer instanceof Petugas) {
            return "Identitas Dirahasiakan";
        }
        return l.getPelaporNama();
    }
}
