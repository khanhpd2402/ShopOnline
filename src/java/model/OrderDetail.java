/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class OrderDetail {

    private int orderID;
    private int productID;
    private int quantity;
    private int quantityInStock;
    private double price;
    private double discount;
    private String productName, image;

    public OrderDetail() {
    }

    public OrderDetail(int orderID, int productID, int quantityOrder, double price, double discount, String productName, String image, int quantityInStock) {
        this.orderID = orderID;
        this.productID = productID;
        this.quantity = quantityOrder;
        this.price = price;
        this.discount = discount;
        this.productName = productName;
        this.image = image;
        this.quantityInStock = quantityInStock;
    }

    public OrderDetail(int orderID, int productID, int quantity, double price, double discount, String productName, String image) {
        this.orderID = orderID;
        this.productID = productID;
        this.quantity = quantity;
        this.price = price;
        this.discount = discount;
        this.productName = productName;
        this.image = image;
    }

    public int getQuantityInStock() {
        return quantityInStock;
    }

    public void setQuantityInStock(int quantityInStock) {
        this.quantityInStock = quantityInStock;
    }

    public String getProductName() {
        return productName;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

}
