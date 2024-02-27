/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import model.Cart;
import model.Item;
import model.User;

/**
 *
 * @author ADMIN
 */
public class OrderDAO extends DBContext {

    public void insertOrder(int xUserID, String xPhone, Cart cart, String paymentMethod, String address, double totalMoney, String orderNote, double amountCoupon) throws SQLException {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        connection.setAutoCommit(false);
        try {
            //add vao bang order trc
            String sql = "INSERT INTO [dbo].[Order]\n"
                    + "           ([UserID]\n"
                    + "           ,[OrderDate]\n"
                    + "           ,[Address]\n"
                    + "           ,[Phone]\n"
                    + "           ,[TotalMoney]\n"
                    + "           ,[OrderNote]\n"
                    + "           ,[OrderStatus]\n"
                    + "           ,[amountCoupon])\n"
                    + "     VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, xUserID);
            st.setString(2, date);
            st.setString(3, address);
            st.setString(4, xPhone);
            st.setDouble(5, totalMoney);
            st.setString(6, orderNote);
            if (paymentMethod.equals("1")) {
                st.setInt(7, 1);
            } else if (paymentMethod.equals("2")) {
                st.setInt(7, 2);
            }
            st.setDouble(8, amountCoupon);
            st.executeUpdate();
            //lay id cua order vua add
            String sql1 = "select top 1 OrderID from [order] order by OrderID desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            //add bang orderdetail

            if (rs.next()) {
                int orderID = rs.getInt("orderID");
                for (Item i : cart.getItems()) {
                    String sql2 = "INSERT INTO [dbo].[OrderDetail]\n"
                            + "           ([OrderID]\n"
                            + "           ,[ProductID]\n"
                            + "           ,[Quantity]\n"
                            + "           ,[Price]\n"
                            + "           ,[Discount])\n"
                            + "     VALUES (?,?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, orderID);
                    st2.setInt(2, i.getProduct().getProductID());
                    st2.setInt(3, i.getQuantity());
                    st2.setDouble(4, i.getPrice());
                    st2.setDouble(5, i.getProduct().getDiscount());
                    st2.executeUpdate();
                }
            }
            connection.commit(); // Xác nhận giao dịch
        } catch (SQLException e) {
            connection.rollback(); // Hủy bỏ giao dịch nếu có lỗi
        }
    }
}
