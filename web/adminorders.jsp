<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.sql.*" %>
<%
String admin = (String)session.getAttribute("admin");
if(admin == null){
    response.sendRedirect("adminlogin.jsp");
    return;
}

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
 "jdbc:mysql://localhost:3306/flowerproducts","root","Vicky345@"
);

// Get all orders
PreparedStatement psOrders = conn.prepareStatement(
 "SELECT * FROM orders ORDER BY order_date DESC");
ResultSet rsOrders = psOrders.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Orders</title>
<title>Admin Orders</title>
<style>
    .top-bar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:30px;
}

.back-btn{
    background:linear-gradient(135deg,#6f42c1,#8e63f4);
    color:white;
    border:none;
    padding:10px 22px;
    border-radius:25px;
    font-size:14px;
    font-weight:600;
    cursor:pointer;
    box-shadow:0 6px 18px rgba(111,66,193,0.4);
    transition:0.3s;
}

.back-btn:hover{
    transform:translateY(-2px);
    box-shadow:0 10px 25px rgba(111,66,193,0.6);
}

body{ padding:40px; background:#f5f5f5; }

.order-card{
    background:#fff;
    padding:20px;
    margin-bottom:20px;
    border-radius:10px;
    box-shadow:0 4px 10px rgba(0,0,0,0.08);
}

.order-header{
    display:flex;
    justify-content:space-between;
    font-weight:bold;
    margin-bottom:10px;
}

.product-table{
    width:100%;
    border-collapse:collapse;
    margin-top:10px;
}

.product-table th,
.product-table td{
    border:1px solid #ddd;
    padding:8px;
    font-size:14px;
}

.product-table th{
    background:#e84393;
    color:white;
}

.total{
    text-align:right;
    font-weight:bold;
    margin-top:10px;
}
</style>
</head>

<body>

<div class="top-bar">
    <h2>📦 Admin – All Orders</h2>

    <a href="admindashboard.jsp">
        <button class="back-btn">⬅ Dashboard</button>
    </a>
</div>


<%
while(rsOrders.next()){
    int orderId = rsOrders.getInt("order_id");
%>

<div class="order-card">

    <!-- ORDER DETAILS -->
    <div class="order-header">
        <div>
            Order #<%=orderId%><br>
            User: <%=rsOrders.getString("user_email")%><br>
            Payment: <%=rsOrders.getString("payment")%>
        </div>
        <div>
            Date: <%=rsOrders.getTimestamp("order_date")%>
        </div>
    </div>

    <!-- PRODUCTS IN ORDER -->
    <table class="product-table">
        <tr>
            <th>Product</th>
            <th>Price</th>
            <th>Qty</th>
            <th>Total</th>
        </tr>

<%
    PreparedStatement psItems = conn.prepareStatement(
        "SELECT * FROM order_items WHERE order_id=?");
    psItems.setInt(1, orderId);
    ResultSet rsItems = psItems.executeQuery();

    while(rsItems.next()){
        int itemTotal =
            rsItems.getInt("price") * rsItems.getInt("quantity");
%>
        <tr>
            <td><%=rsItems.getString("product_name")%></td>
            <td>₹<%=rsItems.getInt("price")%></td>
            
            <td><%=rsItems.getInt("quantity")%></td>
            <td>₹<%=itemTotal%></td>
            

        </tr>
<%
    }
%>
    </table>

    <div class="total">
        Grand Total: ₹<%=rsOrders.getInt("total_amount")%>
    </div>

</div>

<%
}
conn.close();
%>

</body>
</html>
