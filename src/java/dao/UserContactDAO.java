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
import model.UserContact;

/**
 *
 * @author khanh
 */
public class UserContactDAO extends DBContext {
// Phương thức chèn thông tin liên lạc của người dùng vào cơ sở dữ liệu
    public void insertUserContact(int userID, String email, String phone, String address) {
        String query = "INSERT INTO [dbo].[UserContact]\n"
                + "           ([UserID]\n"
                + "           ,[Email]\n"
                + "           ,[Phone]\n"
                + "           ,[Address])\n"
                + "     VALUES (?, ?, ?, ?);";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, userID);
            st.setString(2, email);
            st.setString(3, phone);
            st.setString(4, address);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
        UserContactDAO userDAO = new UserContactDAO();

        List< UserContact> u = userDAO.getAllContactAnUser(0);
        for (UserContact userContact : u) {
            System.out.println(userContact.getEmail());

        }
    }
// Phương thức lấy tất cả thông tin liên lạc của một người dùng dựa trên UserID
    public List<UserContact> getAllContactAnUser(int xUserID) {
        List<UserContact> list = new ArrayList<>();

        String sql = "SELECT [UserContactID]\n"
                + "      ,[UserID]\n"
                + "      ,[Email]\n"
                + "      ,[Phone]\n"
                + "      ,[Address]\n"
                + "  FROM [dbo].[UserContact] where 1 = 1";
        if (xUserID != 0) {
            sql += "AND [UserID] = ?";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if (xUserID != 0) {
                st.setInt(1, xUserID);
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new UserContact(
                        rs.getInt("UserContactID"),
                        rs.getInt("UserID"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("Address")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
// Phương thức kiểm tra xem một thông tin liên lạc đã tồn tại hay chưa dựa trên Email hoặc Phone
    public UserContact getExistContact(String xEmail, String xPhone) {
        UserContact uc = null;
        String sql = "SELECT [Email]\n"
                + "      ,[Phone]\n"
                + "  FROM [dbo].[UserContact] where [Email] = ? OR [Phone] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, xEmail);
            st.setString(2, xPhone);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                uc = new UserContact(rs.getString("email"), rs.getString("Phone"));
                return uc;
            }
        } catch (SQLException e) {
        }
        return uc;
    }
// Phương thức lấy thông tin liên lạc của một người dùng dựa trên UserContactID
    public UserContact getAnContactById(int xUserContactID) {
        UserContact uc = null;
        String sql = "  SELECT [UserContactID]\n"
                + "      ,[UserID]\n"
                + "      ,[Email]\n"
                + "      ,[Phone]\n"
                + "      ,[Address]\n"
                + "  FROM [dbo].[UserContact] WHERE userContactid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, xUserContactID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                uc = new UserContact(rs.getString("email"), rs.getString("Phone"));
                return uc;
            }
        } catch (SQLException e) {
        }
        return uc;
    }
// Phương thức lấy Email của người dùng dựa trên Email
    public String getAnEmail(String xEmail) {
        String sql = "SELECT UC.[Email]\n"
                + "FROM [dbo].[User] U\n"
                + "INNER JOIN [dbo].[UserContact] UC ON U.[UserID] = UC.[UserID]\n"
                + "WHERE UC.[Email] = ? AND U.[UserContactID_Favorite] = UC.[UserContactID];";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, xEmail);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String email = rs.getString("email");
                return email;
            }
        } catch (SQLException e) {
        }
        return null;
    }

//    public void updateUserContact(int xUserContactID_Favorite, int xUserID) {
//        String sql = "UPDATE [dbo].[User]\n"
//                + "   SET [UserContactID_Favorite] = ?\n"
//                + " WHERE [UserID] = ?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, xUserContactID_Favorite);
//            st.setInt(2, xUserID);
//            st.executeUpdate();
//        } catch (SQLException e) {
//        }
//    }
}