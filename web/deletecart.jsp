<%-- 
    Document   : deletecart
    Created on : 23-Dec-2025, 9:21:08 pm
    Author     : VIGNESH S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String email = (String)session.getAttribute("user");
if(email == null){
    response.sendRedirect("login.jsp");
    return;
}

int pid = Integer.parseInt(request.getParameter("pid"));

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
 "jdbc:mysql://localhost:3306/flowerproducts","root","Vicky345@"
);

PreparedStatement ps = conn.prepareStatement(
 "DELETE FROM cart WHERE user_email=? AND product_id=?");
ps.setString(1,email);
ps.setInt(2,pid);
ps.executeUpdate();

conn.close();
response.sendRedirect("cart.jsp");
%>

