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
public class BookingModel {
    private int owner;
    private int orderId;
    private String name;
    private String number;
    private String email;
    private String carName;
    private int carId;
    private String area;
    private String country;
    private int zipCode;
    private String state;
    private String city;
    private String date;
    private String paymentMethod;
    private double bill;

    public BookingModel() {
    }

    public BookingModel(int owner, int orderId, String name, String number, String email, String carName, int carId, String area, String country, int zipCode, String state, String city, String date, String paymentMethod, double bill) {
        this.owner = owner;
        this.orderId = orderId;
        this.name = name;
        this.number = number;
        this.email = email;
        this.carName = carName;
        this.carId = carId;
        this.area = area;
        this.country = country;
        this.zipCode = zipCode;
        this.state = state;
        this.city = city;
        this.date = date;
        this.paymentMethod = paymentMethod;
        this.bill = bill;
    }

    public int getOwner() {
        return owner;
    }

    public void setOwner(int owner) {
        this.owner = owner;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCarName() {
        return carName;
    }

    public void setCarName(String carName) {
        this.carName = carName;
    }

    public int getCarId() {
        return carId;
    }

    public void setCarId(int carId) {
        this.carId = carId;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public int getZipCode() {
        return zipCode;
    }

    public void setZipCode(int zipCode) {
        this.zipCode = zipCode;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public double getBill() {
        return bill;
    }

    public void setBill(double bill) {
        this.bill = bill;
    }

   
    
}
