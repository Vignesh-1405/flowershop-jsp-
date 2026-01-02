<%-- 
    Document   : admin_users
    Author     : VIGNESH S
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>Admin | Users</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
*{margin:0;padding:0;box-sizing:border-box;}

body{
    font-family:'Poppins','Segoe UI',sans-serif;
    background:#fdfdfd;
}

/* LAYOUT */
.container{
    min-height:100vh;
}

/* SIDEBAR (FIXED) */
.sidebar{
    width:250px;
    height:100vh;
    position:fixed;
    top:0;
    left:0;
    background:linear-gradient(180deg,#e84393,#fd79a8);
    color:#fff;
    padding:25px 20px;
    overflow-y:auto;
}

.logo{
    font-size:22px;
    font-weight:600;
    margin-bottom:35px;
}

.menu a{
    display:flex;
    align-items:center;
    gap:12px;
    padding:14px 15px;
    margin-bottom:10px;
    text-decoration:none;
    color:#fff;
    border-radius:12px;
    transition:0.3s;
}

.menu a.active,
.menu a:hover{
    background:rgba(255,255,255,0.25);
}

/* MAIN */
.main{
    margin-left:250px;
    padding:30px;
    min-height:100vh;
}

/* HEADER */
.header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:25px;
}

.header h2{
    color:#27ae60; /* users accent */
}

/* TABLE CARD */
.table-card{
    background:#ffffff;
    padding:25px;
    border-radius:20px;
    box-shadow:0 12px 30px rgba(0,0,0,0.08);
}

/* TABLE */
.user-table{
    width:100%;
    border-collapse:collapse;
    margin-top:15px;
}

.user-table th,
.user-table td{
    padding:14px;
    border-bottom:1px solid #eee;
    text-align:center;
    font-size:14px;
}

.user-table th{
    background:#f1f5f9;
    font-weight:600;
}

/* USER IMAGE */
.user-img{
    width:42px;
    height:42px;
    border-radius:50%;
    object-fit:cover;
    box-shadow:0 3px 8px rgba(0,0,0,0.15);
}

/* STATUS */
.active{
    color:#27ae60;
    font-weight:600;
}

.blocked{
    color:#e74c3c;
    font-weight:600;
}

/* BUTTONS */
.btn{
    padding:8px 16px;
    border-radius:20px;
    cursor:pointer;
    color:#fff;
    font-size:13px;
    text-decoration:none;
    margin-right:6px;
    display:inline-block;
}

.block{ background:#f39c12; }
.unblock{ background:#27ae60; }
.delete{ background:#e74c3c; }

.btn:hover{
    opacity:0.9;
}
</style>
</head>

<body>

<div class="container">

    <!-- SIDEBAR -->
    <div class="sidebar">
        <div class="logo">🌸 Flower Admin</div>
        <div class="menu">
            <a href="admindashboard.jsp"><i class="fas fa-home"></i> Dashboard</a>
            <a href="#" class="active"><i class="fas fa-users"></i> Users</a>
            <a href="addproduct.jsp"><i class="fas fa-plus-circle"></i> Add Product</a>
            <a href="viewproducts.jsp"><i class="fas fa-list"></i> Products</a>
            <a href="adminorders.jsp"><i class="fas fa-box"></i> Orders</a>
            <a href="adminreviews.jsp"><i class="fas fa-star"></i> Reviews</a>
            <a href="adminContact.jsp"><i class="fas fa-envelope"></i> Messages</a>
            <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>

    <!-- MAIN -->
    <div class="main">

        <div class="header">
            <h2>👥 User Management</h2>
            <div><i class="fas fa-user-shield"></i> Admin</div>
        </div>

        <div class="table-card">

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
                        <a href="blockUser.jsp?email=<%=rs.getString("email")%>"
                           class="btn <%= status.equals("active") ? "block" : "unblock" %>">
                           <%= status.equals("active") ? "Block" : "Unblock" %>
                        </a>

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

        </div>
    </div>

</div>

</body>
</html>
