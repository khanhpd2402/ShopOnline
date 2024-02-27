/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

public class Product {

    private int productID;
    private String productName;
    private String description;
    private double originPrice;
    private double salePrice;
    private double discount;
    private String productImg;
    private int quantity;
    private int productStatus;
    private int brandID;
    private int categoryID;
    private String cpu;
    private String ram;
    private String capacity;
    private String graphicCard;
    private String display;

    public Product() {
    }

    public Product(String productName, String description, double originPrice, double salePrice, double discount, String productImg, int quantity, int productStatus, int brandID, int categoryID, String cpu, String ram, String capacity, String graphicCard, String display) {
        this.productName = productName;
        this.description = description;
        this.originPrice = originPrice;
        this.salePrice = salePrice;
        this.discount = discount;
        this.productImg = productImg;
        this.quantity = quantity;
        this.productStatus = productStatus;
        this.brandID = brandID;
        this.categoryID = categoryID;
        this.cpu = cpu;
        this.ram = ram;
        this.capacity = capacity;
        this.graphicCard = graphicCard;
        this.display = display;
    }

    public Product(int productID, String productName, String description, double originPrice, double salePrice, double discount, String productImg, int quantity, int productStatus, int brandID, int categoryID, String cpu, String ram, String capacity, String graphicCard, String display) {
        this.productID = productID;
        this.productName = productName;
        this.description = description;
        this.originPrice = originPrice;
        this.salePrice = salePrice;
        this.discount = discount;
        this.productImg = productImg;
        this.quantity = quantity;
        this.productStatus = productStatus;
        this.brandID = brandID;
        this.categoryID = categoryID;
        this.cpu = cpu;
        this.ram = ram;
        this.capacity = capacity;
        this.graphicCard = graphicCard;
        this.display = display;
    }

    public Product(int productID, String productName, String description, long originPrice, long salePrice, double discount, String productImg, int quantity, int productStatus, int brandID, int categoryID, String cpu, String ram, String capacity, String graphicCard, String display) {
        this.productID = productID;
        this.productName = productName;
        this.description = description;
        this.originPrice = originPrice;
        this.salePrice = salePrice;
        this.discount = discount;
        this.productImg = productImg;
        this.quantity = quantity;
        this.productStatus = productStatus;
        this.brandID = brandID;
        this.categoryID = categoryID;
        this.cpu = cpu;
        this.ram = ram;
        this.capacity = capacity;
        this.graphicCard = graphicCard;
        this.display = display;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getOriginPrice() {
        return originPrice;
    }

    public long getOriginPriceLong() {
        long originPriceLong = Long.parseLong(String.format("%.0f", originPrice));
        return originPriceLong;
    }

    public void setOriginPrice(double originPrice) {
        this.originPrice = originPrice;
    }

    public double getSalePrice() {
        return salePrice;
    }

    public long getSalePriceLong() {
        long salePriceLong = Long.parseLong(String.format("%.0f", salePrice));
        return salePriceLong;
    }

    public void setSalePrice(double salePrice) {
        this.salePrice = salePrice;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getProductStatus() {
        return productStatus;
    }

    public void setProductStatus(int productStatus) {
        this.productStatus = productStatus;
    }

    public int getBrandID() {
        return brandID;
    }

    public void setBrandID(int brandID) {
        this.brandID = brandID;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getCpu() {
        return cpu;
    }

    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public String getCapacity() {
        return capacity;
    }

    public void setCapacity(String capacity) {
        this.capacity = capacity;
    }

    public String getGraphicCard() {
        return graphicCard;
    }

    public void setGraphicCard(String graphicCard) {
        this.graphicCard = graphicCard;
    }

    public String getDisplay() {
        return display;
    }

    public void setDisplay(String display) {
        this.display = display;
    }

}
