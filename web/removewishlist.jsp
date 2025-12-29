<%-- 
    Document   : removewishlist
    Created on : 24-Dec-2025, 11:53:05 pm
    Author     : VIGNESH S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
String email = (String)session.getAttribute("user");
int pid = Integer.parseInt(request.getParameter("pid"));

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
 "jdbc:mysql://localhost:3306/flowerproducts",
 "root","Vicky345@"
);

PreparedStatement ps = conn.prepareStatement(
 "DELETE FROM wishlist WHERE user_email=? AND product_id=?");
ps.setString(1, email);
ps.setInt(2, pid);
ps.executeUpdate();

conn.close();

response.sendRedirect("wishlist.jsp");
%>

