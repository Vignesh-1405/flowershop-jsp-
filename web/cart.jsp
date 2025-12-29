<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
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
    "SELECT * FROM cart WHERE user_email=?");
ps.setString(1, email);
ResultSet rs = ps.executeQuery();

int grandTotal = 0;
%>

<!DOCTYPE html>
<html>
<head>
<title>My Cart</title>

<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
body{ padding-top:90px; background:#f5f5f5; }

.cart-container{
    max-width:900px;
    margin:auto;
}

.cart-item{
    display:flex;
    gap:15px;
    background:#fff;
    padding:12px;
    margin:12px 0;
    border-radius:8px;
    box-shadow:0 2px 6px rgba(0,0,0,0.08);
}

.cart-img{
    width:90px;
    height:90px;
    object-fit:cover;
}

.qty-box{
    display:flex;
    gap:12px;
    align-items:center;
}

.qty-btn{
    width:30px;
    height:30px;
    background:#28a745;
    color:#fff;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
    text-decoration:none;
    font-weight:bold;
}

/* ✅ TOTAL + CHECKOUT */
.checkout-box{
    max-width:900px;
    margin:25px auto;
    display:flex;
    justify-content:space-between;
    align-items:center;
    background:#fff;
    padding:15px 20px;
    border-radius:8px;
    box-shadow:0 2px 6px rgba(0,0,0,0.08);
}

.total-text{
    font-size:18px;
    font-weight:bold;
    color:#333;
}

.checkout-btn{
    padding:12px 25px;
    background:#e84393;
    color:#fff;
    border-radius:6px;
    text-decoration:none;
    font-size:16px;
}

.checkout-btn:hover{
    background:#d63384;
}
</style>
</head>

<body>
<%@ include file="navbar.jsp" %>

<h2 style="text-align:center;">My Cart</h2>

<div class="cart-container">

<%
boolean hasItems = false;
while(rs.next()){
    hasItems = true;
    int total = rs.getInt("price") * rs.getInt("quantity");
    grandTotal += total;
%>

    <div class="cart-item">
        <img src="images/<%=rs.getString("image")%>" class="cart-img">

        <div>
            <h3><%=rs.getString("product_name")%></h3>
            <p>Price: ₹<%=rs.getInt("price")%></p>

            <div class="qty-box">
                <a href="updatecart.jsp?action=minus&pid=<%=rs.getInt("product_id")%>" class="qty-btn">−</a>
                <b><%=rs.getInt("quantity")%></b>
                <a href="updatecart.jsp?action=plus&pid=<%=rs.getInt("product_id")%>" class="qty-btn">+</a>
            </div>

            <p><b>Total: ₹<%=total%></b></p>

            <a href="deletecart.jsp?pid=<%=rs.getInt("product_id")%>"
               onclick="return confirm('Remove item?')"
               style="color:red;text-decoration:none;">
               Remove
            </a>
        </div>
    </div>

<%
}
conn.close();
%>

</div>

<% if(hasItems){ %>
<!-- ✅ GRAND TOTAL + BUTTON (ONCE ONLY) -->
<div class="checkout-box">
    <div class="total-text">
        Grand Total: ₹<%=grandTotal%>
    </div>

    <a href="checkout.jsp" class="checkout-btn">
        Proceed To Order
    </a>
</div>
<% } else { %>
    <p style="text-align:center;">Your cart is empty</p>
<% } %>

</body>
</html>
