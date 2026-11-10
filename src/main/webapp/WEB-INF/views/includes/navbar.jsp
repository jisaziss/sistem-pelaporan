<%@ page import="com.sistem.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    String role = currentUser != null ? currentUser.getRole() : null;
%>
<nav class="bg-gray-900/90 backdrop-blur-md border-b border-[#FF5516]/30 sticky top-0 z-50">
    <div class="container mx-auto px-4">
        <div class="flex justify-between items-center py-4">
            <a href="${pageContext.request.contextPath}/" class="flex items-center space-x-2">
                <img src="${pageContext.request.contextPath}/images/logoPPKS.png" alt="Logo PPKS UNSOED" class="h-10 w-auto filter drop-shadow-lg">
                <span class="text-xl font-bold text-[#FFDF16]">PPKS UNSOED</span>
            </a>
            
            <div class="flex items-center space-x-6 font-medium">
                <% if (currentUser != null) { %>
                    <span class="text-sm bg-[#FF5516]/20 text-[#FFAA16] px-4 py-2 rounded-full border border-[#FF5516]/50">
                        <%= com.sistem.util.HtmlUtil.escape(currentUser.getUsername()) %>
                    </span>
                    <a href="${pageContext.request.contextPath}/<%= role.toLowerCase() %>/dashboard" class="text-gray-300 hover:text-[#FFAA16] transition">Dashboard</a>
                    <a href="${pageContext.request.contextPath}/logout" class="bg-[#FF5516] text-white px-4 py-2 rounded-lg hover:bg-[#e04812] transition shadow-lg shadow-[#FF5516]/30">Logout</a>
                <% } else { %>
                    <a href="${pageContext.request.contextPath}/login" class="text-gray-300 hover:text-[#FFDF16] transition">Masuk</a>
                    <a href="${pageContext.request.contextPath}/register" class="bg-gradient-to-r from-[#FF5516] to-[#FFAA16] text-white px-6 py-2 rounded-lg hover:shadow-lg hover:shadow-[#FF5516]/50 transition">Daftar</a>
                <% } %>
            </div>
        </div>
    </div>
</nav>
