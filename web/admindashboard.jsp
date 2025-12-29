<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
body{
    margin:0;
    min-height:100vh;
    font-family: 'Segoe UI', Arial, sans-serif;
    background: linear-gradient(
                rgba(0,0,0,0.45),
                rgba(0,0,0,0.45)
               ),
               url("images/admin-bg.jpg") no-repeat center/cover;
    display:flex;
    justify-content:center;
    align-items:center;
}

/* MAIN GLASS CONTAINER */
.dashboard{
    width:90%;
    max-width:1000px;
    padding:30px;
    background: rgba(255,255,255,0.15);
    backdrop-filter: blur(12px);
    border-radius:20px;
    box-shadow:0 10px 35px rgba(0,0,0,0.35);
    color:white;
}

/* TITLE */
.dashboard h2{
    text-align:center;
    margin-bottom:25px;
    font-size:28px;
}

/* STATS ROW */
.stats{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(150px,1fr));
    gap:15px;
    margin-bottom:30px;
}
.stat{
    background: rgba(255,255,255,0.2);
    padding:18px;
    border-radius:15px;
    text-align:center;
}
.stat i{
    font-size:22px;
    margin-bottom:6px;
}
.stat h3{
    margin:5px 0;
    font-size:22px;
}
.stat p{
    margin:0;
    font-size:14px;
    opacity:0.9;
}

/* ACTION CARDS */
.cards{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
    gap:20px;
}

.card{
    padding:22px;
    border-radius:18px;
    text-align:center;
    text-decoration:none;
    color:white;
    font-weight:600;
    transition:0.3s;
}
.card i{
    font-size:28px;
    margin-bottom:10px;
}
.card:hover{
    transform:translateY(-6px) scale(1.03);
    opacity:0.95;
}

/* CARD COLORS */
.add{ background:#28a745; }
.view{ background:#17a2b8; }
.orders{ background:#e84393; }
.users{ background:#6f42c1; }
.reviews{ background:#fd7e14; }
.contacts{ background:#20c997; }
.logout{ background:#dc3545; }

/* FOOTER */
.footer{
    text-align:center;
    margin-top:25px;
    font-size:14px;
    opacity:0.8;
}
</style>
</head>

<body>

<div class="dashboard">

    <h2>🌸 Flower Shop Admin Dashboard</h2>

    <!-- STATS ROW -->
    <div class="stats">
        <div class="stat">
            <i class="fas fa-box"></i>
            <h3>120</h3>
            <p>Products</p>
        </div>
        <div class="stat">
            <i class="fas fa-users"></i>
            <h3>85</h3>
            <p>Users</p>
        </div>
        <div class="stat">
            <i class="fas fa-shopping-cart"></i>
            <h3>42</h3>
            <p>Orders</p>
        </div>
        <div class="stat">
            <i class="fas fa-star"></i>
            <h3>18</h3>
            <p>Reviews</p>
        </div>
    </div>

    <!-- ACTION CARDS -->
    <div class="cards">
        <a href="addproduct.jsp" class="card add">
            <i class="fas fa-plus-circle"></i>
            Add Product
        </a>

        <a href="viewproducts.jsp" class="card view">
            <i class="fas fa-list"></i>
            View Products
        </a>

        <a href="adminorders.jsp" class="card orders">
            <i class="fas fa-box"></i>
            Orders
        </a>

        <a href="admin_users.jsp" class="card users">
            <i class="fas fa-users"></i>
            Users
        </a>

        <a href="adminreviews.jsp" class="card reviews">
            <i class="fas fa-star"></i>
            Reviews
        </a>

        <a href="adminContact.jsp" class="card contacts">
            <i class="fas fa-envelope"></i>
            Messages
        </a>

        <a href="logout.jsp" class="card logout">
            <i class="fas fa-sign-out-alt"></i>
            Logout
        </a>
    </div>

    <div class="footer">
        © 2025 Flower Shop Admin Panel
    </div>

</div>

</body>
</html>
