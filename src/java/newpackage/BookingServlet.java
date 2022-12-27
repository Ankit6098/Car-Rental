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
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sanam
 */
@WebServlet(name = "BookingServlet", urlPatterns = {"/BookingServlet"})
public class BookingServlet extends HttpServlet {

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("/html");
        int owner = Integer.parseInt(request.getParameter("owner"));
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String name = request.getParameter("name");
        String number = request.getParameter("number");
        String email = request.getParameter("email");
        String carname = request.getParameter("carName");
        int carid = Integer.parseInt(request.getParameter("carId"));
        String area = request.getParameter("area");
        String country = request.getParameter("country");
        int zipCode = Integer.parseInt(request.getParameter("zipCode"));
        String state = request.getParameter("state");
        String city = request.getParameter("city");
        String date = request.getParameter("date");  
        String paymentMethod = request.getParameter("radio");
        double bill = Double.parseDouble(request.getParameter("bill"));
        
        String productSql = "SELECT * FROM products WHERE id = " + Integer.toString(carid);

        
        
         BookingModel bookingModel = new BookingModel(owner, orderId, name, number, email, carname, carid, area, country, zipCode, state, city, date, paymentMethod, bill);

            BookingDatabase add = new BookingDatabase(ConnectionPro.getConnection());
            if (add.saveProduct(bookingModel)) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection userConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
                            PreparedStatement stmt2 = userConnection.prepareStatement("UPDATE products SET flag = ? WHERE id = " + Integer.toString(carid));
                            PreparedStatement stmt3 = userConnection.prepareStatement("UPDATE user SET bookings = ? WHERE id = " + owner);
                            stmt2.setString(1, "rented");
                            stmt3.setInt(1, 1);
                            stmt2.executeUpdate();
                            stmt3.executeUpdate();
            } catch (Exception ex) {
                
            }
                            
try {
                    Thread.sleep(4000);
                } catch (InterruptedException ex) {
                    Logger.getLogger(CartServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

RequestDispatcher rd=request.getRequestDispatcher("DeleteServlet"); 
rd.forward(request, response);

                
            } else {
//                String errorMessage = "User Available";
//                HttpSession regSession = request.getSession();
//                regSession.setAttribute("RegError", errorMessage);
                response.sendRedirect("welcome.jsp");
            }
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
