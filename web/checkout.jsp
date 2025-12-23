<%-- 
    Document   : checkout
    Created on : 23-Dec-2025, 10:16:16 pm
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
%>

<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>

    <!-- Main CSS -->
    <link rel="stylesheet" href="style.css">

    <!-- Font Awesome (if needed later) -->
    <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        body{
            padding-top: 90px; /* fixed navbar space */
            background: #f5f5f5;
        }
        /* =======================
   CHECKOUT PAGE
======================= */

.checkout-container{
    max-width: 700px;
    margin: 40px auto;
    background: #fff;
    padding: 25px 30px;
    border-radius: 10px;
    box-shadow: 0 6px 15px rgba(0,0,0,0.08);
}

.checkout-container h2{
    text-align: center;
    margin-bottom: 20px;
    color: #333;
    font-size: 26px;
}

.checkout-form label{
    display: block;
    font-size: 15px;
    margin-bottom: 6px;
    color: #555;
}

.checkout-form textarea{
    width: 100%;
    height: 100px;
    padding: 10px;
    font-size: 14px;
    border-radius: 6px;
    border: 1px solid #ccc;
    resize: none;
    margin-bottom: 15px;
}

.checkout-form select{
    width: 100%;
    padding: 10px;
    font-size: 14px;
    border-radius: 6px;
    border: 1px solid #ccc;
    margin-bottom: 20px;
}

.checkout-form textarea:focus,
.checkout-form select:focus{
    border-color: #e84393;
    outline: none;
}

.place-order-btn{
    width: 100%;
    padding: 14px;
    background: #e84393;
    color: #fff;
    font-size: 16px;
    font-weight: bold;
    border-radius: 6px;
    cursor: pointer;
    border: none;
}

.place-order-btn:hover{
    background: #d63384;
}

/* Mobile */
@media (max-width:768px){
    .checkout-container{
        margin: 20px;
        padding: 20px;
    }
}

    </style>
</head>

<body>

<%@ include file="navbar.jsp" %>

<!-- ================= CHECKOUT CONTAINER ================= -->
<div class="checkout-container">

    <h2>Checkout</h2>

    <form action="placeorder.jsp" method="post" class="checkout-form">

        <label for="address">Delivery Address</label>
        <textarea name="address" id="address"
                  placeholder="Enter your delivery address"
                  required></textarea>

        <label for="payment">Payment Method</label>
        <select name="payment" id="payment">
            <option>Cash on Delivery</option>
            <option>UPI</option>
            <option>Card</option>
        </select>

        <button type="submit" class="place-order-btn">
            Place Order
        </button>

    </form>

</div>
<!-- ====================================================== -->

</body>
</html>
