package com.sistem.controller;

import com.sistem.dao.PesanDAO;
import com.sistem.dao.TindakLanjutDAO;
import com.sistem.model.Laporan;
import com.sistem.model.User;
import com.sistem.util.LaporanService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/laporan/detail")
public class LaporanDetailServlet extends HttpServlet {
    private LaporanService service = new LaporanService();
    private TindakLanjutDAO tindakLanjutDAO = new TindakLanjutDAO();
    private PesanDAO pesanDAO = new PesanDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User u = (User) req.getSession().getAttribute("user");
        if (u == null) { resp.sendRedirect(req.getContextPath() + "/login"); return; }

        int id = Integer.parseInt(req.getParameter("id"));
        Laporan l = service.getDetailLaporan(u, id);
        
        if (l == null) {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Akses ditolak atau laporan tidak ditemukan");
            return;
        }

        req.setAttribute("laporan", l);
        req.setAttribute("namaPelaporDisplay", service.formatNamaPelapor(u, l));
        req.setAttribute("tindakLanjutList", tindakLanjutDAO.getTindakLanjutByLaporan(id));
        req.setAttribute("pesanList", pesanDAO.getPesanByLaporan(id));

        req.getRequestDispatcher("/WEB-INF/views/laporan_detail.jsp").forward(req, resp);
    }
}
