<%@ page import="java.sql.*" %>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String message = request.getParameter("message");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
 "jdbc:mysql://localhost:3306/flowerproducts","root","Vicky345@"
);

PreparedStatement ps = conn.prepareStatement(
 "INSERT INTO contact_messages(name,email,phone,message) VALUES (?,?,?,?)"
);
ps.setString(1, name);
ps.setString(2, email);
ps.setString(3, phone);
ps.setString(4, message);
ps.executeUpdate();

conn.close();
%>

<script>
alert("Your message has been sent ? Admin will reply soon");
window.location.href="home.jsp";
</script>
