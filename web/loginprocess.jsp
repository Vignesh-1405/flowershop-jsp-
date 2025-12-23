<%-- 
    Document   : loginprocess
    Created on : 22-Dec-2025, 6:21:01 pm
    Author     : VIGNESH S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
         try
         {
          String Email=request.getParameter("Email");
          String password=request.getParameter("password");
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/newuserlogin","root","Vicky345@");
          //select * from userlist where email='@@@' and password='';
          String sql="select * from userlist where email= ? and password=?;";
          PreparedStatement ps=conn.prepareStatement(sql);
          ps.setString(1,Email);
          ps.setString(2, password);
          
          ResultSet rs=ps.executeQuery();
         
          if(rs.next())
          {   
              String role = rs.getString("role");
              if("admin".equals(role))
              {
              session.setAttribute("admin",Email);
              response.sendRedirect("admindashboard.jsp");
              
              }
          else
              {
              session.setAttribute("user",Email);
              response.sendRedirect("home.jsp");
              }
          }
          else
          {
             out.println("<h1>Invalid User...!!!</h1><br><a href='login.jsp'>Login Page</a>"); 
          }
           conn.close();
         }
         catch(ClassNotFoundException ex)
         {
             out.println(ex.getMessage());
         }
         catch(SQLException ex)
         {
             out.println(ex.getMessage());
         }
        %>
    </body>
</html>
