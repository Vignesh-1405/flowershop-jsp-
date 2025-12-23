<%-- 
    Document   : cart
    Created on : 23-Dec-2025, 8:28:53 pm
    Author     : VIGNESH S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@ page import="java.sql.*" %>
<%
String email = (String)session.getAttribute("user");
if(email == null){
    response.sendRedirect("login.jsp");
    return;
}

String pidStr = request.getParameter("pid");
String priceStr = request.getParameter("price");
String name = request.getParameter("name");
String image = request.getParameter("image");

if(pidStr == null || priceStr == null){
    out.println("Invalid product");
    return;
}

int pid = Integer.parseInt(pidStr);
int price = Integer.parseInt(priceStr);

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
 "jdbc:mysql://localhost:3306/flowerproducts","root","Vicky345@"
);

PreparedStatement check = conn.prepareStatement(
 "SELECT quantity FROM cart WHERE user_email=? AND product_id=?");
check.setString(1,email);
check.setInt(2,pid);

ResultSet rs = check.executeQuery();

if(rs.next()){
    PreparedStatement update = conn.prepareStatement(
     "UPDATE cart SET quantity=quantity+1 WHERE user_email=? AND product_id=?");
    update.setString(1,email);
    update.setInt(2,pid);
    update.executeUpdate();
}else{
    PreparedStatement insert = conn.prepareStatement(
     "INSERT INTO cart(user_email,product_id,product_name,price,image,quantity) VALUES(?,?,?,?,?,1)");
    insert.setString(1,email);
    insert.setInt(2,pid);
    insert.setString(3,name);
    insert.setInt(4,price);
    insert.setString(5,image);
    insert.executeUpdate();
}

conn.close();
response.sendRedirect("cart.jsp");
%>
