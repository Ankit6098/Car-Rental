/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Sanam
 */
public class CartDatabase {
    Connection con;

    public CartDatabase(Connection con) {
        this.con = con;
    }

    
    public boolean addToCart(CartModel cartModel) {
        boolean set = false;
        try {
            //Insert register data to database
            String query = "insert into cart(owner, carid, name, price, drive, seats, mileage) values(?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, cartModel.getOwner());
            pt.setInt(2, cartModel.getCarId());
            pt.setString(3, cartModel.getName());
            pt.setString(4, cartModel.getPrice());
            pt.setString(5, cartModel.getDrive());
            pt.setString(6, cartModel.getSeats());
            pt.setString(7, cartModel.getMileage());
            
        
       
            

            pt.executeUpdate();
            set = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return set;
    }
}
