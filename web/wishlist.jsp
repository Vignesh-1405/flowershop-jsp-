<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
String email = (String)session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
<title>My Wishlist</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
<style>
body{font-family:Segoe UI;background:#f5f5f5;padding:40px;}
.card{
 background:#fff;padding:15px;margin:10px;
 border-radius:10px;box-shadow:0 4px 10px rgba(0,0,0,.1);
}
.remove{background:red;color:white;padding:6px 10px;border:none;}
.empty{
 background:#fff;
 padding:30px;
 text-align:center;
 border-radius:10px;
 font-size:18px;
 color:#777;
}
</style>
</head>

<body>

<!-- ✅ Navbar ALWAYS visible -->
<%@ include file="navbar.jsp" %>

<h2>💖 My Wishlist</h2>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
 "jdbc:mysql://localhost:3306/flowerproducts",
 "root","Vicky345@"
);

PreparedStatement ps = conn.prepareStatement(
 "SELECT * FROM wishlist WHERE user_email=?");
ps.setString(1, email);
ResultSet rs = ps.executeQuery();

boolean hasItems = false;

while(rs.next()){
    hasItems = true;
%>

<div class="card">
  <img 
    src="<%=request.getContextPath()%>/images/<%=rs.getString("image")%>" 
    style="width:120px;height:120px;object-fit:cover;border-radius:8px;"
  >

  <h4><%=rs.getString("product_name")%></h4>
  <p>₹ <%=rs.getInt("price")%></p>

  <a href="removewishlist.jsp?pid=<%=rs.getInt("product_id")%>">
    <button class="remove">Remove</button>
  </a>
    <a href="movetocart.jsp?pid=<%=rs.getInt("product_id")%>
&name=<%=rs.getString("product_name")%>
&price=<%=rs.getInt("price")%>
&image=<%=rs.getString("image")%>">
    <button style="background:#28a745;color:white;padding:6px 10px;border:none;">
        Move to Cart
    </button>
</a>

</div>

<%
}

if(!hasItems){
%>
<div class="empty">
    💔 Your wishlist is empty  
    <br><br>
    <a href="home.jsp#products">Browse products</a>
</div>
<%
}

conn.close();
%>

</body>
</html>
