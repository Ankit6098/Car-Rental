/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.sql.*;

public class ProductDatabase {

    Connection con;

    public ProductDatabase(Connection con) {
        this.con = con;
    }

    
    public boolean saveProduct(CarModel carModel) {
        boolean set = false;
        try {
            //Insert register data to database
            String query = "insert into products(name, price, image, drive, seats, mileage, flag) values(?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setString(1, carModel.getName());
            pt.setString(2, carModel.getPrice());
            pt.setBlob(3, carModel.getImage());
            pt.setString(4, carModel.getDrive());
            pt.setString(5, carModel.getSeats());
            pt.setString(6, carModel.getMileage());
            pt.setString(7, "false");
       
            

            pt.executeUpdate();
            set = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return set;
    }

   
}
