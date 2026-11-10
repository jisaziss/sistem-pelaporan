<%@ page import="com.sistem.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    String role = currentUser != null ? currentUser.getRole() : null;
%>
<link href="https://fonts.googleapis.com/css2?family=Barlow:wght@500;600;700&family=Barlow+Condensed:wght@600;700;800&display=swap" rel="stylesheet">
<style>
    .nav-font   { font-family: 'Barlow', sans-serif; }
    .nav-brand  { font-family: 'Barlow Condensed', sans-serif; letter-spacing: .06em; }
</style>
<nav class="nav-font relative z-20 bg-white text-[#2F4A3E] border-b-4 border-[#F6D365] shadow-[0_4px_16px_rgba(47,74,62,.06)]">
    <div class="container mx-auto px-4">
        <div class="flex justify-between items-center gap-4 py-3">
            <a href="${pageContext.request.contextPath}/" class="flex items-center gap-3 min-w-0">
                <img src="${pageContext.request.contextPath}/images/logoPPKS.png"
                     alt="Logo PPKS UNSOED" class="h-11 sm:h-12 w-auto object-contain">
                <span class="hidden sm:block min-w-0">
                    <span class="nav-brand block text-lg sm:text-xl font-extrabold uppercase leading-tight">
                        <span class="text-[#4F7A63]">PPKS</span> <span class="text-[#C99A1E]">UNSOED</span>
                    </span>
                    <span class="nav-brand block text-[11px] sm:text-xs font-semibold text-[#6B7F74] tracking-[.2em] uppercase">Layanan Pelaporan</span>
                </span>
            </a>

            <div class="flex items-center gap-2 sm:gap-4 text-[15px] font-semibold tracking-wide">
                <% if (currentUser != null) { %>
                    <span class="hidden md:inline-flex items-center gap-2 bg-[#F7FAF8] border border-[#5E8C73]/20 px-3 py-2 rounded-full text-[#4F7A63]">
                        <span class="w-2 h-2 rounded-full bg-[#F6D365]"></span>
                        <%= com.sistem.util.HtmlUtil.escape(currentUser.getUsername()) %>
                    </span>
                    <a href="${pageContext.request.contextPath}/<%= role.toLowerCase() %>/dashboard"
                       class="px-3 py-2 rounded-lg text-[#2F4A3E] hover:bg-[#DCEBE2]/60 hover:text-[#4F7A63] transition">Dashboard</a>
                    <a href="${pageContext.request.contextPath}/logout"
                       class="bg-[#5C7FA8] text-white px-4 py-2 rounded-lg font-bold hover:bg-[#5E8C73] transition shadow-[0_6px_14px_rgba(92,127,168,.25)]">Keluar</a>
                <% } else { %>
                    <a href="${pageContext.request.contextPath}/login"
                       class="px-3 py-2 rounded-lg text-[#2F4A3E] hover:bg-[#5C7FA8]/10 hover:text-[#5C7FA8] transition">Masuk</a>
                    <a href="${pageContext.request.contextPath}/register"
                       class="bg-[#5C7FA8] text-white px-4 py-2 rounded-lg font-bold hover:bg-[#5E8C73] transition shadow-[0_6px_14px_rgba(92,127,168,.25)]">Daftar</a>
                <% } %>
            </div>
        </div>
    </div>
</nav>