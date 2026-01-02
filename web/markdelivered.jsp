<%@ page import="java.sql.*" %>
<%
String admin = (String) session.getAttribute("admin");
if(admin == null){
    response.sendRedirect("login.jsp");
    return;
}

int oid = Integer.parseInt(request.getParameter("oid"));

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/flowerproducts","root","Vicky345@"
);

PreparedStatement ps = conn.prepareStatement(
    "UPDATE orders SET status='delivered' WHERE order_id=?"
);
ps.setInt(1, oid);
ps.executeUpdate();

conn.close();

response.sendRedirect("adminorders.jsp");
%>
