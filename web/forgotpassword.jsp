<%@page import="java.sql.*"%>
<%
String email = request.getParameter("email");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
 "jdbc:mysql://localhost:3306/newuserlogin","root","Vicky345@"
);

PreparedStatement ps = conn.prepareStatement(
 "SELECT * FROM userlist WHERE email=?"
);
ps.setString(1, email);
ResultSet rs = ps.executeQuery();

if(rs.next()){
    session.setAttribute("resetUser", email);
    response.sendRedirect("resetpassword.jsp");
}else{
    response.sendRedirect("forgotpassword.jsp?msg=Email not found");
}
conn.close();
%>
