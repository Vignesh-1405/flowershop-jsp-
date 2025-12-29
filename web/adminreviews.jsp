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
<title>Manage Reviews</title>
<style>
body{
    background:#f4f6f9;
    font-family:Arial;
    padding:30px;
}

/* TOP BAR */
.top-bar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:30px;
}

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

/* REVIEW CARD */
.card{
    background:#fff;
    padding:20px;
    margin-bottom:20px;
    border-radius:12px;
    box-shadow:0 6px 18px rgba(0,0,0,0.08);
}

.user{
    font-weight:bold;
    margin-bottom:5px;
}

.stars{
    color:#f7b731;
    margin-bottom:8px;
}

.comment{
    color:#555;
    margin-bottom:12px;
}

/* ACTION BUTTONS */
.btn{
    padding:8px 16px;
    border-radius:20px;
    text-decoration:none;
    font-size:14px;
    font-weight:bold;
    margin-right:10px;
}

.approve{
    background:#28a745;
    color:white;
}

.reject{
    background:#dc3545;
    color:white;
}

.btn:hover{
    opacity:0.9;
}
</style>
</head>

<body>

<!-- TOP BAR -->
<div class="top-bar">
    <h2>⭐ Manage Customer Reviews</h2>

    <a href="admindashboard.jsp">
        <button class="back-btn">⬅ Dashboard</button>
    </a>
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

    <a class="btn approve" href="approvereview.jsp?id=<%=rs.getInt("review_id")%>">
        Approve
    </a>

    <a class="btn reject" href="deletereview.jsp?id=<%=rs.getInt("review_id")%>">
        Reject
    </a>
</div>

<%
}
conn.close();

if(!found){
%>
<p>No pending reviews 🎉</p>
<%
}
%>

</body>
</html>
