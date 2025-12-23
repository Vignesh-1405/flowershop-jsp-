<%-- 
    Document   : navbar
    Created on : 23-Dec-2025, 9:39:20 pm
    Author     : VIGNESH S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <header>
        <input type="checkbox" name="" id="toggler">
        <label for="toggler" class="fas fa-bars"></label>
        <a href="#" class="logo">flower<span>.</span></a>

        
    <nav class="navbar">
    <a href="home.jsp#home">home</a>
    <a href="home.jsp#about">about</a>
    <a href="home.jsp#products">products</a>
    <a href="home.jsp#review">review</a>
    <a href="home.jsp#contact">contact</a>
    <a href="logout.jsp" class="fas fa-sign-out-alt"></a>
    </nav>

        <div class="icons">
            <a href="wishlist.html" class="fas fa-heart" ></a>
            <a href="cart.jsp" class="fas fa-shopping-cart"></a>
            <a href="myorders.jsp" class="fas fa-box"></a>
            <a href="#" class="fas fa-user"></a>
        </div>
    </header>
    </body>
</html>
