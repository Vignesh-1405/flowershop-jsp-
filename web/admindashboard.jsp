<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Flower Shop | Admin</title>

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

/* SIDEBAR – PINK */
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
    margin-bottom:30px;
}

.header h2{
    color:#e84393;
}

/* STATS */
.stats{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(200px,1fr));
    gap:20px;
    margin-bottom:35px;
}

.stat{
    background:#ffffff;
    padding:25px;
    border-radius:20px;
    box-shadow:0 12px 30px rgba(0,0,0,0.08);
    text-align:center;
    transition:0.3s;
}

.stat:hover{
    transform:translateY(-6px);
}

.stat i{
    font-size:30px;
    color:#e84393;
    margin-bottom:10px;
}

.stat h3{
    font-size:26px;
    color:#222;
}

/* ACTION CARDS */
.cards{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
    gap:20px;
}

.card{
    background:#ffffff;
    padding:30px;
    border-radius:22px;
    text-align:center;
    text-decoration:none;
    color:#333;
    box-shadow:0 12px 30px rgba(0,0,0,0.08);
    transition:0.35s;
}

.card:hover{
    background:linear-gradient(135deg,#fde2ea,#fff);
    transform:translateY(-6px);
}

.card i{
    font-size:30px;
    color:#e84393;
    margin-bottom:12px;
}
</style>
</head>

<body>

<div class="container">

    <!-- SIDEBAR -->
    <div class="sidebar">
        <div class="logo">🌸 Flower Admin</div>

        <div class="menu">
            <a href="#" class="active"><i class="fas fa-home"></i> Dashboard</a>
            <a href="admin_users.jsp"><i class="fas fa-users"></i> Users</a>
            <a href="addproduct.jsp"><i class="fas fa-plus-circle"></i> Add Product</a>
            <a href="viewproducts.jsp"><i class="fas fa-list"></i> Products</a>
            <a href="adminorders.jsp"><i class="fas fa-box"></i> Orders</a>
            <a href="adminreviews.jsp"><i class="fas fa-star"></i> Reviews</a>
            <a href="adminContact.jsp"><i class="fas fa-envelope"></i> Messages</a>
            <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>

    <!-- MAIN CONTENT -->
    <div class="main">

        <div class="header">
            <h2>Dashboard</h2>
            <div><i class="fas fa-user-shield"></i> Admin</div>
        </div>

        <!-- STATS -->
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

        <!-- ACTIONS -->
        <div class="cards">
            <a href="addproduct.jsp" class="card"><i class="fas fa-plus-circle"></i><br>Add Product</a>
            <a href="viewproducts.jsp" class="card"><i class="fas fa-list"></i><br>View Products</a>
            <a href="adminorders.jsp" class="card"><i class="fas fa-box"></i><br>Orders</a>
            <a href="admin_users.jsp" class="card"><i class="fas fa-users"></i><br>Users</a>
        </div>

    </div>

</div>

</body>
</html>
