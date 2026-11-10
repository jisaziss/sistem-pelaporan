<%@ page import="com.sistem.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    String role = currentUser != null ? currentUser.getRole() : null;
%>
<nav class="bg-[#FFDF16] text-[#FF5516] shadow-md border-b-2 border-[#FFAA16]">
    <div class="container mx-auto px-4">
        <div class="flex justify-between items-center py-3">
            <a href="${pageContext.request.contextPath}/" class="flex items-center space-x-3">
                <img src="${pageContext.request.contextPath}/images/logoPPKS.png" alt="Logo PPKS UNSOED" class="h-12 w-auto mix-blend-multiply">
            </a>

            <div class="flex items-center space-x-4 font-bold">
                <% if (currentUser != null) { %>
                    <span class="text-sm bg-white/50 px-3 py-1 rounded-full text-[#FF5516]">
                        <%= com.sistem.util.HtmlUtil.escape(currentUser.getUsername()) %>
                    </span>
                    <a href="${pageContext.request.contextPath}/<%= role.toLowerCase() %>/dashboard" class="hover:text-[#FF5516] transition">Dashboard</a>
                    <a href="${pageContext.request.contextPath}/logout" class="bg-[#FF5516] text-white px-4 py-2 rounded-lg transition hover:bg-[#e04812]">Logout</a>
                <% } else { %>
                    <a href="${pageContext.request.contextPath}/login" class="hover:underline">Masuk</a>
                    <a href="${pageContext.request.contextPath}/register" class="bg-[#FF5516] text-white px-4 py-2 rounded-lg transition hover:bg-[#e04812]">Daftar</a>
                <% } %>
            </div>
        </div>
    </div>
</nav>