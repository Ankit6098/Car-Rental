/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;

public class UserDatabase {

    Connection con;

    public UserDatabase(Connection con) {
        this.con = con;
    }

    //for register user 
    public boolean saveUser(User user) throws FileNotFoundException {
        boolean set = false;
        try {
            //Insert register data to database
            String query = "insert into user(name, email, password, number, image, bookings) values(?, ?, ?, ?, ?, ?)";
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
Blob b1 = conn.createBlob();
b1.setBytes(1, new byte[10]);

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setString(1, user.getName());
            pt.setString(2, user.getEmail());
            pt.setString(3, user.getPassword());
            pt.setString(4, user.getNumber());
            pt.setBlob(5, b1);
            pt.setInt(6, 0);

            

            pt.executeUpdate();
            set = true;
        } catch (SQLException e) {
            
            e.printStackTrace();
        }
        return set; 
    }

    //log user
    public User logUser(String email, String password) {
        User user = null;

        try {
            String query = "select * from user where email=? and password=?";
            PreparedStatement ps = this.con.prepareStatement(query); 
            ps.setString(1,email);
            ps.setString(2, password);
            
            ResultSet rs  = ps.executeQuery();
            
            if(rs.next()){
                 user = new User();
                 user.setId(rs.getInt("id"));
                 user.setName(rs.getString("name"));
                 user.setEmail(rs.getString("email"));
                 user.setPassword(rs.getString("password"));
                 user.setNumber(rs.getString("number"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
