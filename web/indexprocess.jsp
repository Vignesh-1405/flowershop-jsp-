<%-- 
    Document   : indexprocess
    Created on : 22-Dec-2025, 10:30:27 am
    Author     : VIGNESH S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>

        <%
       try
         {
             
        String uname=request.getParameter("Username");
        String upass=request.getParameter("password");
        String Email=request.getParameter("Email");
        String role = "user";
           
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/newuserlogin","root","Vicky345@");
        //insert into userlist (username,email,password) values ('admin','admin123@gmail.com','Admin123@');

       String query = "INSERT INTO userlist (username,email,password,role) VALUES (?,?,?,?)";
       PreparedStatement ps = conn.prepareStatement(query);

        ps.setString(1, uname);
        ps.setString(2, Email);
        ps.setString(3, upass);
        ps.setString(4, role);

        int rows = ps.executeUpdate(); 
       
        
        
        conn.close();
        
        if(rows >0)
        {
            response.sendRedirect("login.jsp");
        }
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
   
