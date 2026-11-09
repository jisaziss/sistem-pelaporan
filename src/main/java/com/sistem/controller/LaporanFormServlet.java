package com.sistem.controller;

import com.sistem.dao.BuktiLaporanDAO;
import com.sistem.model.BuktiLaporan;
import com.sistem.model.Pelapor;
import com.sistem.model.User;
import com.sistem.util.LaporanService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@WebServlet("/pelapor/laporan/baru")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 50,      // 50MB
    maxRequestSize = 1024 * 1024 * 100   // 100MB
)
public class LaporanFormServlet extends HttpServlet {
    private LaporanService service = new LaporanService();
    private BuktiLaporanDAO buktiDAO = new BuktiLaporanDAO();
    private static final String UPLOAD_DIR = "C:\\sistem-pelaporan-uploads";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User u = (User) req.getSession().getAttribute("user");
        if (!(u instanceof Pelapor)) { resp.sendRedirect(req.getContextPath() + "/login"); return; }
        req.getRequestDispatcher("/WEB-INF/views/laporan_form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Pelapor p = (Pelapor) req.getSession().getAttribute("user");
        if (p == null) { resp.sendRedirect(req.getContextPath() + "/login"); return; }

        String judul = req.getParameter("judul");
        String kat = req.getParameter("kategori");
        String krono = req.getParameter("kronologi");
        String lok = req.getParameter("lokasi");
        String tgl = req.getParameter("tanggal_kejadian");
        boolean sembunyi = req.getParameter("sembunyikan_identitas") != null;

        com.sistem.model.Laporan laporan = new com.sistem.model.Laporan(p.getId(), "", judul, kat, krono, lok, tgl, sembunyi);
        boolean created = new com.sistem.dao.LaporanDAO().createLaporan(laporan);

        if (created && laporan.getId() > 0) {
            File uploadDir = new File(UPLOAD_DIR);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            for (Part part : req.getParts()) {
                if ("buktiFiles".equals(part.getName()) && part.getSize() > 0) {
                    String submittedFileName = part.getSubmittedFileName();
                    if (submittedFileName != null && !submittedFileName.trim().isEmpty()) {
                        String ext = "";
                        int i = submittedFileName.lastIndexOf('.');
                        if (i > 0) {
                            ext = submittedFileName.substring(i);
                        }
                        String uniqueFilename = UUID.randomUUID().toString() + ext;
                        File file = new File(uploadDir, uniqueFilename);
                        part.write(file.getAbsolutePath());

                        String jenis = "FOTO";
                        String contentType = part.getContentType();
                        if (contentType != null && contentType.startsWith("video")) {
                            jenis = "VIDEO";
                        }

                        BuktiLaporan bukti = new BuktiLaporan(laporan.getId(), jenis, uniqueFilename);
                        buktiDAO.createBukti(bukti);
                    }
                }
            }
        }

        resp.sendRedirect(req.getContextPath() + "/pelapor/dashboard");
    }
}

