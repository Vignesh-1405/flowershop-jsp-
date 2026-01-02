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
<title>Change Password</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
<style>
    
body{
    font-family:Segoe UI;
    background:#f5f5f5;
    padding:100px 20px;
}

.box{
    max-width:420px;
    margin:auto;
    background:#fff;
    padding:30px;
    border-radius:15px;
    box-shadow:0 10px 25px rgba(0,0,0,0.1);
}

.box h2{
    text-align:center;
    margin-bottom:25px;
}

.box input{
    width:100%;
    padding:12px;
    margin:10px 0;
    border-radius:8px;
    border:1px solid #ccc;
}

.box button{
    width:100%;
    padding:12px;
    border:none;
    background:#e84393;
    color:white;
    font-size:16px;
    border-radius:30px;
    cursor:pointer;
}

.box button:hover{
    background:#d63384;
}

.msg{
    text-align:center;
    margin-bottom:10px;
    color:red;
}
</style>
</head>

<body>

<%@ include file="navbar.jsp" %>

<div class="box">
    <h2>🔐 Change Password</h2>

    <% if(request.getParameter("msg") != null){ %>
        <p class="msg"><%=request.getParameter("msg")%></p>
    <% } %>

    <form action="changepasswordprocess.jsp" method="post">
        <input type="password" name="oldpass" placeholder="Old Password" required>
        <input type="password" name="newpass" placeholder="New Password" required>
        <input type="password" name="confirmpass" placeholder="Confirm Password" required>

        <button type="submit">Update Password</button>
    </form>
</div>

</body>
</html>
