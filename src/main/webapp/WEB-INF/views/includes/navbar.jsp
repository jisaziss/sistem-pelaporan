<%@ page import="com.sistem.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    String role = currentUser != null ? currentUser.getRole() : null;
%>
<nav class="bg-blue-600 text-white shadow-lg">
    <div class="container mx-auto px-4">
        <div class="flex justify-between items-center py-4">
            <div class="flex items-center space-x-2">
                <svg class="w-8 h-8" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
                </svg>
                <span class="text-xl font-bold">PPKS UNSOED</span>
            </div>
            
            <div class="flex items-center space-x-4">
                <% if (currentUser != null) { %>
                    <span class="text-sm">
                        <span class="font-semibold"><%= com.sistem.util.HtmlUtil.escape(currentUser.getUsername()) %></span>
                        <span class="text-blue-200 ml-2">(<%= role %>)</span>
                    </span>
                    <a href="${pageContext.request.contextPath}/<%= role.toLowerCase() %>/dashboard" class="hover:text-blue-200 transition">Dashboard</a>
                    <a href="${pageContext.request.contextPath}/logout" class="bg-red-500 hover:bg-red-600 px-4 py-2 rounded transition">Logout</a>
                <% } else { %>
                    <a href="${pageContext.request.contextPath}/login" class="hover:text-blue-200 transition">Masuk</a>
                    <a href="${pageContext.request.contextPath}/register" class="bg-white text-blue-600 hover:bg-blue-50 px-4 py-2 rounded transition">Daftar</a>
                <% } %>
            </div>
        </div>
    </div>
</nav>
