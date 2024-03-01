package dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.bind.DatatypeConverter;
import model.User;

public class UserDAO extends DBContext {

    private PreparedStatement ps;
    private ResultSet rs;

    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        String query = "SELECT * FROM User ";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(
                        rs.getInt("UserID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("FirstName"),
                        rs.getString("LastName"),
                        rs.getBoolean("Gender"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("Address"),
                        rs.getInt("Status")
                ));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public boolean checkUserToLogin(String xUsername, String xPassword) throws NoSuchAlgorithmException {
        String myHash = md5(xPassword);
        String sql = "select username, [password] from [User] where username = ? and status = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, xUsername);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                if (rs.getString("username").equals(xUsername) & rs.getString("password").equals(myHash)) {

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

    public String md5(String pass) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(pass.getBytes());
        byte[] digest = md.digest();
        String myHash = DatatypeConverter
                .printHexBinary(digest).toUpperCase();
        return myHash;
    }

    public void insertUser(String username, String password, String firstName,
            String lastName, boolean gender, String email, String phone, String address, int status) throws NoSuchAlgorithmException {
        String myHash = md5(password);
        String query = "INSERT INTO [dbo].[User]\n"
                + "           ([Username]\n"
                + "           ,[Password]\n"
                + "           ,[firstName]\n"
                + "           ,[lastName]\n"
                + "           ,[Gender]\n"
                + "           ,[Email]\n"
                + "           ,[Phone]\n"
                + "           ,[Address]\n"
                + "           ,[status])\n"
                + "     VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, myHash);
            ps.setString(3, firstName);
            ps.setString(4, lastName);
            ps.setBoolean(5, gender);
            ps.setString(6, email);
            ps.setString(7, phone);
            ps.setString(8, address);
            ps.setInt(9, status);

            ps.executeUpdate();

        } catch (SQLException e) {
            // Handle the exception
            e.printStackTrace();
        }
    }

    public User getAnUser(String xUsername, String xEmail, String xPhone) {
        String sql = "SELECT [UserID]\n"
                + "      ,[Username]\n"
                + "      ,[Password]\n"
                + "      ,[firstName]\n"
                + "      ,[lastName]\n"
                + "      ,[Gender]\n"
                + "      ,[Email]\n"
                + "      ,[Phone]\n"
                + "      ,[Address]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[User] where Username = ? or email = ? or phone = ?";

        User u = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, xUsername);
            st.setString(2, xEmail);
            st.setString(3, xPhone);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                u = new User(
                        rs.getInt("UserID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("FirstName"),
                        rs.getString("LastName"),
                        rs.getBoolean("Gender"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("Address"),
                        rs.getInt("Status"));
                return u;
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return (u);
    }

    public String getAnEmail(String xEmail) {
        String sql = "select email from [user] where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, xEmail);
            rs = st.executeQuery();
            if (rs.next()) {
                String email = rs.getString("email");
                return email;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void updatePass(String xEmail, String xPass) throws NoSuchAlgorithmException {
        String myHash = md5(xPass);
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [password] = ?\n"
                + " WHERE [email] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, myHash);
            st.setString(2, xEmail);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        try {
            dao.insertUser("hungtrinh", "Hungtrinh@123", "hung", "trinh", true, "Hungtrinh@gmail.com", "0884248518", "hanoi", 1);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
