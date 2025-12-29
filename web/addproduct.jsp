<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>

    <style>
        body{
            margin:0;
            height:100vh;
            font-family:'Segoe UI', Arial, sans-serif;

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

        .form-box{
            width:420px;
            padding:30px;
            background: rgba(255,255,255,0.15);
            backdrop-filter: blur(12px);
            border-radius:15px;
            box-shadow:0 8px 25px rgba(0,0,0,0.3);
            color:#fff;
        }

        .form-box h2{
            text-align:center;
            margin-bottom:25px;
            font-size:26px;
        }

        .form-box input{
            width:100%;
            padding:12px 10px;
            margin:8px 0;
            border:none;
            border-radius:8px;
            font-size:14px;
        }
/*        .form-box input{
    width:100%;
    padding:12px 10px;
    margin-left:-6px;
    border:none;
    border-radius:8px;
    font-size:14px;
}*/

/*.form-box input[type="file"]{
    padding:10px;
    margin-left:-6px;
}*/


        .form-box input[type="file"]{
            background:#fff;
            color:#333;
        }

        .form-box button{
            width:100%;
            margin-top:15px;
            padding:14px;
            font-size:16px;
            font-weight:bold;
            border:none;
            border-radius:30px;
            background:#e84393;
            color:white;
            cursor:pointer;
            transition:0.3s;
        }

        .form-box button:hover{
            background:#d63384;
            transform:scale(1.03);
        }

        .back-link{
            display:block;
            text-align:center;
            margin-top:15px;
            color:#fff;
            text-decoration:none;
            opacity:0.9;
        }

        .back-link:hover{
            text-decoration:underline;
        }
    </style>
</head>

<body>

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

</body>
</html>
