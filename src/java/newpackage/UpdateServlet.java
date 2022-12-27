/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Sanam
 */
@MultipartConfig

@WebServlet(name = "UpdateServlet", urlPatterns = {"/UpdateServlet"})
public class UpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("/html");
        String userId = request.getParameter("owner");
        String oldPassword = request.getParameter("oldPassword");
        String pass1 = request.getParameter("password1");
        String pass2 = request.getParameter("password2");
        InputStream image;
        Part filePart = request.getPart("image");
        image = filePart.getInputStream();
        String userSql = "SELECT * FROM user WHERE id = " + userId;
        String password = "";
        RequestDispatcher rd = request.getRequestDispatcher("Settings.jsp");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection userConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
            Statement userStatement = userConnection.createStatement();
            ResultSet userResultSet = userStatement.executeQuery(userSql);

            if (userResultSet.next()) {
                password = userResultSet.getString("password");
            }

        } catch (Exception e) {

        }

    

        if (password.equals(oldPassword)) {
            if (pass1.equals(pass2)) {
                    if (image.available() > 1000) {

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection userConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
                PreparedStatement stmt1 = userConnection.prepareStatement("UPDATE user SET image = ? WHERE id = " + userId);
                stmt1.setBlob(1, image);
                stmt1.executeUpdate();

            } catch (Exception e) {

            }

        }
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection userConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
                    PreparedStatement stmt2 = userConnection.prepareStatement("UPDATE user SET password = ? WHERE id = " + userId);
                    stmt2.setString(1, pass1);
                    stmt2.executeUpdate();
                    
                request.setAttribute("success", "Password Successfully Updated.");
                rd.forward(request, response);
                } catch (Exception e) {
                }
            }
        } else {
                request.setAttribute("password", "Incorrect Password!");
                rd.forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
