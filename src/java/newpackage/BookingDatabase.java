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
public class BookingDatabase {
    Connection con;

    public BookingDatabase(Connection con) {
        this.con = con;
    }

    
    public boolean saveProduct(BookingModel bookingModel) {
        boolean set = false;
        try {
            //Insert register data to database
            String query = "insert into bookings(owner, orderid, name, number, email, carname, carid, area, country, zipcode, state, city, date, paymentmethod, bill) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setInt(1, bookingModel.getOwner());
            pt.setInt(2, bookingModel.getOrderId());
            pt.setString(3, bookingModel.getName());
            pt.setString(4, bookingModel.getNumber());
            pt.setString(5, bookingModel.getEmail());
            pt.setString(6, bookingModel.getCarName());
            pt.setInt(7, bookingModel.getCarId());
            pt.setString(8, bookingModel.getArea());
            pt.setString(9, bookingModel.getCountry());
            pt.setInt(10, bookingModel.getZipCode());
            pt.setString(11, bookingModel.getState());
            pt.setString(12, bookingModel.getCity());
            pt.setString(13, bookingModel.getDate());
            pt.setString(14, bookingModel.getPaymentMethod());
            pt.setDouble(15, bookingModel.getBill());
       
            

            pt.executeUpdate();
            set = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return set;
    }
}
