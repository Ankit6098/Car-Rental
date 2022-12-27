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
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sanam
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/CartServlet"})
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("/html");
        int owner = Integer.parseInt(request.getParameter("owner"));
        int carId = Integer.parseInt(request.getParameter("carId"));
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String drive = request.getParameter("drive");
        String seats = request.getParameter("seats");
        String mileage = request.getParameter("mileage");
        
        
        
        if (name != null) {

            CartModel cartModel = new CartModel(owner, carId, name, price, drive, seats, mileage);

            CartDatabase add = new CartDatabase(ConnectionPro.getConnection());
            if (add.addToCart(cartModel)) {
                try {
                    Thread.sleep(2000);
                } catch (InterruptedException ex) {
                    Logger.getLogger(CartServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                response.sendRedirect("cart.jsp");
            } else {
//                String errorMessage = "User Available";
//                HttpSession regSession = request.getSession();
//                regSession.setAttribute("RegError", errorMessage);
                response.sendRedirect("welcome.jsp");
            }
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
