package com.sistem.controller;

import com.sistem.dao.UserDAO;
import com.sistem.model.LoginResult;
import com.sistem.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        LoginResult result = userDAO.authenticate(username, password);
        if (result.isSuccess()) {
            HttpSession session = req.getSession();
            session.setAttribute("user", result.getUser());
            
            User user = result.getUser();
            if ("PELAPOR".equals(user.getRole())) {
                resp.sendRedirect(req.getContextPath() + "/pelapor/dashboard");
            } else if ("PETUGAS".equals(user.getRole())) {
                resp.sendRedirect(req.getContextPath() + "/petugas/dashboard");
            } else {
                resp.sendRedirect(req.getContextPath() + "/home");
            }
        } else {
            req.setAttribute("error", result.getMessage());
            req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
        }
    }
}
