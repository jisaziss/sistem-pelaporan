<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.sistem.util.HtmlUtil" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Daftar - Sistem PPKS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="navbar">
        <div class="container">
            <div class="navbar-brand">PPKS</div>
            <div class="navbar-menu">
                <a href="${pageContext.request.contextPath}/" class="nav-link">Beranda</a>
            </div>
        </div>
    </div>

    <div class="container form-container">
        <div class="form-wrapper">
            <h1>Daftar Sebagai Pelapor</h1>

            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-error"><%= HtmlUtil.escape((String) request.getAttribute("error")) %></div>
            <% } %>

            <form method="post" action="${pageContext.request.contextPath}/register">
                <div class="form-group">
                    <label for="nama">Nama Lengkap</label>
                    <input type="text" id="nama" name="nama" required>
                </div>

                <div class="form-group">
                    <label for="nim">NIM</label>
                    <input type="text" id="nim" name="nim" placeholder="Opsional">
                </div>

                <div class="form-group">
                    <label for="prodi">Program Studi / Fakultas</label>
                    <input type="text" id="prodi" name="prodi" placeholder="Opsional">
                </div>

                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>

                <button type="submit" class="btn btn-primary btn-block">Daftar</button>
            </form>

            <p class="form-footer">Sudah punya akun? <a href="${pageContext.request.contextPath}/login">Masuk di sini</a></p>
        </div>
    </div>

    <footer>
        <p>&copy; 2026 Sistem Pelaporan PPKS.</p>
    </footer>
</body>
</html>
