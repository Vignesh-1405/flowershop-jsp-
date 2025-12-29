<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
String user = (String)session.getAttribute("user");
if(user == null){
    response.sendRedirect("login.jsp");
    return;
}

String oldpass = request.getParameter("oldpass");
String newpass = request.getParameter("newpass");
String confirmpass = request.getParameter("confirmpass");

if(!newpass.equals(confirmpass)){
    response.sendRedirect("changepassword.jsp?msg=Passwords do not match");
    return;
}

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
 "jdbc:mysql://localhost:3306/newuserlogin","root","Vicky345@"
);

/* CHECK OLD PASSWORD */
PreparedStatement ps = conn.prepareStatement(
 "SELECT password FROM userlist WHERE email=?");
ps.setString(1,user);

ResultSet rs = ps.executeQuery();

if(rs.next()){
    String dbPass = rs.getString("password");

    if(!dbPass.equals(oldpass)){
        response.sendRedirect("changepassword.jsp?msg=Old password incorrect");
    }else{
        PreparedStatement update = conn.prepareStatement(
            "UPDATE userlist SET password=? WHERE email=?");
        update.setString(1,newpass);
        update.setString(2,user);
        update.executeUpdate();

        response.sendRedirect("changepassword.jsp?msg=Password updated successfully");
    }
}

conn.close();
%>
