<%-- 
    Document   : logout
    Created on : 23-Dec-2025, 5:28:45 pm
    Author     : VIGNESH S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // session destroy
    session.invalidate();

    // redirect to login page
    response.sendRedirect("login.jsp");
%>

