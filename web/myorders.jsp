<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

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
 "SELECT * FROM orders WHERE user_email=? ORDER BY order_date DESC"
);
ps.setString(1, email);
ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<title>My Orders</title>
<link rel="stylesheet" href="style.css">
<style>
body{ padding-top:90px; background:#f5f5f5; }
.orders-container{ max-width:900px; margin:auto; }
.order-card{
 background:#fff; padding:20px; margin:15px 0;
 border-radius:10px; box-shadow:0 4px 10px rgba(0,0,0,0.08);
}
.status-placed{ color:orange; font-weight:bold; }
.status-delivered{ color:green; font-weight:bold; }
.status-cancelled{ color:red; font-weight:bold; }
.cancel-btn{
 color:red; text-decoration:none; font-weight:bold;
}
</style>
</head>

<body>
<%@ include file="navbar.jsp" %>

<div class="orders-container">
<h2>My Orders</h2>

<%
boolean hasOrders=false;
while(rs.next()){
hasOrders=true;
String status = rs.getString("status");
%>

<div class="order-card">
<h3>Order ID: FLW-<%=rs.getInt("order_id")%></h3>

<p><b>Total:</b> ₹<%=rs.getInt("total_amount")%></p>
<p><b>Payment:</b> <%=rs.getString("payment")%></p>
<p><b>Address:</b> <%=rs.getString("address")%></p>
<p><b>Date:</b> <%=rs.getTimestamp("order_date")%></p>

<p class="status-<%=status%>">
Status: <%=status%>
</p>

<% if("placed".equals(status)){ %>
<a class="cancel-btn"
 href="cancelorder.jsp?oid=<%=rs.getInt("order_id")%>"
 onclick="return confirm('Cancel this order?');">
Cancel Order
</a>
<% } %>

</div>

<% } conn.close(); %>

<% if(!hasOrders){ %>
<p>You have not placed any orders yet.</p>
<% } %>

</div>
</body>
</html>
