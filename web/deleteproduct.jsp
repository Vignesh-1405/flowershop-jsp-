<%-- 
    Document   : deleteproduct
    Created on : 22-Dec-2025, 11:13:02 pm
    Author     : VIGNESH S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%@page import="java.sql.*"%>
<%@page import="java.io.File"%>

<%
int pid = Integer.parseInt(request.getParameter("pid"));
String img = request.getParameter("img");

/* DELETE IMAGE */
String imgPath = application.getRealPath("") +
                 "images" + File.separator + img;
File f = new File(imgPath);
if(f.exists()){
    f.delete();
}

/* DELETE DB RECORD */
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/flowerproducts",
    "root",
    "Vicky345@"
);

PreparedStatement ps =
    conn.prepareStatement("DELETE FROM productlist WHERE product_id=?");
ps.setInt(1, pid);
ps.executeUpdate();

conn.close();

/* BACK TO VIEW */
response.sendRedirect("viewproducts.jsp");
%>


   