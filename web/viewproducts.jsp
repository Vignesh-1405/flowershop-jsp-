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
<title>Admin | Products</title>

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
    display:flex;
    min-height:100vh;
}

/* SIDEBAR */
.sidebar{
    width:250px;
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
    flex:1;
    padding:30px;
}

/* HEADER */
.header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:25px;
}

.header h2{
    color:#e84393;
}

/* TABLE CARD */
.table-card{
    background:#ffffff;
    padding:25px;
    border-radius:20px;
    box-shadow:0 12px 30px rgba(0,0,0,0.08);
}

/* TABLE */
table{
    width:100%;
    border-collapse:collapse;
}

th{
    background:#fde2ea;
    color:#e84393;
    padding:14px;
    text-align:center;
    font-weight:600;
}

td{
    padding:14px;
    text-align:center;
    border-bottom:1px solid #eee;
    font-size:14px;
}

tr:hover{
    background:#fff0f6;
}

/* IMAGE */
.product-img{
    width:70px;
    height:70px;
    object-fit:cover;
    border-radius:10px;
    box-shadow:0 4px 12px rgba(0,0,0,0.15);
}

/* ACTION BUTTONS */
.action a{
    text-decoration:none;
    padding:6px 10px;
    border-radius:6px;
    font-size:13px;
    font-weight:600;
}

.edit{
    color:#0984e3;
}

.delete{
    color:#e74c3c;
}

/* OLD PRICE */
.old-price{
    color:#999;
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
            <a href="#" class="active"><i class="fas fa-list"></i> Products</a>
            <a href="adminorders.jsp"><i class="fas fa-box"></i> Orders</a>
            <a href="adminreviews.jsp"><i class="fas fa-star"></i> Reviews</a>
            <a href="adminContact.jsp"><i class="fas fa-envelope"></i> Messages</a>
            <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>

    <!-- MAIN -->
    <div class="main">

        <div class="header">
            <h2>🌸 All Products</h2>
            <div><i class="fas fa-user-shield"></i> Admin</div>
        </div>

        <div class="table-card">

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

    </div>
</div>

</body>
</html>
