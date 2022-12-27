/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;


public class User {
    int id;
    String name;
    String email;
    String password;
    String number;

    public User() {
    }

    public User(int id, String name, String email, String password, String number) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.number = number;
    }

    public User(String name, String email, String password, String number) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.number = number;


    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
     public String getNumber() {
        return number;
    }
     
    public void setNumber(String number) {
        this.number = number;   
    }
    
   
    
    
    
}
