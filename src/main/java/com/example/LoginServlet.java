package com.example;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT username FROM users WHERE email=? AND password=?"
            );

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                String username = rs.getString("username");

                HttpSession session = request.getSession();
                session.setAttribute("user", username);

                response.sendRedirect("dashboard.jsp");

            } else {
                response.getWriter().println("Invalid Email or Password!");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
