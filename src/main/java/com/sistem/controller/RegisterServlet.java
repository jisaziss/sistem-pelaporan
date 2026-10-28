package com.sistem.controller;

import com.sistem.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String nama = req.getParameter("nama");
        String nim = req.getParameter("nim");
        String prodi = req.getParameter("prodi");

        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty() || nama == null || nama.trim().isEmpty()) {
            req.setAttribute("error", "Semua field wajib diisi.");
            req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
            return;
        }

        boolean success = userDAO.registerPelapor(username, password, nama, nim, prodi);
        if (success) {
            resp.sendRedirect(req.getContextPath() + "/login?registered=success");
        } else {
            req.setAttribute("error", "Username sudah digunakan atau terjadi kesalahan.");
            req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
        }
    }
}
