<%-- 
    Document   : cart
    Created on : 23-Dec-2025, 9:30:17 pm
    Author     : VIGNESH S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
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
    "SELECT * FROM cart WHERE user_email=?");
ps.setString(1, email);
ResultSet rs = ps.executeQuery();

int grandTotal = 0;
%>

<!DOCTYPE html>
<html>
<head>
    <title>Cart</title>

    <!-- Font Awesome -->
    <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <link rel="stylesheet" href="style.css">
    <style>.cart-item{
    display: flex;
    gap: 15px;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 12px;
    margin: 12px 0;
    background: #fff;
    box-shadow: 0 2px 6px rgba(0,0,0,0.08);
}

.cart-img{
    width: 90px;
    height: 90px;
    object-fit: cover;
    border-radius: 6px;
}

.cart-details{
    flex: 1;
}

.cart-details h3{
    margin: 0;
    font-size: 18px;
    color: #333;
}

.price{
    margin: 6px 0;
    font-size: 15px;
}

.qty-box{
    display: flex;
    align-items: center;
    gap: 12px;
    margin: 8px 0;
}

.qty-btn{
    width: 30px;
    height: 30px;
    background: #28a745;
    color: white;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    text-decoration: none;
    font-size: 14px;
}

.qty-btn:hover{
    background: #218838;
}

.qty{
    font-size: 16px;
    font-weight: bold;
}

.total{
    font-weight: bold;
    color: #000;
    margin: 6px 0;
}

.remove-btn{
    color: #dc3545;
    text-decoration: none;
    font-weight: bold;
    display: inline-block;
    margin-top: 6px;
}

.remove-btn:hover{
    text-decoration: underline;
}
body{
    padding-top: 90px; /* header height */
}
.cart-container{
    max-width: 900px;
    margin: auto;
}
.grand-total-box{
    max-width: 900px;
    margin: 25px auto;
    padding: 15px;
    font-size: 20px;
    font-weight: bold;
    text-align: right;
    background: #f8f9fa;
    border-radius: 8px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.08);
}
<!--check out css-->
.checkout-box{
    max-width: 900px;
    margin: 20px auto;
    text-align: right;
}

.checkout-btn{
    padding: 12px 25px;
    background: #e84393;
    color: white;
    font-size: 16px;
    border-radius: 6px;
    text-decoration: none;
}

.checkout-btn:hover{
    background: #d63384;
}

</style>
</head>
<body>
<%@ include file="navbar.jsp" %>
<h2>My Cart</h2>

<%
while(rs.next()){
    int total = rs.getInt("price") * rs.getInt("quantity");
    grandTotal += total;
%>
<div class="cart-container">

    <!-- existing cart-item loop here -->


<div class="cart-item">
    <img src="images/<%=rs.getString("image")%>" class="cart-img">

    <div class="cart-details">
        <h3><%=rs.getString("product_name")%></h3>

        <p class="price">Price: ₹<%=rs.getInt("price")%></p>

        <!-- Quantity -->
        <div class="qty-box">
            <a href="updatecart.jsp?action=minus&pid=<%=rs.getInt("product_id")%>" class="qty-btn">
                <i class="fa-solid fa-minus"></i>
            </a>

            <span class="qty"><%=rs.getInt("quantity")%></span>

            <a href="updatecart.jsp?action=plus&pid=<%=rs.getInt("product_id")%>" class="qty-btn">
                <i class="fa-solid fa-plus"></i>
            </a>
        </div>

        <p class="total">Total: ₹<%=total%></p>

        <!-- Delete -->
        <a href="deletecart.jsp?pid=<%=rs.getInt("product_id")%>"
           class="remove-btn"
           onclick="return confirm('Remove item?')">
           <i class="fa-solid fa-trash"></i> Remove
        </a>
    </div>
</div>
           <h3>Grand Total: ₹<%=grandTotal%></h3>
           <div class="checkout-box">
    <a href="checkout.jsp" class="checkout-btn">
        Proceed to Order
    </a>
</div>

</div>
<%
}
conn.close();
%>



</body>
</html>

