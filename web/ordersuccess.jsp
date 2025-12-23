<%-- 
    Document   : ordersuccess
    Created on : 23-Dec-2025, 10:18:26 pm
    Author     : VIGNESH S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Order Success</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body{
            padding-top: 90px;
            background:#f5f5f5;
        }
        .success-box{
            max-width: 600px;
            margin: 80px auto;
            background:#fff;
            padding: 30px;
            text-align:center;
            border-radius: 10px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.08);
        }
        .success-box h2{
            color:#28a745;
        }
        .success-box a{
            display:inline-block;
            margin-top:20px;
            padding:12px 25px;
            background:#e84393;
            color:#fff;
            border-radius:6px;
            text-decoration:none;
        }
        .success-box a:hover{
            background:#d63384;
        }
    </style>
</head>
<body>

<%@ include file="navbar.jsp" %>

<div class="success-box">
    <h2>🎉 Order Placed Successfully!</h2>
    <p>Thank you for your order 🌸</p>

    <a href="home.jsp">Continue Shopping</a>
</div>

</body>
</html>


