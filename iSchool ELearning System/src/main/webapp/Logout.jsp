
<%
session.removeAttribute("user");
session.setAttribute("message","Sign out successfully ! Thanks for your time... ");
response.sendRedirect("index.jsp");
%>