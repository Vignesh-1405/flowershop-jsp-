<%-- 
    Document   : viewproducts
    Created on : 22-Dec-2025, 8:36:48 pm
    Author     : VIGNESH S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%@page import="java.sql.*"%>

<%
if(session.getAttribute("admin")==null){
    response.sendRedirect("login.jsp");
}
%>

<h2>Products</h2>
<a href="admindashboard.jsp" style="text-decoration:none;">
    <button style="
        padding:8px 15px;
        background-color:#4CAF50;
        color:white;
        border:none;
        border-radius:5px;
        cursor:pointer;">
        ⬅ Back to Dashboard
    </button>
</a>


<table border="1" cellpadding="10">
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
    <img src="<%=request.getContextPath()%>/images/<%=rs.getString("image")%>" width="80">
  </td>

  <td><%=rs.getString("name")%></td>

  <td>₹ <%=rs.getInt("price")%></td>

  <td>
    <del>₹ <%=rs.getInt("old_price")%></del>
  </td>

  <td><%=rs.getString("category")%></td>

  <td><%=rs.getInt("stock")%></td>

  <td>
    <a href="editproduct.jsp?pid=<%=rs.getInt("product_id")%>">✏️ Edit</a>
    |
    <a href="deleteproduct.jsp?pid=<%=rs.getInt("product_id")%>&img=<%=rs.getString("image")%>"
       onclick="return confirm('Delete this product?')">
       ❌ Delete
    </a>
  </td>
</tr>


<% }
conn.close();
%>
</table>

</html>
