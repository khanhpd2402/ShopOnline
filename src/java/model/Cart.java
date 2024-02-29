/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import model.Item;
import java.util.ArrayList;

import java.util.List;

/**
 *
 * @author ACER
 */
public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<Item> getItems() {
        return items;
    }

    private Item getItemById(int id) {
        for (Item i : items) {
            if (i.getProduct().getProductID() == id) {
                return i;
            }
        }
        return null;
    }

    public int getQuantityOfItemById(int id) {
        return getItemById(id).getQuantity();

    }
    public void addItem(Item xItem) {
        if (getItemById(xItem.getProduct().getProductID()) != null) {
            Item item = getItemById(xItem.getProduct().getProductID());
            item.setQuantity(xItem.getQuantity());
        } else {
            items.add(xItem);
        }
    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }
    public double getTotalMoney(){
        double t = 0;
        for (Item i : items) {
            t += (i.getProduct().getSalePrice()- i.getProduct().getSalePrice() * i.getProduct().getDiscount()) * i.getQuantity();
        }
        return t;
    }
    private Product getProductById(int id, List<Product> list){
         for (Product i : list) {
            if(i.getProductID()== id){
                return i;
            }
        }
         return null;
    }
    //constructer cart de add vao array item
    public Cart(String txt, List<Product> list){
        items = new ArrayList<>();
        try {
        if(txt != null && txt.length() != 0){
            String[] s = txt.split("_");
            for (String i : s) {
                String[] n = i.split(":");
                int id = Integer.parseInt(n[0]);
                int quantity = Integer.parseInt(n[1]);
                Product p = getProductById(id, list);
                Item t = new Item(p, quantity, p.getSalePrice());
                addItem(t);
            }
        }
        } catch (NumberFormatException e) {
        }
    }
}
