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
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.InputStream;

/**
 *
 * @author Sanam
 */
@MultipartConfig
@WebServlet(name = "ProductServlet", urlPatterns = {"/ProductServlet"})
public class ProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("/html");
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        InputStream image;
        String drive = request.getParameter("drive");
        String seats = request.getParameter("seats");
        String mileage = request.getParameter("mileage");

        Part filePart = request.getPart("image");
        if (filePart != null) {

            // Obtains input stream of the upload file
            image
                    = filePart.getInputStream();

            CarModel carModel = new CarModel(name, price, image, drive, seats, mileage);

            ProductDatabase add = new ProductDatabase(ConnectionPro.getConnection());
            if (add.saveProduct(carModel)) {

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
