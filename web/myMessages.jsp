<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String userEmail = (String) session.getAttribute("user");

if(userEmail == null){
    response.sendRedirect("login.jsp");
    return;
}

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
 "jdbc:mysql://localhost:3306/flowerproducts","root","Vicky345@"
);

PreparedStatement ps = conn.prepareStatement(
 "SELECT m.message, m.created_at, m.status, r.reply, r.replied_at " +
 "FROM contact_messages m " +
 "LEFT JOIN contact_replies r ON m.id = r.message_id " +
 "WHERE m.email = ? ORDER BY m.created_at DESC"
);

ps.setString(1, userEmail);
ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<title>My Messages</title>
<style>
    .top-bar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:30px;
}

.home-btn{
    background:linear-gradient(135deg,#e84393,#ff6fae);
    color:white;
    border:none;
    padding:10px 22px;
    border-radius:25px;
    font-size:14px;
    font-weight:600;
    cursor:pointer;
    box-shadow:0 6px 18px rgba(232,67,147,0.4);
    transition:0.3s;
}

.home-btn:hover{
    transform:translateY(-2px);
    box-shadow:0 10px 25px rgba(232,67,147,0.6);
}

body{
    font-family:Arial;
    background:#f7f7f7;
    padding:40px;
}
.card{
    background:#fff;
    padding:20px;
    border-radius:12px;
    margin-bottom:20px;
    box-shadow:0 6px 18px rgba(0,0,0,0.08);
}
.user-msg{
    color:#333;
}
.admin-reply{
    margin-top:10px;
    padding:12px;
    background:#fff5f8;
    border-left:4px solid #e84393;
}
.pending{
    color:orange;
    font-weight:bold;
}
</style>
</head>

<body>

<div class="top-bar">
    <h2>📩 My Messages</h2>

    <a href="home.jsp">
        <button class="home-btn">🏠 Home</button>
    </a>
</div>


<%
boolean found = false;
while(rs.next()){
    found = true;
%>

<div class="card">
    <p class="user-msg">
        <strong>You:</strong>
        <%= rs.getString("message") %>
    </p>

    <%
    if("replied".equals(rs.getString("status"))){
    %>
        <div class="admin-reply">
            <strong>Admin Reply:</strong><br>
            <%= rs.getString("reply") %>
        </div>
    <%
    } else {
    %>
        <p class="pending">⏳ Waiting for admin reply</p>
    <%
    }
    %>
</div>

<%
}
if(!found){
%>
<p>No messages found</p>
<%
}
conn.close();
%>

</body>
</html>
