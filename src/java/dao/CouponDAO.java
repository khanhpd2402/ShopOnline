/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Coupon;

/**
 *
 * @author ADMIN
 */
public class CouponDAO extends DBContext {
//Lấy thông tin mã giảm giá dựa trên mã code.

    public Coupon getCouponByCode(String code) {
        Coupon coupon = null;
        String query = "SELECT * FROM Coupon WHERE code = ? AND expirationDate > GETDATE()";

        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, code);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                coupon = new Coupon(
                        rs.getInt("id"),
                        rs.getString("code"),
                        rs.getDouble("value"),
                        rs.getBoolean("type"),
                        rs.getDate("expirationDate"));
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return coupon;
    }

    public Coupon getCouponById(int id) {
        Coupon coupon = null;
        String query = "SELECT * FROM Coupon WHERE id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, id);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                coupon = new Coupon(
                        rs.getInt("id"),
                        rs.getString("code"),
                        rs.getDouble("value"),
                        rs.getBoolean("type"),
                        rs.getDate("expirationDate"));
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return coupon;
    }

    public List<Coupon> getAllCoupon() {
        List<Coupon> list = new ArrayList<>();
        // Truy vấn SQL lấy thông tin người dùng và liên lạc từ bảng Coupon
        String query = "SELECT [ID]\n"
                + "      ,[Code]\n"
                + "      ,[Value]\n"
                + "      ,[Type]\n"
                + "      ,[expirationDate]\n"
                + "  FROM [dbo].[Coupon]";

        try {
            // Chuẩn bị và thực hiện truy vấn SQL
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            // Duyệt qua kết quả và tạo đối tượng Coupon từ dữ liệu trả về
            while (rs.next()) {
                list.add(new Coupon(
                        rs.getInt("id"),
                        rs.getString("code"),
                        rs.getDouble("value"),
                        rs.getBoolean("type"),
                        rs.getDate("expirationDate")));
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
// Phương thức cập nhật ma giam gia trong cơ sở dữ liệu

    public void updateCoupon(Coupon c) {
        String sql = "UPDATE [dbo].[Coupon]\n"
                + "   SET [Code] = ?\n"
                + "      ,[Value] = ?\n"
                + "      ,[Type] =?\n"
                + "      ,[expirationDate] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getCode());
            st.setDouble(2, c.getValue());
            st.setBoolean(3, c.isType());
            st.setDate(4, c.getExpirationDate());
            st.setInt(5, c.getId());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
// Phương thức XÓA 1 ma giam gia

    public void deleteCoupon(int id) {
        // Truy vấn SQL xóa ma giam gia trong bảng Coupon dựa trên id
        String sql = "DELETE FROM [dbo].[Coupon]\n"
                + "      WHERE id = ?";
        try {
            // Chuẩn bị và thực hiện truy vấn SQL với tham số là id
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
// Phương thức chèn ma giam gia vào cơ sở dữ liệu

    public void insertUserContact(String code, double value, boolean type, Date expirationDate) {
        String query = "INSERT INTO [dbo].[Coupon]\n"
                + "           ([Code]\n"
                + "           ,[Value]\n"
                + "           ,[Type]\n"
                + "           ,[expirationDate])\n"
                + "     VALUES (?, ?, ?, ?);";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, code);
            st.setDouble(2, value);
            st.setBoolean(3, type);
            st.setDate(4, expirationDate);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
        CouponDAO dao = new CouponDAO();
        Coupon c = dao.getCouponById(1);
        System.out.println(c.getId() + "-" + c.getExpirationDate());
    }
}
