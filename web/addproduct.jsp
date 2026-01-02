<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Product | Admin</title>

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
    display:flex;
    justify-content:center;
    align-items:center;
}

/* FORM CARD */
.form-box{
    width:420px;
    background:#ffffff;
    padding:30px;
    border-radius:22px;
    box-shadow:0 15px 35px rgba(0,0,0,0.1);
}

.form-box h2{
    text-align:center;
    margin-bottom:25px;
    color:#e84393;
}

/* INPUTS */
.form-box input{
    width:100%;
    padding:12px 14px;
    margin-bottom:12px;
    border-radius:10px;
    border:1px solid #ddd;
    font-size:14px;
}

.form-box input:focus{
    outline:none;
    border-color:#e84393;
}

/* FILE INPUT */
.form-box input[type="file"]{
    padding:10px;
}

/* BUTTON */
.form-box button{
    width:100%;
    margin-top:10px;
    padding:14px;
    font-size:16px;
    font-weight:600;
    border:none;
    border-radius:30px;
    background:#e84393;
    color:white;
    cursor:pointer;
    transition:0.3s;
}

.form-box button:hover{
    background:#d63384;
    transform:translateY(-2px);
}

/* BACK LINK */
.back-link{
    display:block;
    text-align:center;
    margin-top:15px;
    color:#555;
    text-decoration:none;
    font-size:14px;
}

.back-link:hover{
    color:#e84393;
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
            <a href="#" class="active"><i class="fas fa-plus-circle"></i> Add Product</a>
            <a href="viewproducts.jsp"><i class="fas fa-list"></i> Products</a>
            <a href="adminorders.jsp"><i class="fas fa-box"></i> Orders</a>
            <a href="adminreviews.jsp"><i class="fas fa-star"></i> Reviews</a>
            <a href="adminContact.jsp"><i class="fas fa-envelope"></i> Messages</a>
            <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>

    <!-- MAIN -->
    <div class="main">

        <div class="form-box">
            <h2>🌸 Add New Flower</h2>

            <form action="addproductservleturl"
                  method="post"
                  enctype="multipart/form-data">

                <input type="text" name="name"
                       placeholder="Product Name" required>

                <input type="number" name="price"
                       placeholder="Price (₹)" required>

                <input type="number" name="old_price"
                       placeholder="Old Price (₹)" required>

                <input type="text" name="category"
                       placeholder="Category (Rose, Lily…)" required>

                <input type="number" name="stock"
                       placeholder="Available Stock" required>

                <input type="file" name="image" required>

                <button type="submit">➕ Add Product</button>
            </form>

            <a href="admindashboard.jsp" class="back-link">
                ← Back to Dashboard
            </a>
        </div>

    </div>

</div>

</body>
</html>
