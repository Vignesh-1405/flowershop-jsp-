<%-- 
    Document   : updateproduct.
    Created on : 23-Dec-2025, 4:44:55 pm
    Author     : VIGNESH S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%
int pid = Integer.parseInt(request.getParameter("pid"));
String name = request.getParameter("name");
int price = Integer.parseInt(request.getParameter("price"));
int oldPrice = Integer.parseInt(request.getParameter("old_price"));
String category = request.getParameter("category");
int stock = Integer.parseInt(request.getParameter("stock"));

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/flowerproducts","root","Vicky345@");

PreparedStatement ps = conn.prepareStatement(
    "UPDATE productlist SET name=?,price=?,old_price=?,category=?,stock=? WHERE product_id=?");

ps.setString(1, name);
ps.setInt(2, price);
ps.setInt(3, oldPrice);
ps.setString(4, category);
ps.setInt(5, stock);
ps.setInt(6, pid);

ps.executeUpdate();
conn.close();

response.sendRedirect("viewproducts.jsp");
%>
