/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Item;
import model.Order;

/**
 *
 * @author ADMIN
 */
public class OrderDAO extends DBContext {

   // Thêm đơn hàng và chi tiết đơn hàng vào cơ sở dữ liệu
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
            // Xác định trạng thái đơn hàng dựa trên phương thức thanh toán
            if (paymentMethod.equals("1")) {// Trạng thái 1 cho thanh toán trực tuyến
                st.setInt(7, 1);
            } else if (paymentMethod.equals("2")) {// Trạng thái 2 cho thanh toán khi nhận hàng
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
// Cập nhật trạng thái đơn hàng dựa trên OrderID
    public void updateStatusOrder(int xOrderID, int status) {
        String sql = "UPDATE [dbo].[Order] SET [OrderStatus] = ? WHERE [OrderID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, status);
            st.setInt(2, xOrderID);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
// Cập nhật trạng thái đơn hàng của người dùng dựa trên OrderID và UserID
    public boolean updateStatusOrderUser(int xOrderID, int status, int xIdUser) {
        String sql = "UPDATE [dbo].[Order] SET [OrderStatus] = ? WHERE [OrderID] = ? AND [UserID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, status);
            st.setInt(2, xOrderID);
            st.setInt(3, xIdUser);

            int rowsAffected = st.executeUpdate();

            // Nếu có ít nhất một dòng được cập nhật, tức là update thành công
            return rowsAffected > 0;
        } catch (SQLException e) {
            return false;
        }
    }
// Lấy danh sách đơn hàng của người dùng dựa trên trạng thái và UserID
    public List<Order> getOrderUser(int xstatus, int userID) {
        List<Order> list = new ArrayList<>();
        String sql = " SELECT [OrderID]\n"
                + "      ,[UserID]\n"
                + "      ,[OrderDate]\n"
                + "      ,[Address]\n"
                + "      ,[Phone]\n"
                + "      ,[TotalMoney]\n"
                + "      ,[OrderNote]\n"
                + "      ,[OrderStatus]\n"
                + "      ,[amountCoupon]\n"
                + "  FROM [dbo].[Order] WHERE [UserID] = ? and [OrderStatus] = ? ORDER BY orderID DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            st.setInt(2, xstatus);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOrderID(rs.getInt("OrderID"));
                o.setUserID(rs.getInt("UserID"));
                o.setOrderDate(rs.getDate("OrderDate"));
                o.setAddress(rs.getString("Address"));
                o.setPhone(rs.getString("Phone"));
                o.setTotalMoney(rs.getFloat("TotalMoney"));
                o.setOrderNote(rs.getString("OrderNote"));
                o.setOrderStatus(rs.getInt("OrderStatus"));
                o.setAmountCoupon(rs.getFloat("amountCoupon"));
                list.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
// Lấy danh sách đơn hàng dựa trên trạng thái
    public List<Order> getOrder(int xstatus) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT [OrderID]\n"
                + "      ,[UserID]\n"
                + "      ,[OrderDate]\n"
                + "      ,[Address]\n"
                + "      ,[Phone]\n"
                + "      ,[TotalMoney]\n"
                + "      ,[OrderNote]\n"
                + "      ,[OrderStatus]\n"
                + "      ,[amountCoupon]\n"
                + "  FROM [dbo].[Order] WHERE [OrderStatus] = ? ORDER BY orderID DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, xstatus);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOrderID(rs.getInt("OrderID"));
                o.setUserID(rs.getInt("UserID"));
                o.setOrderDate(rs.getDate("OrderDate"));
                o.setAddress(rs.getString("Address"));
                o.setPhone(rs.getString("Phone"));
                o.setTotalMoney(rs.getFloat("TotalMoney"));
                o.setOrderNote(rs.getString("OrderNote"));
                o.setOrderStatus(rs.getInt("OrderStatus"));
                o.setAmountCoupon(rs.getFloat("amountCoupon"));
                list.add(o);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

}
