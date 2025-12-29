<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
if(session.getAttribute("admin")==null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Products</title>

<style>
/* 🌸 PAGE BACKGROUND */
body{
    margin:0;
    min-height:100vh;
    font-family:'Segoe UI',sans-serif;
    background:
        linear-gradient(rgba(0,0,0,0.45), rgba(0,0,0,0.45)),
        url("images/flower-bg.jpg") center/cover no-repeat;
    padding:60px 0;
}

/* 🌸 MAIN CARD */
.container{
    width:90%;
    max-width:1100px;
    margin:auto;
    background:rgba(255,255,255,0.92);
    backdrop-filter: blur(8px);
    border-radius:14px;
    padding:25px;
    box-shadow:0 10px 30px rgba(0,0,0,0.25);
}

/* HEADER */
.header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:20px;
}

.header h2{
    margin:0;
    color:#333;
}

/* BACK BUTTON */
.back-btn{
    padding:10px 16px;
    background:#28a745;
    color:white;
    border:none;
    border-radius:8px;
    cursor:pointer;
    font-size:14px;
}
.back-btn:hover{
    background:#218838;
}

/* 🌸 TABLE */
table{
    width:100%;
    border-collapse:collapse;
    margin-top:10px;
}

th{
    background:#e84393;
    color:white;
    padding:12px;
    text-align:center;
    font-size:14px;
}

td{
    padding:12px;
    text-align:center;
    border-bottom:1px solid #ddd;
    font-size:14px;
}

tr:hover{
    background:#fff0f6;
}

/* IMAGE */
.product-img{
    width:80px;
    height:80px;
    object-fit:cover;
    border-radius:8px;
    box-shadow:0 2px 6px rgba(0,0,0,0.15);
}

/* ACTION BUTTONS */
.action a{
    text-decoration:none;
    margin:0 5px;
    font-weight:600;
}

.edit{
    color:#007bff;
}
.delete{
    color:#dc3545;
}

/* OLD PRICE */
.old-price{
    color:#888;
}

/* RESPONSIVE */
@media(max-width:768px){
    table, thead, tbody, th, td, tr{
        font-size:12px;
    }
}
</style>
</head>

<body>

<div class="container">

    <div class="header">
        <h2>🌸 All Products</h2>
        <a href="admindashboard.jsp">
            <button class="back-btn">⬅ Dashboard</button>
        </a>
    </div>

    <table>
        <tr>
            <th>Image</th>
            <th>Name</th>
            <th>Price</th>
            <th>Old Price</th>
            <th>Category</th>
            <th>Stock</th>
            <th>Action</th>
        </tr>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/flowerproducts","root","Vicky345@");

Statement st = conn.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM productlist");

while(rs.next()){
%>
        <tr>
            <td>
                <img src="<%=request.getContextPath()%>/images/<%=rs.getString("image")%>"
                     class="product-img">
            </td>

            <td><%=rs.getString("name")%></td>
            <td>₹ <%=rs.getInt("price")%></td>
            <td class="old-price">
                <del>₹ <%=rs.getInt("old_price")%></del>
            </td>
            <td><%=rs.getString("category")%></td>
            <td><%=rs.getInt("stock")%></td>

            <td class="action">
                <a class="edit"
                   href="editproduct.jsp?pid=<%=rs.getInt("product_id")%>">
                   ✏️ Edit
                </a>
                |
                <a class="delete"
                href="deleteproduct.jsp?pid=<%=rs.getInt("product_id")%>"
                onclick="return confirm('Delete this product?')">
                ❌ Delete
                </a>

            </td>
        </tr>
<%
}
conn.close();
%>

    </table>

</div>

</body>
</html>
