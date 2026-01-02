<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
String admin = (String)session.getAttribute("admin");
if(admin == null){
    response.sendRedirect("adminlogin.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin | Reviews</title>

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
    color:#f7b731; /* ⭐ review accent */
}

/* REVIEW CARD */
.card{
    background:#ffffff;
    padding:22px;
    margin-bottom:20px;
    border-radius:20px;
    box-shadow:0 12px 30px rgba(0,0,0,0.08);
    border-left:6px solid #f7b731;
}

/* USER */
.user{
    font-weight:600;
    margin-bottom:6px;
    color:#333;
}

/* STARS */
.stars{
    color:#f7b731;
    font-size:18px;
    margin-bottom:10px;
}

/* COMMENT */
.comment{
    color:#555;
    margin-bottom:14px;
}

/* BUTTONS */
.btn{
    display:inline-block;
    padding:8px 18px;
    border-radius:20px;
    text-decoration:none;
    font-size:14px;
    font-weight:600;
    margin-right:10px;
}

.approve{
    background:#27ae60;
    color:white;
}

.reject{
    background:#e74c3c;
    color:white;
}

.btn:hover{
    opacity:0.9;
}

/* EMPTY STATE */
.empty{
    color:#888;
    font-size:15px;
    margin-top:20px;
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
            <a href="#" class="active"><i class="fas fa-star"></i> Reviews</a>
            <a href="adminContact.jsp"><i class="fas fa-envelope"></i> Messages</a>
            <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>

    <!-- MAIN -->
    <div class="main">

        <div class="header">
            <h2>⭐ Manage Customer Reviews</h2>
            <div><i class="fas fa-user-shield"></i> Admin</div>
        </div>

<%
Connection conn = DriverManager.getConnection(
 "jdbc:mysql://localhost:3306/flowerproducts","root","Vicky345@"
);

PreparedStatement ps = conn.prepareStatement(
 "SELECT * FROM reviews WHERE status='pending' ORDER BY created_at DESC"
);
ResultSet rs = ps.executeQuery();

boolean found = false;

while(rs.next()){
    found = true;
%>

        <div class="card">

            <div class="user">
                👤 <%=rs.getString("user_email")%>
            </div>

            <div class="stars">
                <% for(int i=1;i<=rs.getInt("rating");i++){ %>
                    ★
                <% } %>
            </div>

            <div class="comment">
                <%=rs.getString("comment")%>
            </div>

            <a class="btn approve"
               href="approvereview.jsp?id=<%=rs.getInt("review_id")%>">
                Approve
            </a>

            <a class="btn reject"
               href="deletereview.jsp?id=<%=rs.getInt("review_id")%>">
                Reject
            </a>

        </div>

<%
}
conn.close();

if(!found){
%>
        <p class="empty">No pending reviews 🎉</p>
<%
}
%>

    </div>
</div>

</body>
</html>
