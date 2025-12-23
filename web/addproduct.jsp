<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
</head>
<body>

<h2>Add Product</h2>

<form action="addproductservleturl"
      method="post"
      enctype="multipart/form-data">

    <input type="text" name="name" placeholder="Product Name" required><br><br>

    <input type="number" name="price" placeholder="Price" required><br><br>

    <input type="number" name="old_price" placeholder="Old Price" required><br><br>

    <input type="text" name="category" placeholder="Category" required><br><br>

    <input type="number" name="stock" placeholder="Stock" required><br><br>

    <input type="file" name="image" required><br><br>

    <button type="submit">Add Product</button>
</form>

</body>
</html>
