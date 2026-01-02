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
<title>Admin | Messages</title>

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

.menu a:hover,
.menu a.active{
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
    margin-bottom:30px;
}

.header h2{
    color:#17a2b8; /* messages accent */
}

/* MESSAGE CARD */
.card{
    background:#ffffff;
    padding:22px;
    margin-bottom:20px;
    border-radius:20px;
    box-shadow:0 12px 30px rgba(0,0,0,0.08);
    border-left:6px solid #17a2b8;
}

/* TEXT */
.card p{
    margin-bottom:6px;
    color:#444;
}

/* STATUS */
.pending{
    color:#fd7e14;
    font-weight:600;
}

.replied{
    color:#27ae60;
    font-weight:600;
}

/* REPLY BUTTON */
.reply-btn{
    display:inline-block;
    margin-top:12px;
    padding:8px 20px;
    background:#17a2b8;
    color:white;
    border-radius:20px;
    text-decoration:none;
    font-size:14px;
    font-weight:600;
    transition:0.3s;
}

.reply-btn:hover{
    background:#138496;
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
            <a href="admin_users.jsp"><i class="fas fa-users"></i> Users</a>
            <a href="addproduct.jsp"><i class="fas fa-plus-circle"></i> Add Product</a>
            <a href="viewproducts.jsp"><i class="fas fa-list"></i> Products</a>
            <a href="adminorders.jsp"><i class="fas fa-box"></i> Orders</a>
            <a href="adminreviews.jsp"><i class="fas fa-star"></i> Reviews</a>
            <a href="#" class="active"><i class="fas fa-envelope"></i> Messages</a>
            <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>

    <!-- MAIN -->
    <div class="main">

        <div class="header">
            <h2>📩 User Contact Messages</h2>
            <div><i class="fas fa-user-shield"></i> Admin</div>
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

            <a class="reply-btn"
               href="replyContact.jsp?id=<%=rs.getInt("id")%>">
                Reply
            </a>
        </div>

<% } conn.close(); %>

    </div>
</div>

</body>
</html>
