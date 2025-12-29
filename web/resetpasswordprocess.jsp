<%@page import="java.sql.*"%>
<%
String resetUser = (String)session.getAttribute("resetUser");

String newpass = request.getParameter("newpass");
String confirmpass = request.getParameter("confirmpass");

if(!newpass.equals(confirmpass)){
    response.sendRedirect("resetpassword.jsp?msg=Password mismatch");
    return;
}

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
 "jdbc:mysql://localhost:3306/newuserlogin","root","Vicky345@"
);

PreparedStatement ps = conn.prepareStatement(
 "UPDATE userlist SET password=? WHERE email=?"
);
ps.setString(1, newpass);
ps.setString(2, resetUser);
ps.executeUpdate();

session.removeAttribute("resetUser");
response.sendRedirect("login.jsp?msg=Password reset success");
conn.close();
%>
