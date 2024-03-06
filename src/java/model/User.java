/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class User {

    private int userID;
    private String username;
    private String password;
    private String firstName;
    private String lastName;
    private boolean gender;
    private String email;
    private String phone;
    private String address;
    private int status;
    private int userContactID_Favorite;

    public User() {
    }

    public User(int userID, String username, String password, String firstName, String lastName, boolean gender, String email, String phone, String address, int status, int userContactID_Favorite) {
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.status = status;
        this.userContactID_Favorite = userContactID_Favorite;
    }

    public User(int userID, String username, String password, String firstName, String lastName, boolean gender, String email, String phone, String address, int status) {
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.status = status;
    }

    public User(String username, String password, String firstName, String lastName, boolean gender, String email, String phone, String address, int status) {
        this.username = username;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.status = status;
    }

    public User(String username, String firstName, String lastName, boolean gender, String email, String phone, String address) {
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.address = address;
    }

    public User(int userID, String username, String password, String firstName, String lastName, boolean gender, int status, int userContactID_Favorite) {
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
        this.status = status;
        this.userContactID_Favorite = userContactID_Favorite;
    }

    public User(int userID, String username, String firstName, String lastName, boolean gender) {
        this.userID = userID;
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.gender = gender;
    }

    public int getUserContactID_Favorite() {
        return userContactID_Favorite;
    }

    public void setUserContactID_Favorite(int userContactID_Favorite) {
        this.userContactID_Favorite = userContactID_Favorite;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
