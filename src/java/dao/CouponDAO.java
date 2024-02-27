/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dao.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Coupon;

/**
 *
 * @author ADMIN
 */
public class CouponDAO extends DBContext {

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
    
    public static void main(String[] args) {
        CouponDAO dao = new CouponDAO();
        Coupon c = dao.getCouponByCode("SAVE10");
        System.out.println( c.getId());
    }
}
