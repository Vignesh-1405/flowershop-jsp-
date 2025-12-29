<%@page import="java.sql.*"%>
<%
int id = Integer.parseInt(request.getParameter("id"));
Connection conn = DriverManager.getConnection(
 "jdbc:mysql://localhost:3306/flowerproducts","root","Vicky345@"
);
PreparedStatement ps = conn.prepareStatement(
 "UPDATE reviews SET status='approved' WHERE review_id=?");
ps.setInt(1,id);
ps.executeUpdate();
conn.close();
response.sendRedirect("adminreviews.jsp");
%>
