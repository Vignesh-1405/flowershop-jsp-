<%-- 
    Document   : navbar
    Created on : 23-Dec-2025
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String navUser = (String) session.getAttribute("user");
String navPic  = (String) session.getAttribute("profilePic");

if(navPic == null){
    navPic = "default.png";
}
%>

<style>
/* NAVBAR HEIGHT */
header{
    height:70px;
}

/* ICON AREA */
header .icons{
    display:flex;
    align-items:center;
}

/* PROFILE LINK */
.nav-profile-link{
    width:38px;
    height:38px;
    display:flex;
    align-items:center;
    justify-content:center;
}

/* PROFILE IMAGE */
.nav-profile-img{
    width:38px;
    height:38px;
    border-radius:50%;
    object-fit:cover;
}
</style>

<header>
    <input type="checkbox" id="toggler">
    <label for="toggler" class="fas fa-bars"></label>

    <a href="home.jsp" class="logo">flower<span>.</span></a>

    <nav class="navbar">
        <a href="home.jsp#home">home</a>
        <a href="home.jsp#about">about</a>
        <a href="home.jsp#products">products</a>
        <a href="home.jsp#review">review</a>

        <% if(navUser != null){ %>
            <a href="myMessages.jsp">My Messages</a>
        <% } %>

        <a href="home.jsp#contact">contact</a>
        <a href="logout.jsp" class="fas fa-sign-out-alt"></a>
    </nav>

    <div class="icons">
        <a href="wishlist.jsp" class="fas fa-heart"></a>
        <a href="cart.jsp" class="fas fa-shopping-cart"></a>
        <a href="myorders.jsp" class="fas fa-box"></a>

        <% if(navUser != null){ %>
            <a href="userprofile.jsp" class="nav-profile-link">
                <img src="profilepics/<%=navPic%>?v=<%=System.currentTimeMillis()%>"
                     onerror="this.src='profilepics/default.png';"
                     class="nav-profile-img">
            </a>
        <% } else { %>
            <a href="login.jsp" class="fas fa-user"></a>
        <% } %>
    </div>
</header>
