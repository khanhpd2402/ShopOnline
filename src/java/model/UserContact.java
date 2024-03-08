/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author khanh
 */
public class UserContact {

    private int userContactID;
    private int userID;
    private String email;
    private String phone;
    private String address;

    public UserContact() {
    }

    public UserContact(int userContactID, int userID, String email, String phone, String address) {
        this.userContactID = userContactID;
        this.userID = userID;
        this.email = email;
        this.phone = phone;
        this.address = address;
    }

    public UserContact(String email, String phone) {
        this.email = email;
        this.phone = phone;
    }

    public UserContact(int userContactID, String email, String phone, String address) {
        this.userContactID = userContactID;
        this.email = email;
        this.phone = phone;
        this.address = address;
    }

    public int getUserContactID() {
        return userContactID;
    }

    public void setUserContactID(int userContactID) {
        this.userContactID = userContactID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}
