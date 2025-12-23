<%-- 
    Document   : editproduct
    Created on : 23-Dec-2025, 4:32:41 pm
    Author     : VIGNESH S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
int pid = Integer.parseInt(request.getParameter("pid"));

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/flowerproducts","root","Vicky345@");

PreparedStatement ps =
    conn.prepareStatement("SELECT * FROM productlist WHERE product_id=?");
ps.setInt(1, pid);
ResultSet rs = ps.executeQuery();
rs.next();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>

<h2>Edit Product</h2>

<form action="updateproduct.jsp" method="post">
    <input type="hidden" name="pid" value="<%=pid%>">

    Name:
    <input type="text" name="name" value="<%=rs.getString("name")%>"><br><br>

    Price:
    <input type="number" name="price" value="<%=rs.getInt("price")%>"><br><br>

    Old Price:
    <input type="number" name="old_price" value="<%=rs.getInt("old_price")%>"><br><br>

    Category:
    <input type="text" name="category" value="<%=rs.getString("category")%>"><br><br>

    Stock:
    <input type="number" name="stock" value="<%=rs.getInt("stock")%>"><br><br>

    <button type="submit">Update Product</button>
</form>

</body>
</html>
