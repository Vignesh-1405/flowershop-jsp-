package com.flowershop.servlet;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.Part;

@WebServlet("/UploadProfilePicServlet")
@MultipartConfig
public class UploadProfilePicServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Part part = request.getPart("photo");
        String fileName = part.getSubmittedFileName();

        String uploadPath = getServletContext().getRealPath("") + "profilepics";
        File dir = new File(uploadPath);
        if (!dir.exists()) dir.mkdir();

        part.write(uploadPath + File.separator + fileName);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/newuserlogin",
                "root",
                "Vicky345@"
            );

            PreparedStatement ps = conn.prepareStatement(
                "UPDATE userlist SET profile_pic=? WHERE email=?"
            );
            ps.setString(1, fileName);
            ps.setString(2, user);
            ps.executeUpdate();
            conn.close();

            // ⭐⭐ THIS IS THE KEY LINE ⭐⭐
            session.setAttribute("profilePic", fileName);

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("profile.jsp?msg=Profile photo updated");
    }
}
