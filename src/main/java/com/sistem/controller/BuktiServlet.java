package com.sistem.controller;

import com.sistem.dao.BuktiLaporanDAO;
import com.sistem.dao.LaporanDAO;
import com.sistem.model.BuktiLaporan;
import com.sistem.model.Laporan;
import com.sistem.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.List;

@WebServlet("/bukti/*")
public class BuktiServlet extends HttpServlet {
    private BuktiLaporanDAO buktiDAO = new BuktiLaporanDAO();
    private LaporanDAO laporanDAO = new LaporanDAO();
    private static final String UPLOAD_DIR = "C:\\sistem-pelaporan-uploads";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            resp.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        String pathInfo = req.getPathInfo(); // e.g. /12/filename.ext or /filename.ext
        if (pathInfo == null || pathInfo.length() <= 1) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        String filename = pathInfo.substring(1);
        // Security check: ensure file belongs to a laporan the user can access
        // Find bukti by file_path ending with filename
        File file = new File(UPLOAD_DIR, filename);
        if (!file.exists() || !file.isFile()) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // Verify user access
        boolean allowed = false;
        // Search which laporan owns this filename
        // Simple approach: list all bukti or query DB
        // Let's check via DB
        // For efficiency, we can query database for the filename
        try (var conn = com.sistem.util.DBConnection.getConnection();
             var pstmt = conn.prepareStatement("SELECT laporan_id FROM bukti_laporan WHERE file_path LIKE ?")) {
            pstmt.setString(1, "%" + filename);
            var rs = pstmt.executeQuery();
            if (rs.next()) {
                int laporanId = rs.getInt("laporan_id");
                Laporan l = laporanDAO.getLaporanById(laporanId);
                if (l != null && user.bolehAksesLaporan(l)) {
                    allowed = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (!allowed) {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        String mimeType = getServletContext().getMimeType(file.getName());
        if (mimeType == null) {
            mimeType = "application/octet-stream";
        }
        resp.setContentType(mimeType);
        resp.setContentLengthLong(file.length());

        try (FileInputStream in = new FileInputStream(file);
             OutputStream out = resp.getOutputStream()) {
            byte[] buffer = new byte[8192];
            int bytesRead;
            while ((bytesRead = in.read(buffer)) != -1) {
                out.write(buffer, 0, bytesRead);
            }
        }
    }
}
