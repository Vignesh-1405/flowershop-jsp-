package com.flowershop.servlet;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/UploadProfilePicServlet")
@MultipartConfig
public class UploadProfilePicServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ EXISTING SESSION MATTUM USE PANNU
        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String user = (String) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Part part = request.getPart("photo");
        if (part == null || part.getSize() == 0) {
            response.sendRedirect("userprofile.jsp?msg=No file selected");
            return;
        }

        // ✅ SIMPLE & JAVA-8 SAFE
        String fileName = part.getSubmittedFileName();

        // ✅ UPLOAD FOLDER
        String uploadPath = getServletContext().getRealPath("/") + "profilepics";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // ✅ SAVE FILE
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

            // OPTIONAL: UI refresh
            session.setAttribute("profilePic", fileName);

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("userprofile.jsp?msg=Profile photo updated");
    }
}
