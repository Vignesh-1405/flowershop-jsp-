<%-- 
    Document   : adminorders
    Created on : 23-Dec-2025, 10:44:32 pm
    Author     : VIGNESH S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
/* ===== Admin session check ===== */
String admin = (String)session.getAttribute("admin");
if(admin == null){
    response.sendRedirect("adminlogin.jsp");
    return;
}

/* ===== DB Connection ===== */
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/flowerproducts","root","Vicky345@"
);

PreparedStatement ps = conn.prepareStatement(
    "SELECT * FROM orders ORDER BY order_date DESC");
ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin - Orders</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body{
            padding-top:90px;
            background:#f5f5f5;
        }
        .admin-orders{
            max-width:1000px;
            margin:auto;
        }
        table{
            width:100%;
            border-collapse: collapse;
            background:#fff;
            box-shadow:0 4px 10px rgba(0,0,0,0.08);
        }
        th, td{
            padding:12px;
            text-align:left;
            border-bottom:1px solid #ddd;
            font-size:14px;
        }
        th{
            background:#e84393;
            color:#fff;
        }
        tr:hover{
            background:#f9f9f9;
        }
        h2{
            margin-bottom:15px;
        }
    </style>
</head>

<body>

<!-- You can include admin navbar if you have -->
<h2 style="text-align:center;">All Orders (Admin)</h2>

<div class="admin-orders">

<table>
    <tr>
        <th>Order ID</th>
        <th>User Email</th>
        <th>Total Amount</th>
        <th>Payment</th>
        <th>Address</th>
        <th>Order Date</th>
    </tr>

<%
boolean hasOrders = false;
while(rs.next()){
    hasOrders = true;
%>
    <tr>
        <td><%=rs.getInt("order_id")%></td>
        <td><%=rs.getString("user_email")%></td>
        <td>₹<%=rs.getInt("total_amount")%></td>
        <td><%=rs.getString("payment")%></td>
        <td><%=rs.getString("address")%></td>
        <td><%=rs.getTimestamp("order_date")%></td>
    </tr>
<%
}
conn.close();

if(!hasOrders){
%>
    <tr>
        <td colspan="6" style="text-align:center;">No orders found</td>
    </tr>
<%
}
%>

</table>
</div>

</body>
</html>

