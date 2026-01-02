<%@ page import="java.sql.*" %>
<%
String user = (String) session.getAttribute("user");
if(user == null){
    response.sendRedirect("login.jsp");
    return;
}

int oid = Integer.parseInt(request.getParameter("oid"));

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/flowerproducts","root","Vicky345@"
);

PreparedStatement ps = conn.prepareStatement(
    "UPDATE orders SET status='cancelled' WHERE order_id=? AND user_email=? AND status='placed'"
);
ps.setInt(1, oid);
ps.setString(2, user);

ps.executeUpdate();
conn.close();

response.sendRedirect("myorders.jsp");
%>
