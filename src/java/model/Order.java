/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author admin
 */
public class Order {

    private int orderID;
    private int userID;
    private Date orderDate;
    private String address;
    private String phone;
    private double totalMoney;
    private String orderNote;
    private int orderStatus;
    private double amountCoupon;

    public Order() {
    }

    public Order(int orderID, int userID, Date orderDate, String address, String phone, double totalMoney, String orderNote, int orderStatus, double amountCoupon) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderDate = orderDate;
        this.address = address;
        this.phone = phone;
        this.totalMoney = totalMoney;
        this.orderNote = orderNote;
        this.orderStatus = orderStatus;
        this.amountCoupon = amountCoupon;
    }

    public double getAmountCoupon() {
        return amountCoupon;
    }

    public void setAmountCoupon(double amountCoupon) {
        this.amountCoupon = amountCoupon;
    }

   

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public String getOrderNote() {
        return orderNote;
    }

    public void setOrderNote(String orderNote) {
        this.orderNote = orderNote;
    }

    public int getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }

   

}
