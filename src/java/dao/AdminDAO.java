/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.xml.bind.DatatypeConverter;
import model.Admin;

/**
 *
 * @author khanh
 */
public class AdminDAO extends DBContext {

    public String md5(String pass) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(pass.getBytes());
        byte[] digest = md.digest();
        String myHash = DatatypeConverter
                .printHexBinary(digest).toUpperCase();
        return myHash;
    }

    public boolean checkAdminToLogin(String xAdminname, String xPassword) throws NoSuchAlgorithmException {
        String myHash = md5(xPassword);
        String sql = "select AdminName, [password] from [Admin] where AdminName = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, xAdminname);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                if (rs.getString("AdminName").equals(xAdminname) & rs.getString("password").equals(myHash)) {
                    return true;
                }
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public Admin getAnAdmin(String xAdminName, String xEmail, String xPhone) {
        String sql = "SELECT [AdminID]\n"
                + "      ,[AdminName]\n"
                + "      ,[password]\n"
                + "      ,[firstName]\n"
                + "      ,[lastName]\n"
                + "      ,[email]\n"
                + "      ,[phoneNumber]\n"
                + "      ,[address]\n"
                + "  FROM [dbo].[Admin] where AdminName = ? or email = ? or phoneNumber = ?";

        Admin a = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, xAdminName);
            st.setString(2, xEmail);
            st.setString(3, xPhone);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                a = new Admin(
                        rs.getInt("AdminID"),
                        rs.getString("AdminName"),
                        rs.getString("password"),
                        rs.getString("firstName"),
                        rs.getString("lastName"),
                        rs.getString("email"),
                        rs.getString("phoneNumber"),
                        rs.getString("address")
                );
                return a;
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return (a);
    }
}
