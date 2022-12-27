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
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Sanam
 */
@WebServlet(name = "DeleteServlet", urlPatterns = {"/DeleteServlet"})
public class DeleteServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("/html");
        int id = Integer.parseInt(request.getParameter("owner"));
        
//        String cartSql = "SELECT * FROM cart WHERE owner = " + Integer.toString(user.getId());
        String deleteSql = "DELETE FROM cart WHERE owner = " + Integer.toString(id);
      
       try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
             Statement statement  = connection.createStatement();
             int i  = statement.executeUpdate(deleteSql); 
             
             response.sendRedirect("cart.jsp");
       } catch (Exception e) {
           
       }

    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
