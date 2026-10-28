package com.sistem.controller;

import com.sistem.model.Pelapor;
import com.sistem.model.User;
import com.sistem.util.LaporanService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/pelapor/laporan/baru")
public class LaporanFormServlet extends HttpServlet {
    private LaporanService service = new LaporanService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User u = (User) req.getSession().getAttribute("user");
        if (!(u instanceof Pelapor)) { resp.sendRedirect(req.getContextPath() + "/login"); return; }
        req.getRequestDispatcher("/WEB-INF/views/laporan_form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Pelapor p = (Pelapor) req.getSession().getAttribute("user");
        String judul = req.getParameter("judul");
        String kat = req.getParameter("kategori");
        String krono = req.getParameter("kronologi");
        String lok = req.getParameter("lokasi");
        String tgl = req.getParameter("tanggal_kejadian");
        boolean sembunyi = req.getParameter("sembunyikan_identitas") != null;

        service.buatLaporan(p, judul, kat, krono, lok, tgl, sembunyi);
        resp.sendRedirect(req.getContextPath() + "/pelapor/dashboard");
    }
}
