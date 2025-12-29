<%-- 
    Document   : blockUser
    Created on : 29-Dec-2025, 5:52:11 pm
    Author     : VIGNESH S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
String admin = (String) session.getAttribute("admin");
if(admin == null){
    response.sendRedirect("adminlogin.jsp");
    return;
}

String email = request.getParameter("email");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
 "jdbc:mysql://localhost:3306/newuserlogin","root","Vicky345@"
);

PreparedStatement ps = conn.prepareStatement(
 "UPDATE userlist SET status = IF(status='active','blocked','active') WHERE email=?"
);
ps.setString(1, email);
ps.executeUpdate();

conn.close();

response.sendRedirect("admin_users.jsp");
%>
