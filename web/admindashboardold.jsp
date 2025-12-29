<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>

    <style>
        .reviews{ background:#6f42c1; }

        body{
            margin:0;
            height:100vh;
            font-family: 'Segoe UI', Arial, sans-serif;

            /* 🌸 Flower background */
            background: linear-gradient(
                        rgba(0,0,0,0.45),
                        rgba(0,0,0,0.45)
                       ),
                       url("images/admin-bg.jpg") no-repeat center center/cover;

            display:flex;
            justify-content:center;
            align-items:center;
        }

        .box{
            width:360px;
            padding:30px;
            background: rgba(255,255,255,0.15);
            backdrop-filter: blur(10px);
            border-radius:15px;
            text-align:center;
            box-shadow:0 8px 25px rgba(0,0,0,0.3);
            color:white;
        }

        .box h2{
            margin-bottom:25px;
            font-size:26px;
            color:#fff;
        }

        .box a{
            display:block;
            margin:12px 0;
            padding:14px;
            font-size:16px;
            font-weight:600;
            border-radius:30px;
            text-decoration:none;
            color:white;
            transition:0.3s;
        }

        .add{ background:#28a745; }
        .view{ background:#17a2b8; }
        .orders{ background:#e84393; }
        .logout{ background:#dc3545; }
        .users{ background:pink; }

        .box a:hover{
            transform: scale(1.05);
            opacity:0.9;
        }

        footer{
            position:fixed;
            bottom:15px;
            color:#fff;
            font-size:14px;
            opacity:0.8;
        }
        .contacts{ background:#fd7e14; } /* orange */

    </style>
</head>

<body>

<div class="box">
    <h2>🌸 Flower Shop Admin</h2>

    <a href="addproduct.jsp" class="add">➕ Add Product</a>
    <a href="viewproducts.jsp" class="view">📋 View Products</a>
    <a href="adminorders.jsp" class="orders">📦 View Orders</a>

    <!-- ✅ NEW REVIEW SECTION -->
    <a href="adminreviews.jsp" class="reviews">⭐ Manage Reviews</a>
    <a href="adminContact.jsp" class="contacts">📩 Contact Messages</a>
    <a href="admin_users.jsp" class="users">👥 View Users</a>



    <a href="logout.jsp" class="logout">🚪 Logout</a>
</div>


<footer>
    © 2025 Flower Shop Admin Panel
</footer>

</body>
</html>
