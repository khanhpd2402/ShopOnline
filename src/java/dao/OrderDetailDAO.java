/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.OrderDetail;

/**
 *
 * @author duykh
 */
public class OrderDetailDAO extends DBContext {
// Phương thức này lấy danh sách chi tiết đơn hàng dựa trên OrderID
    public List<OrderDetail> getOrderDetail(int xOrderID) {
        List<OrderDetail> list = new ArrayList<>();
        String sql = " SELECT OD.[OrderID],OD.[productID],\n"
                + "		p.[ProductName],\n"
                + "		p.[ProductImg], p.[Quantity] quantityInStock,\n"
                + "      OD.[Quantity] Quantity\n"
                + "      ,OD.[price],OD.[Discount]\n"
                + "  FROM [dbo].[OrderDetail] OD,  [dbo].[Product] P where OD.[productID] = p.[productID] and [orderID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, xOrderID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetail od = new OrderDetail(rs.getInt("OrderID"), rs.getInt("productID"), rs.getInt("Quantity"), rs.getLong("price"), rs.getDouble("Discount"), rs.getString("productName"), rs.getString("ProductImg"),rs.getInt("quantityInStock"));
                list.add(od);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    // Phương thức này lấy danh sách chi tiết đơn hàng dựa trên OrderID và UserID
    public List<OrderDetail> getOrderDetailUser(int xOrderID, int xIdUser) {
        List<OrderDetail> list = new ArrayList<>();
        String sql = " SELECT OD.[OrderID],OD.[productID],\n"
                + "		p.[ProductName],\n"
                + "		p.[ProductImg],\n"
                + "      OD.[Quantity] Quantity\n"
                + "      ,OD.[price],OD.[Discount]\n"
                + "  FROM [dbo].[OrderDetail] OD,  [dbo].[Product] P,[dbo].[Order] O where OD.[productID] = p.[productID] And OD.[OrderID] = O.[OrderID] and od.[orderID] = ? AND O.[UserID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, xOrderID);
            st.setInt(2, xIdUser);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetail od = new OrderDetail(rs.getInt("OrderID"), rs.getInt("productID"), rs.getInt("Quantity"), rs.getLong("price"), rs.getDouble("Discount"), rs.getString("productName"), rs.getString("ProductImg"));
                list.add(od);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        OrderDetailDAO dao = new OrderDetailDAO();
        List<OrderDetail> d = dao.getOrderDetailUser(3,1);
        for (OrderDetail order : d) {
            System.out.println(order.getOrderID() + "" + order.getProductName());
        }
    }
}
