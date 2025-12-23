<%-- 
    Document   : placeorder
    Created on : 23-Dec-2025, 10:17:25 pm
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

String address = request.getParameter("address");
String payment = request.getParameter("payment");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
 "jdbc:mysql://localhost:3306/flowerproducts","root","Vicky345@"
);

// 1️⃣ Calculate total
PreparedStatement ps = conn.prepareStatement(
 "SELECT SUM(price * quantity) FROM cart WHERE user_email=?");
ps.setString(1, email);
ResultSet rs = ps.executeQuery();

int total = 0;
if(rs.next()){
    total = rs.getInt(1);
}

// 2️⃣ Insert order
PreparedStatement insert = conn.prepareStatement(
 "INSERT INTO orders(user_email,total_amount,address,payment) VALUES(?,?,?,?)");
insert.setString(1, email);
insert.setInt(2, total);
insert.setString(3, address);
insert.setString(4, payment);
insert.executeUpdate();

// 3️⃣ Clear cart
PreparedStatement clear = conn.prepareStatement(
 "DELETE FROM cart WHERE user_email=?");
clear.setString(1, email);
clear.executeUpdate();

conn.close();

// 4️⃣ Redirect to success page
response.sendRedirect("ordersuccess.jsp");
%>


