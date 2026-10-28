package com.sistem.controller;

import com.sistem.model.User;
import com.sistem.util.LaporanService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/laporan/chat")
public class ChatServlet extends HttpServlet {
    private LaporanService service = new LaporanService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User u = (User) req.getSession().getAttribute("user");
        if (u == null) { resp.sendRedirect(req.getContextPath() + "/login"); return; }

        int id = Integer.parseInt(req.getParameter("id"));
        String isi = req.getParameter("isi");

        if (isi != null && !isi.trim().isEmpty()) {
            service.kirimPesan(id, isi.trim(), u);
        }

        resp.sendRedirect(req.getContextPath() + "/laporan/detail?id=" + id);
    }
}
