<%-- 
    Document   : admin_users
    Created on : 29-Dec-2025, 5:48:34 pm
    Author     : VIGNESH S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>

<%
String admin = (String) session.getAttribute("admin");
if(admin == null){
    response.sendRedirect("adminlogin.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>User Management</title>
<link rel="stylesheet" href="style.css">

<style>
.user-table{
    width:100%;
    border-collapse:collapse;
    margin-top:30px;
}
.user-table th, .user-table td{
    padding:12px;
    border-bottom:1px solid #ddd;
    text-align:center;
}
.user-table th{
    background:#f5f5f5;
}
.user-img{
    width:40px;
    height:40px;
    border-radius:50%;
    object-fit:cover;
}
.btn{
    padding:6px 12px;
    border:none;
    border-radius:6px;
    cursor:pointer;
    color:#fff;
}
.block{ background:#f39c12; }
.delete{ background:#e74c3c; }
.active{ color:green; font-weight:bold; }
.blocked{ color:red; font-weight:bold; }

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
</style>
</head>

<body>


<div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:25px;">
    <h2>👥 User Management</h2>

    <a href="admindashboard.jsp">
        <button class="back-btn">⬅ Dashboard</button>
    </a>
</div>


<table class="user-table">
<tr>
    <th>Photo</th>
    <th>Email</th>
    <th>Status</th>
    <th>Actions</th>
</tr>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
 "jdbc:mysql://localhost:3306/newuserlogin","root","Vicky345@"
);

PreparedStatement ps = conn.prepareStatement(
 "SELECT email, profile_pic, status FROM userlist WHERE role='user'"
);
ResultSet rs = ps.executeQuery();

while(rs.next()){
    String pic = rs.getString("profile_pic");
    if(pic == null) pic = "default.png";
    String status = rs.getString("status");
%>

<tr>
    <td>
        <img src="profilepics/<%=pic%>"
             onerror="this.src='profilepics/default.png';"
             class="user-img">
    </td>
    <td><%=rs.getString("email")%></td>

    <td class="<%=status.equals("active") ? "active" : "blocked"%>">
        <%=status%>
    </td>

    <td>
        <!-- BLOCK / UNBLOCK -->
        <a href="blockUser.jsp?email=<%=rs.getString("email")%>"
           class="btn block">
           <%= status.equals("active") ? "Block" : "Unblock" %>
        </a>

        <!-- DELETE -->
        
        <% if(!rs.getString("email").equals(admin)) { %>
    <a href="deleteUser.jsp?email=<%=rs.getString("email")%>"
       class="btn delete"
       onclick="return confirm('Are you sure to delete this user?');">
       Delete
    </a>
<% } else { %>
    <span style="color:#999;">Admin</span>
<% } %>

    </td>
</tr>

<% } conn.close(); %>

</table>

</body>
</html>

