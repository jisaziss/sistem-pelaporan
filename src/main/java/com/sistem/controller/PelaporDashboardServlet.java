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

@WebServlet("/pelapor/dashboard")
public class PelaporDashboardServlet extends HttpServlet {
    private LaporanService service = new LaporanService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User u = (User) req.getSession().getAttribute("user");
        if (!(u instanceof Pelapor)) { resp.sendRedirect(req.getContextPath() + "/login"); return; }
        
        req.setAttribute("laporanList", service.getDaftarLaporan(u));
        req.getRequestDispatcher("/WEB-INF/views/pelapor_dashboard.jsp").forward(req, resp);
    }
}
