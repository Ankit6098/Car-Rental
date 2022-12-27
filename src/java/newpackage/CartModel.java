/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;



/**
 *
 * @author Sanam
 */
public class CartModel {
    private int owner;
    private int carId;
    private String name;
    private String price;
    private String drive;
    private String seats;
    private String mileage;

    public CartModel() {
    }

    public CartModel(int owner, int carId, String name, String price, String drive, String seats, String mileage) {
        this.owner = owner;
        this.carId = carId;
        this.name = name;
        this.price = price;
        this.drive = drive;
        this.seats = seats;
        this.mileage = mileage;
    }

    public int getOwner() {
        return owner;
    }

    public void setOwner(int owner) {
        this.owner = owner;
    }

    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
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
