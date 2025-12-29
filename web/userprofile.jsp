<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String user = (String)session.getAttribute("user");
if(user == null){
    response.sendRedirect("login.jsp");
    return;
}
%>
 <%@page import="java.sql.*"%>
<%
String profilePic = "default.png";

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
 "jdbc:mysql://localhost:3306/newuserlogin","root","Vicky345@"
);

PreparedStatement ps = conn.prepareStatement(
 "SELECT profile_pic FROM userlist WHERE email=?"
);
ps.setString(1, user);
ResultSet rs = ps.executeQuery();

if(rs.next() && rs.getString("profile_pic") != null){
    profilePic = rs.getString("profile_pic");
}
conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<title>My Account</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">

<style>
/*body{
    font-family:Segoe UI;
    background:#f5f5f5;
    padding:100px 20px;
}

.profile-box{
    max-width:900px;
    margin:auto;
    background:#fff;
    padding:30px;
    border-radius:15px;
    box-shadow:0 10px 25px rgba(0,0,0,0.1);
}

.profile-header{
    display:flex;
    align-items:center;
    gap:20px;
    margin-bottom:30px;
}

.profile-header i{
    font-size:60px;
    color:#e84393;
}

.profile-header h2{
    margin:0;
}

.profile-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(200px,1fr));
    gap:20px;
}

.profile-card{
    background:#fff5f8;
    padding:25px;
    border-radius:12px;
    text-align:center;
    transition:0.3s;
    cursor:pointer;
}

.profile-card:hover{
    transform:translateY(-6px);
    box-shadow:0 6px 15px rgba(0,0,0,0.1);
}

.profile-card i{
    font-size:30px;
    margin-bottom:10px;
    color:#e84393;
}

.profile-card a{
    text-decoration:none;
    color:#333;
    font-weight:600;
}
.profile-pic-wrapper{
    position:relative;
    width:80px;
    height:80px;
}

.profile-pic{
    width:80px;
    height:80px;
    border-radius:50%;
    object-fit:cover;
    border:3px solid #e84393;
}

.edit-icon{
    position:absolute;
    bottom:0;
    right:0;
    background:#e84393;
    width:26px;
    height:26px;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
    color:#fff;
    font-size:12px;
    border:2px solid #fff;
}*/
body{
    font-family:Segoe UI;
    background:#f5f5f5;
    padding:100px 20px;
}

.profile-box{
    max-width:900px;
    margin:auto;
    background:#fff;
    padding:30px;
    border-radius:15px;
    box-shadow:0 10px 25px rgba(0,0,0,0.1);
}

/* HEADER */
.profile-header{
    display:flex;
    align-items:center;
    gap:20px;
    margin-bottom:30px;
}

/* PROFILE IMAGE WRAPPER */
.profile-pic-wrapper{
    position:relative;
    width:90px;
    height:90px;
    flex-shrink:0;
}

/* PROFILE IMAGE */
.profile-pic{
    width:100%;
    height:100%;
    border-radius:50%;
    object-fit:cover;
    border:3px solid #e84393;
    display:block;
}

/* EDIT ICON (SMALL & CLEAN) */
.edit-icon{
    position:absolute;
    bottom:2px;
    right:2px;
    width:22px;
    height:22px;
    background:#e84393;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
    color:#fff;
    font-size:10px;
    border:2px solid #fff;
}

/* REMOVE LINK STYLE */
.profile-link{
    display:block;
    text-decoration:none;
}

/* TEXT */
.profile-text h2{
    margin:0;
}

.profile-text p{
    margin:4px 0 0;
    font-size:14px;
    color:#555;
}

/* GRID */
.profile-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(200px,1fr));
    gap:20px;
}

.profile-card{
    background:#fff5f8;
    padding:25px;
    border-radius:12px;
    text-align:center;
    transition:0.3s;
    cursor:pointer;
}

.profile-card:hover{
    transform:translateY(-6px);
    box-shadow:0 6px 15px rgba(0,0,0,0.1);
}

.profile-card i{
    font-size:30px;
    margin-bottom:10px;
    color:#e84393;
}

.profile-card a{
    text-decoration:none;
    color:#333;
    font-weight:600;
}
.profile-header{
    display:flex;
    align-items:center;
    gap:30px;
    margin-bottom:30px;
}

/* PROFILE IMAGE ONLY FOR USERPROFILE */
.profile-pic-box{
    display:flex;
    flex-direction:column;
    align-items:center;
}

.profile-main-pic{
    width:120px;
    height:120px;
    border-radius:50%;
    object-fit:cover;
    border:4px solid #e84393;
}

.edit-profile-btn{
    margin-top:8px;
    font-size:13px;
    color:#e84393;
    text-decoration:none;
    font-weight:600;
}

.edit-profile-btn i{
    margin-right:5px;
}
/* HIDE NAVBAR PROFILE IMAGE ONLY IN USERPROFILE PAGE */
.nav-profile-link{
    display:none !important;
}


</style>
</head>

<body>
   


<%@ include file="navbar.jsp" %>

<div class="profile-box">

 <div class="profile-header">

    <div class="profile-pic-box">
        <img src="profilepics/<%=profilePic%>"
             onerror="this.src='profilepics/default.png';"
             class="profile-main-pic">

        <a href="profile.jsp" class="edit-profile-btn">
            <i class="fas fa-pen"></i> Edit Profile
        </a>
    </div>

    <div class="profile-text">
        <h2>Welcome</h2>
        <p><%=user%></p>
    </div>

</div>



    <div class="profile-grid">

        <div class="profile-card">
            <i class="fas fa-box"></i><br>
            <a href="myorders.jsp">My Orders</a>
        </div>

        <div class="profile-card">
            <i class="fas fa-heart"></i><br>
            <a href="wishlist.jsp">My Wishlist</a>
        </div>

        <div class="profile-card">
            <i class="fas fa-star"></i><br>
            <a href="myreviews.jsp">My Reviews</a>
        </div>

        <div class="profile-card">
            <i class="fas fa-key"></i><br>
            <a href="changepassword.jsp">Change Password</a>
        </div>

        <div class="profile-card">
            <i class="fas fa-sign-out-alt"></i><br>
            <a href="logout.jsp">Logout</a>
        </div>

    </div>

</div>

</body>
</html>
