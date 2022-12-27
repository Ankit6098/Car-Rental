/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

/**
 *
 * @author Sanam
 */
@WebServlet(name = "CancelServlet", urlPatterns = {"/CancelServlet"})
public class CancelServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           response.setContentType("/html");
        int id = Integer.parseInt(request.getParameter("owner"));
        int carId = Integer.parseInt(request.getParameter("carId"));
        
        String cancelSql = "DELETE FROM bookings WHERE owner = " + Integer.toString(id);
      
       try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
             Statement statement  = connection.createStatement();
             int i  = statement.executeUpdate(cancelSql); 
             Connection userConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
             PreparedStatement stmt2 = userConnection.prepareStatement("UPDATE products SET flag = ? WHERE id = " + Integer.toString(carId));
             PreparedStatement stmt3 = userConnection.prepareStatement("UPDATE user SET bookings = ? WHERE id = " + Integer.toString(id));
                            stmt3.setInt(1, 0);
             
             stmt2.setString(1, "");
             stmt2.executeUpdate();
             stmt3.executeUpdate();
             response.sendRedirect("catalogue.jsp");
       } catch (Exception e) {
           
       }
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
