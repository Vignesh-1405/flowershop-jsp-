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

PreparedStatement psOrders = conn.prepareStatement(
 "SELECT * FROM orders ORDER BY order_date DESC");
ResultSet rsOrders = psOrders.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | Orders</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
*{margin:0;padding:0;box-sizing:border-box;}

body{
    font-family:'Poppins','Segoe UI',sans-serif;
    background:#fdfdfd;
}

/* LAYOUT */
/*.container{
    display:flex;
    min-height:100vh;
}*/
.container{
    min-height:100vh;
}


/* SIDEBAR – SAME PINK */
/*.sidebar{
    width:250px;
    position: fixed;
    top:0;
    left:0;
    background:linear-gradient(180deg,#e84393,#fd79a8);
    color:#fff;
    padding:25px 20px;
    overflow-y:auto;
}*/
.sidebar{
    width:250px;
    height:100vh;
    position:fixed;
    top:0;
    left:0;
    background:linear-gradient(180deg,#e84393,#fd79a8);
    color:#fff;
    padding:25px 20px;
    overflow-y:auto;
}

.logo{
    font-size:22px;
    font-weight:600;
    margin-bottom:35px;
}

.menu a{
    display:flex;
    align-items:center;
    gap:12px;
    padding:14px 15px;
    margin-bottom:10px;
    text-decoration:none;
    color:#fff;
    border-radius:12px;
    transition:0.3s;
}

.menu a:hover,
.menu a.active{
    background:rgba(255,255,255,0.25);
}

/* MAIN */
/*.main{
    flex:1;
    padding:30px;
}*/
.main{
    margin-left:250px;   /* sidebar width */
    padding:30px;
    min-height:100vh;
}


/* HEADER */
.header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:30px;
}

.header h2{
    color:#6f42c1; /* DIFFERENT COLOR FOR ORDERS */
}

/* ORDER CARD */
.order-card{
    background:#ffffff;
    padding:22px;
    margin-bottom:25px;
    border-radius:20px;
    box-shadow:0 12px 30px rgba(0,0,0,0.08);
    border-left:6px solid #6f42c1;
}

/* ORDER HEADER */
.order-header{
    display:flex;
    justify-content:space-between;
    margin-bottom:15px;
    font-weight:500;
    color:#333;
}

/* TABLE */
.product-table{
    width:100%;
    border-collapse:collapse;
    margin-top:10px;
}

.product-table th{
    background:#ede7f6;
    color:#6f42c1;
    padding:12px;
    font-size:14px;
}

.product-table td{
    padding:12px;
    border-bottom:1px solid #eee;
    font-size:14px;
    text-align:center;
}

.product-table tr:hover{
    background:#f5f3ff;
}

/* TOTAL */
.total{
    text-align:right;
    font-weight:600;
    margin-top:12px;
    color:#6f42c1;
    font-size:15px;
}
</style>
</head>

<body>

<div class="container">

    <!-- SIDEBAR -->
    <div class="sidebar">
        <div class="logo">🌸 Flower Admin</div>
        <div class="menu">
            <a href="admindashboard.jsp"><i class="fas fa-home"></i> Dashboard</a>
            <a href="admin_users.jsp"><i class="fas fa-users"></i> Users</a>
            <a href="addproduct.jsp"><i class="fas fa-plus-circle"></i> Add Product</a>
            <a href="viewproducts.jsp"><i class="fas fa-list"></i> Products</a>
            <a href="#" class="active"><i class="fas fa-box"></i> Orders</a>
            <a href="adminreviews.jsp"><i class="fas fa-star"></i> Reviews</a>
            <a href="adminContact.jsp"><i class="fas fa-envelope"></i> Messages</a>
            <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>

    <!-- MAIN -->
    <div class="main">

        <div class="header">
            <h2>📦 All Orders</h2>
            <div><i class="fas fa-user-shield"></i> Admin</div>
        </div>

<%
while(rsOrders.next()){
    int orderId = rsOrders.getInt("order_id");
%>

        <div class="order-card">

            <div class="order-header">
                <div>
                    <strong>Order #<%=orderId%></strong><br>
                    User: <%=rsOrders.getString("user_email")%><br>
                    Payment: <%=rsOrders.getString("payment")%>
                </div>
                <div>
                    Date: <%=rsOrders.getTimestamp("order_date")%>
                </div>
            </div>

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

    </div>
</div>

</body>
</html>
