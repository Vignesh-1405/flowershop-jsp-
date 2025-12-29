<%@page import="java.sql.*"%>
<%
/* GET LOGGED-IN USER EMAIL FROM SESSION */
String email = (String) session.getAttribute("user");
if(email == null){
    response.sendRedirect("login.jsp");
    return;
}

/* GET PRODUCT DETAILS FROM REQUEST */
int pid = Integer.parseInt(request.getParameter("pid"));
String name = request.getParameter("name");
int price = Integer.parseInt(request.getParameter("price"));
String image = request.getParameter("image");   // ? NEW

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/flowerproducts",
    "root","Vicky345@"
);

/* CHECK DUPLICATE WISHLIST ITEM */
PreparedStatement check = conn.prepareStatement(
    "SELECT * FROM wishlist WHERE user_email=? AND product_id=?");
check.setString(1, email);
check.setInt(2, pid);

ResultSet rs = check.executeQuery();

/* INSERT IF NOT EXISTS */
if(!rs.next()){
    PreparedStatement ps = conn.prepareStatement(
        "INSERT INTO wishlist(user_email, product_id, product_name, price, image) VALUES (?,?,?,?,?)");
    ps.setString(1, email);
    ps.setInt(2, pid);
    ps.setString(3, name);
    ps.setInt(4, price);
    ps.setString(5, image);   // ? IMAGE STORED
    ps.executeUpdate();
}

conn.close();

/* BACK TO HOME */
response.sendRedirect("home.jsp#products");
%>
