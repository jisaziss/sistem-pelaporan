package com.sistem.controller;

import com.sistem.model.Petugas;
import com.sistem.model.User;
import com.sistem.util.LaporanService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/petugas/laporan/aksi")
public class PetugasAksiServlet extends HttpServlet {
    private LaporanService service = new LaporanService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User u = (User) req.getSession().getAttribute("user");
        if (!(u instanceof Petugas)) { resp.sendRedirect(req.getContextPath() + "/login"); return; }

        Petugas p = (Petugas) u;
        int id = Integer.parseInt(req.getParameter("id"));
        String aksi = req.getParameter("aksi");

        if ("verifikasi".equals(aksi)) {
            service.verifikasiLaporan(id, p);
        } else if ("update_status".equals(aksi)) {
            String status = req.getParameter("status");
            service.updateStatus(id, status, p);
        } else if ("tambah_tindak_lanjut".equals(aksi)) {
            String catatan = req.getParameter("catatan");
            if (catatan != null && !catatan.trim().isEmpty()) {
                service.tambahTindakLanjut(id, catatan.trim(), p);
            }
        }

        resp.sendRedirect(req.getContextPath() + "/laporan/detail?id=" + id);
    }
}
