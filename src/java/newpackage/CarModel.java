/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;
import java.io.InputStream;

/**
 *
 * @author Sanam
 */
public class CarModel {
    
    private String name;
    private String price;
    private InputStream image;
    private String drive;
    private String seats;
    private String mileage;

    public CarModel() {
    }

    public CarModel(String name, String price, InputStream image, String drive, String seats, String mileage) {
        this.name = name;
        this.price = price;
        this.image = image;
        this.drive = drive;
        this.seats = seats;
        this.mileage = mileage;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public InputStream getImage() {
        return image;
    }

    public void setImage(InputStream image) {
        this.image = image;
    }

    public String getDrive() {
        return drive;
    }

    public void setDrive(String drive) {
        this.drive = drive;
    }

    public String getSeats() {
        return seats;
    }

    public void setSeats(String seats) {
        this.seats = seats;
    }

    public String getMileage() {
        return mileage;
    }

    public void setMileage(String mileage) {
        this.mileage = mileage;
    }

  
    
    
}
