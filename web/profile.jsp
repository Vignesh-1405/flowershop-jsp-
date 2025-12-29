<%-- 
    Document   : profile
    Created on : 26-Dec-2025, 7:48:39 pm
    Author     : VIGNESH S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">

<style>
/*body{
    font-family:Segoe UI;
    background:#f5f5f5;
    padding:100px 20px;
}*/
body{
    padding-top:90px;   /* only top for fixed navbar */
    padding-left:20px;
    padding-right:20px;
}

.profile-box{
    max-width:420px;
    margin:auto;
    background:#fff;
    padding:30px;
    border-radius:15px;
    box-shadow:0 10px 25px rgba(0,0,0,0.1);
    text-align:center;
}

.profile-box img{
    width:130px;
    height:130px;
    border-radius:50%;
    object-fit:cover;
    margin-bottom:15px;
    border:3px solid #e84393;
}

.profile-box input{
    width:100%;
    padding:10px;
    margin:10px 0;
}

.profile-box button{
    padding:10px 30px;
    background:#e84393;
    color:#fff;
    border:none;
    border-radius:30px;
    cursor:pointer;
}

.msg{
    color:green;
    margin-bottom:10px;
}
</style>
</head>

<body>

<%@ include file="navbar.jsp" %>

<div class="profile-box">

    <% if(request.getParameter("msg") != null){ %>
        <p class="msg"><%=request.getParameter("msg")%></p>
    <% } %>

    <!-- DEFAULT IMAGE -->
    


<%@page import="java.sql.*"%>

<%

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}

//String profilePic = "default.png";
//
//Class.forName("com.mysql.cj.jdbc.Driver");
//Connection conn = DriverManager.getConnection(
// "jdbc:mysql://localhost:3306/newuserlogin","root","Vicky345@"
//);
//
//PreparedStatement ps = conn.prepareStatement(
// "SELECT profile_pic FROM userlist WHERE email=?"
//);
//ps.setString(1, user);
//ResultSet rs = ps.executeQuery();
//
//if(rs.next() && rs.getString("profile_pic") != null){
//    profilePic = rs.getString("profile_pic");
//}
//conn.close();
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

session.setAttribute("profilePic", profilePic); // ⭐ VERY IMPORTANT

conn.close();

%>


    <img src="profilepics/<%=profilePic%>" alt="Profile">



    <h3><%=user%></h3>

  <form action="UploadProfilePicServlet"
      method="post"
      enctype="multipart/form-data">

    <input type="file" name="photo" required>
    <button type="submit">Upload</button>

</form>

</div>

</body>
</html>
