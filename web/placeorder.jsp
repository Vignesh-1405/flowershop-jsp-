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
PreparedStatement totalPs = conn.prepareStatement(
 "SELECT SUM(price * quantity) FROM cart WHERE user_email=?");
totalPs.setString(1, email);
ResultSet totalRs = totalPs.executeQuery();

int total = 0;
if(totalRs.next()){
    total = totalRs.getInt(1);
}

// 2️⃣ Insert order (GET GENERATED ORDER ID)
PreparedStatement orderPs = conn.prepareStatement(
 "INSERT INTO orders(user_email,total_amount,address,payment,status) VALUES (?,?,?,?,?)",
 Statement.RETURN_GENERATED_KEYS
);

orderPs.setString(1, email);
orderPs.setInt(2, total);
orderPs.setString(3, address);
orderPs.setString(4, payment);
orderPs.setString(5, "placed");   // ⭐ NEW LINE

orderPs.executeUpdate();


ResultSet orderKeys = orderPs.getGeneratedKeys();
int orderId = 0;
if(orderKeys.next()){
    orderId = orderKeys.getInt(1);
}

// 3️⃣ INSERT CART ITEMS INTO order_items
PreparedStatement cartPs = conn.prepareStatement(
 "SELECT * FROM cart WHERE user_email=?");
cartPs.setString(1, email);
ResultSet cartRs = cartPs.executeQuery();

PreparedStatement itemPs = conn.prepareStatement(
 "INSERT INTO order_items(order_id,product_id,product_name,price,quantity) VALUES(?,?,?,?,?)");

while(cartRs.next()){
    itemPs.setInt(1, orderId);
    itemPs.setInt(2, cartRs.getInt("product_id"));
    itemPs.setString(3, cartRs.getString("product_name"));
    itemPs.setInt(4, cartRs.getInt("price"));
    itemPs.setInt(5, cartRs.getInt("quantity"));
    itemPs.executeUpdate();
}

// 4️⃣ Clear cart
PreparedStatement clearPs = conn.prepareStatement(
 "DELETE FROM cart WHERE user_email=?");
clearPs.setString(1, email);
clearPs.executeUpdate();

conn.close();

// 5️⃣ Redirect
response.sendRedirect("ordersuccess.jsp");
%>



