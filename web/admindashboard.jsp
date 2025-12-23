<%-- 
    Document   : admindashboard
    Created on : 22-Dec-2025, 8:35:46 pm
    Author     : VIGNESH S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body { font-family: Arial; background:#f4f4f4; }
        .box {
            width: 300px;
            margin: 100px auto;
            padding: 20px;
            background: white;
            text-align: center;
            border-radius: 8px;
        }
        a {
            display: block;
            margin: 10px 0;
            padding: 10px;
            background: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        a.logout { background:#dc3545; }
    </style>
</head>
<body>

<div class="box">
    <h2>Welcome Admin 👋</h2>

    <a href="addproduct.jsp">➕ Add Product</a>
    <a href="viewproducts.jsp">📋 View Products</a>
    <a href="adminorders.jsp">📦 View Orders</a>
    <a href="logout.jsp" class="logout">🚪 Logout</a>
</div>

</body>
</html>

