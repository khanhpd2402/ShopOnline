package dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.DatatypeConverter;
import model.User;

public class UserDAO extends DBContext {

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();

        userDAO.updateUserContactID_Favorite(25, 16);
    }
    private PreparedStatement ps;
    
// Phương thức lấy danh sách tất cả người dùng từ cơ sở dữ liệu
    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        // Truy vấn SQL lấy thông tin người dùng và liên lạc từ bảng User và UserContact
        String query = "SELECT \n"
                + "    U.UserID,\n"
                + "    U.Username,\n"
                + "    U.Password,\n"
                + "    U.firstName,\n"
                + "    U.lastName,\n"
                + "    U.Gender,\n"
                + "    U.status,\n"
                + "    U.UserContactID_Favorite,\n"
                + "    UC.Email,\n"
                + "    UC.Phone,\n"
                + "    UC.Address\n"
                + "FROM \n"
                + "    [dbo].[User] U\n"
                + "INNER JOIN \n"
                + "    [dbo].[UserContact] UC ON U.UserID = UC.UserID AND U.UserContactID_Favorite = UC.UserContactID";
        try {
            // Chuẩn bị và thực hiện truy vấn SQL
            ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            // Duyệt qua kết quả và tạo đối tượng User từ dữ liệu trả về
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
    
// Phương thức kiểm tra thông tin người dùng để đăng nhập
    public boolean checkUserToLogin(String xUsername, String xPassword) throws NoSuchAlgorithmException {
        String myHash = md5(xPassword);
        String sql = "select username, [password] from [User] where username = ? and status = 1";
        try {
            // Chuẩn bị và thực hiện truy vấn SQL với tham số
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, xUsername);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                // So sánh thông tin đăng nhập với dữ liệu trong cơ sở dữ liệu
                if (rs.getString("username").equals(xUsername) & rs.getString("password").equals(myHash)) {
                    return true;
                }
            }
            // Đóng ResultSet và PreparedStatement
            rs.close();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
    
// Phương thức mã hóa mật khẩu bằng thuật toán MD5
    public String md5(String pass) throws NoSuchAlgorithmException {
        // Sử dụng MessageDigest để thực hiện mã hóa MD5
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(pass.getBytes());
        byte[] digest = md.digest();
        // Trả về chuỗi hex được in hoa của mật khẩu đã được mã hóa
        String myHash = DatatypeConverter
                .printHexBinary(digest).toUpperCase();
        return myHash;
    }
    
// Phương thức thêm mới người dùng vào cơ sở dữ liệu
    public void insertUser(String username, String password, String firstName,
            String lastName, boolean gender, String email, String phone, String address, int status) throws NoSuchAlgorithmException, SQLException {
        String myHash = md5(password);
        UserContactDAO ucd = new UserContactDAO();
        try {
            //add vao user truoc
            String query = "INSERT INTO [dbo].[User]\n"
                    + "           ([Username]\n"
                    + "           ,[Password]\n"
                    + "           ,[firstName]\n"
                    + "           ,[lastName]\n"
                    + "           ,[Gender]\n"
                    + "           ,[status])\n"
                    + "     VALUES (?, ?, ?, ?, ?, ?);";

            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, username);
            st.setString(2, myHash);
            st.setString(3, firstName);
            st.setString(4, lastName);
            st.setBoolean(5, gender);
            st.setInt(6, status);
            st.executeUpdate();

            //lay id cua user vua add
            String query2 = "select top 1 [UserID] from [User] order by [UserID] desc";
            PreparedStatement st2 = connection.prepareStatement(query2);
            ResultSet rs = st2.executeQuery();

            // Thêm thông tin liên lạc người dùng vào bảng UserContact
            if (rs.next()) {
                int userID = rs.getInt("UserID");
                ucd.insertUserContact(userID, email, phone, address);

                // Lấy UserContactID của liên lạc vừa thêm mới
                String query3 = "select top 1 [UserContactID] from [UserContact] order by [UserContactID] desc";
                PreparedStatement st3 = connection.prepareStatement(query3);
                ResultSet rs2 = st3.executeQuery();

                // Cập nhật UserContactID_Favorite cho người dùng mới(mac dinh la lien lac khi user dang ki tai khoan)
                if (rs2.next()) {
                    int UserContactID = rs2.getInt("UserContactID");
                    updateUserContactID_Favorite(UserContactID, userID);
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
// Phương thức cập nhật UserContactID_Favorite cho một người dùng
    public void updateUserContactID_Favorite(int xUserContactID_Favorite, int xUserID) {
        String sql = "UPDATE [dbo].[User] SET \n"
                + "[UserContactID_Favorite] = ?\n"
                + " WHERE [UserID] = ?";
        try {
            // Thực hiện truy vấn cập nhật UserContactID_Favorite cho người dùng
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, xUserContactID_Favorite);
            st.setInt(2, xUserID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
// Phương thức lấy thông tin của một người dùng dựa trên tên đăng nhập
    public User getAnUser(String xUsername) {
        // Truy vấn lấy thông tin người dùng từ bảng User và UserContact
        String sql = "SELECT \n"
                + "    U.UserID,\n"
                + "    U.Username,\n"
                + "    U.Password,\n"
                + "    U.firstName,\n"
                + "    U.lastName,\n"
                + "    U.Gender,\n"
                + "    U.status, U.UserContactID_Favorite,\n"
                + "    UC.Email,\n"
                + "    UC.Phone,\n"
                + "    UC.Address\n"
                + "FROM \n"
                + "    [dbo].[User] U\n"
                + "INNER JOIN \n"
                + "    [dbo].[UserContact] UC ON U.UserContactID_Favorite = UC.UserContactID\n"
                + "WHERE \n"
                + " U.UserID = UC.UserID AND [status] = 1 AND U.Username = ?";

        User u = null;
        try {
            // Thực hiện truy vấn với tham số là tên đăng nhập
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, xUsername);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                // Tạo đối tượng User từ dữ liệu trả về
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
                        rs.getInt("Status"), rs.getInt("UserContactID_Favorite"));
                return u;
            }
            rs.close();
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return (u);
    }
    
    // Phương thức cập nhật mật khẩu của người dùng dựa trên địa chỉ email
    public void updatePass(String xEmail, String xPass) throws NoSuchAlgorithmException {
        // Tạo mã hash cho mật khẩu mới
        String myHash = md5(xPass);
        // Truy vấn SQL cập nhật mật khẩu trong bảng User dựa trên địa chỉ email và UserContactID_Favorite
        String sql = "UPDATE [dbo].[User]\n"
                + "SET [Password] = ?\n"
                + "FROM [dbo].[User] U\n"
                + "INNER JOIN [dbo].[UserContact] UC ON U.[UserID] = UC.[UserID]\n"
                + "WHERE UC.[Email] = ? AND U.[UserContactID_Favorite] = UC.[UserContactID];";
        try {
            // Chuẩn bị và thực hiện truy vấn SQL với tham số là mật khẩu đã hash và địa chỉ email
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, myHash);
            st.setString(2, xEmail);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
// Phương thức cập nhật thông tin người dùng
    public void updateUser(User u) {
        // Truy vấn SQL cập nhật thông tin người dùng trong bảng User dựa trên UserID
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [Username] = ?\n"
                + "      ,[firstName] = ?\n"
                + "      ,[lastName] = ?\n"
                + "      ,[Gender] = ?"
                + " WHERE userID = ?";
        try {
            // Chuẩn bị và thực hiện truy vấn SQL với các tham số là thông tin mới của người dùng
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getUsername());
            st.setString(2, u.getFirstName());
            st.setString(3, u.getLastName());
            st.setBoolean(4, u.isGender());
            st.setInt(5, u.getUserID());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

}
