<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
String user = (String)session.getAttribute("user");
if(user == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>My Reviews</title>
<style>
body{font-family:Segoe UI;background:#f5f5f5;padding:80px;}
.review{
    background:#fff;
    padding:20px;
    margin:15px auto;
    max-width:700px;
    border-radius:12px;
    box-shadow:0 4px 10px rgba(0,0,0,0.1);
}
.star{color:#f7b731;}
.status{font-size:13px;color:#777;}
</style>
</head>
<body>

<%@ include file="navbar.jsp" %>

<h2 style="text-align:center;">My Reviews</h2>

<%
Connection conn = DriverManager.getConnection(
 "jdbc:mysql://localhost:3306/flowerproducts","root","Vicky345@");

PreparedStatement ps = conn.prepareStatement(
 "SELECT * FROM reviews WHERE user_email=? ORDER BY created_at DESC");
ps.setString(1,user);

ResultSet rs = ps.executeQuery();

while(rs.next()){
%>

<div class="review">
    <% for(int i=1;i<=rs.getInt("rating");i++){ %>
        <span class="star">★</span>
    <% } %>
    <p><%=rs.getString("comment")%></p>
    <p class="status">Status: <%=rs.getString("status")%></p>
</div>

<%
}
conn.close();
%>

</body>
</html>
