<%-- 
    Document   : addproductprocess
    Created on : 22-Dec-2025, 10:13:29?pm
    Author     : VIGNESH S
--%>

<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="jakarta.servlet.http.Part"%>
<%@page import="jakarta.servlet.annotation.MultipartConfig"%>

<%@MultipartConfig%>
<%
String name = request.getParameter("name");
String price = request.getParameter("price");
String oldPrice = request.getParameter("old_price");
String category = request.getParameter("category");
String stock = request.getParameter("stock");

/* IMAGE */
Part part = request.getPart("image");
String fileName = part.getSubmittedFileName();

/* SAVE IMAGE */
String uploadPath = application.getRealPath("") + "images" + File.separator + fileName;
part.write(uploadPath);

/* DB */
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/flowerproducts",
    "root",
    "Vicky345@"
);

String sql = "INSERT INTO productlist (name,price,old_price,category,stock,image) VALUES (?,?,?,?,?,?)";
PreparedStatement ps = conn.prepareStatement(sql);

ps.setString(1, name);
ps.setInt(2, Integer.parseInt(price));
ps.setInt(3, Integer.parseInt(oldPrice));
ps.setString(4, category);
ps.setInt(5, Integer.parseInt(stock));
ps.setString(6, fileName);

ps.executeUpdate();
conn.close();

response.sendRedirect("adminDashboard.jsp");
%>



