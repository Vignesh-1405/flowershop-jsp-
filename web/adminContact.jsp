<%@ page import="java.sql.*" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

PreparedStatement ps = conn.prepareStatement(
 "SELECT * FROM contact_messages ORDER BY created_at DESC"
);
ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin - Contact Messages</title>
<style>
    .back-btn{
    background:linear-gradient(135deg,#6f42c1,#8e63f4);
    color:white;
    border:none;
    padding:10px 22px;
    border-radius:25px;
    font-size:14px;
    font-weight:600;
    cursor:pointer;
    box-shadow:0 6px 18px rgba(111,66,193,0.4);
    transition:0.3s;
}

.back-btn:hover{
    transform:translateY(-2px);
    box-shadow:0 10px 25px rgba(111,66,193,0.6);
}

body{
    font-family:Arial;
    background:#f4f6f9;
    padding:30px;
}
.card{
    background:#fff;
    padding:20px;
    margin-bottom:20px;
    border-radius:12px;
    box-shadow:0 6px 18px rgba(0,0,0,0.08);
}
.pending{ color:#fd7e14; font-weight:bold; }
.replied{ color:#28a745; font-weight:bold; }
.reply-btn{
    display:inline-block;
    margin-top:10px;
    padding:8px 16px;
    background:#6f42c1;
    color:white;
    border-radius:20px;
    text-decoration:none;
}
</style>
</head>

<body>

<div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:25px;">
    <h2>📩 User Contact Messages</h2>

    <a href="admindashboard.jsp">
        <button class="back-btn">⬅ Dashboard</button>
    </a>
</div>


<% while(rs.next()){ %>
<div class="card">
    <p><strong>Name:</strong> <%=rs.getString("name")%></p>
    <p><strong>Email:</strong> <%=rs.getString("email")%></p>
    <p><strong>Message:</strong> <%=rs.getString("message")%></p>

    <p>
        <strong>Status:</strong>
        <span class="<%=rs.getString("status")%>">
            <%=rs.getString("status")%>
        </span>
    </p>

    <a class="reply-btn" href="replyContact.jsp?id=<%=rs.getInt("id")%>">
        Reply
    </a>
</div>
<% } %>

</body>
</html>

<% conn.close(); %>
