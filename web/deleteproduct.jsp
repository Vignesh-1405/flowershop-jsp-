<%@page import="java.sql.*"%>
<%@page import="java.io.File"%>
<%
int pid = Integer.parseInt(request.getParameter("pid"));

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/flowerproducts",
    "root",
    "Vicky345@"
);

/* GET IMAGE NAME */
PreparedStatement ps1 =
    conn.prepareStatement("SELECT image FROM productlist WHERE product_id=?");
ps1.setInt(1, pid);
ResultSet rs = ps1.executeQuery();

String img = null;
if(rs.next()){
    img = rs.getString("image");
}

/* DELETE IMAGE */
if(img != null && !img.isEmpty()){
    String imgPath = application.getRealPath("/") +
                     "images" + File.separator + img;
    File f = new File(imgPath);
    if(f.exists()){
        f.delete();
    }
}

/* DELETE DB */
PreparedStatement ps2 =
    conn.prepareStatement("DELETE FROM productlist WHERE product_id=?");
ps2.setInt(1, pid);
ps2.executeUpdate();

conn.close();

response.sendRedirect("viewproducts.jsp");
%>
