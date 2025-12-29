<%@page import="java.sql.*"%>
<%
String email = (String)session.getAttribute("user");
if(email == null){
    response.sendRedirect("login.jsp");
    return;
}

int rating = Integer.parseInt(request.getParameter("rating"));
String comment = request.getParameter("comment");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
 "jdbc:mysql://localhost:3306/flowerproducts","root","Vicky345@"
);

PreparedStatement ps = conn.prepareStatement(
 "INSERT INTO reviews(user_email,rating,comment) VALUES(?,?,?)");
ps.setString(1,email);
ps.setInt(2,rating);
ps.setString(3,comment);
ps.executeUpdate();

conn.close();
response.sendRedirect("home.jsp#review");
%>
