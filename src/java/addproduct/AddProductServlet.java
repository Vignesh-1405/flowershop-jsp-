package addproduct;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/AddProductServlet")
@MultipartConfig
public class AddProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String name = request.getParameter("name");
            String price = request.getParameter("price");
            String oldPrice = request.getParameter("old_price");
            String category = request.getParameter("category");
            String stock = request.getParameter("stock");

            Part part = request.getPart("image");
            String fileName = part.getSubmittedFileName();

            String uploadPath = getServletContext().getRealPath("") +
                                "images" + File.separator + fileName;
            part.write(uploadPath);

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/flowerproducts",
                "root",
                "Vicky345@"
            );

            String sql = "INSERT INTO productlist " +
                         "(name,price,old_price,image,category,stock) " +
                         "VALUES (?,?,?,?,?,?)";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, Integer.parseInt(price));
            ps.setInt(3, Integer.parseInt(oldPrice));
            ps.setString(4, fileName);
            ps.setString(5, category);
            ps.setInt(6, Integer.parseInt(stock));

            ps.executeUpdate();
            conn.close();

            response.sendRedirect("admindashboard.jsp");

        } catch (ServletException | IOException | ClassNotFoundException | NumberFormatException | SQLException e) {
            response.getWriter().println(e);
        }
    }
}
