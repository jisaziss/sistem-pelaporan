<%@ page import="com.sistem.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    String role = currentUser != null ? currentUser.getRole() : null;
%>
<nav class="relative z-20 bg-[#174F38] text-white shadow-lg shadow-green-950/10 border-b-4 border-[#D5AD52]">
    <div class="container mx-auto px-4">
        <div class="flex justify-between items-center gap-4 py-3">
            <a href="${pageContext.request.contextPath}/" class="flex items-center gap-3 min-w-0">
                <span class="flex items-center justify-center bg-white rounded-xl p-1.5 shadow-sm">
                    <img src="${pageContext.request.contextPath}/images/logoPPKS.png"
                         alt="Logo PPKS UNSOED" class="h-11 sm:h-12 w-auto object-contain">
                </span>
                <span class="hidden sm:block min-w-0">
                    <span class="block text-sm sm:text-base font-bold tracking-wide">PPKS UNSOED</span>
                    <span class="block text-[10px] sm:text-xs text-white/70 tracking-[.14em] uppercase">Layanan Pelaporan</span>
                </span>
            </a>

            <div class="flex items-center gap-2 sm:gap-4 text-sm font-semibold">
                <% if (currentUser != null) { %>
                    <span class="hidden md:inline-flex items-center gap-2 bg-white/10 border border-white/15 px-3 py-2 rounded-full text-white/90">
                        <span class="w-2 h-2 rounded-full bg-[#D5AD52]"></span>
                        <%= com.sistem.util.HtmlUtil.escape(currentUser.getUsername()) %>
                    </span>
                    <a href="${pageContext.request.contextPath}/<%= role.toLowerCase() %>/dashboard"
                       class="px-3 py-2 rounded-lg text-white/90 hover:bg-white/10 transition">Dashboard</a>
                    <a href="${pageContext.request.contextPath}/logout"
                       class="bg-[#D5AD52] text-[#26352D] px-4 py-2 rounded-lg font-bold hover:bg-[#E4C77F] transition shadow-sm">Keluar</a>
                <% } else { %>
                    <a href="${pageContext.request.contextPath}/login" class="px-3 py-2 rounded-lg text-white/90 hover:bg-white/10 transition">Masuk</a>
                    <a href="${pageContext.request.contextPath}/register"
                       class="bg-[#D5AD52] text-[#26352D] px-4 py-2 rounded-lg font-bold hover:bg-[#E4C77F] transition shadow-sm">Daftar</a>
                <% } %>
            </div>
        </div>
    </div>
</nav>
