<%-- 
    Document   : myorders
    Created on : 23-Dec-2025, 10:41:10 pm
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

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/flowerproducts","root","Vicky345@"
);

PreparedStatement ps = conn.prepareStatement(
    "SELECT * FROM orders WHERE user_email=? ORDER BY order_date DESC");
ps.setString(1, email);
ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Orders</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body{
            padding-top:90px;
            background:#f5f5f5;
        }
        .orders-container{
            max-width:900px;
            margin:auto;
        }
        .order-card{
            background:#fff;
            padding:20px;
            margin:15px 0;
            border-radius:10px;
            box-shadow:0 4px 10px rgba(0,0,0,0.08);
        }
        .order-card h3{
            margin-bottom:8px;
            color:#333;
        }
        .order-card p{
            margin:4px 0;
            color:#555;
            font-size:14px;
        }
        .order-status{
            color:#28a745;
            font-weight:bold;
        }
    </style>
</head>

<body>

<%@ include file="navbar.jsp" %>

<div class="orders-container">
    <h2>My Orders</h2>

<%
boolean hasOrders = false;
while(rs.next()){
    hasOrders = true;
%>

    <div class="order-card">
        <h3>Order #<%=rs.getInt("order_id")%></h3>

        <p><b>Total Amount:</b> ₹<%=rs.getInt("total_amount")%></p>
        <p><b>Payment:</b> <%=rs.getString("payment")%></p>
        <p><b>Delivery Address:</b> <%=rs.getString("address")%></p>
        <p><b>Order Date:</b> <%=rs.getTimestamp("order_date")%></p>

        <p class="order-status">✔ Order Placed</p>
    </div>

<%
}
conn.close();

if(!hasOrders){
%>
    <p>You have not placed any orders yet.</p>
<%
}
%>

</div>

</body>
</html>
