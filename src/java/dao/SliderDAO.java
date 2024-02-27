/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Slider;

/**
 *
 * @author khanh
 */
public class SliderDAO extends DBContext {

    private PreparedStatement ps;
    private ResultSet rs;

    public ArrayList<Slider> getAllSlider() {
        ArrayList<Slider> list = new ArrayList<>();
        try {
            String query = "SELECT [ID]\n"
                    + "      ,[Img]\n"
                    + "      ,[Title]\n"
                    + "      ,[Description]\n"
                    + "      ,[status]\n"
                    + "  FROM [dbo].[Slider]";
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Slider(rs.getInt("ID"),
                        rs.getString("Img"),
                        rs.getString("Title"),
                        rs.getString("Description"),
                        rs.getInt("Status")));
            }
        } catch (SQLException e) {
            Logger.getLogger(Slider.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public Slider getSlider(int id) {
        Slider slider = null;
        try {
            String query = "SELECT [ID]\n"
                    + "      ,[Img]\n"
                    + "      ,[Title]\n"
                    + "      ,[Description]\n"
                    + "      ,[status]\n"
                    + "  FROM [dbo].[Slider] WHERE ID = ?";
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                slider = new Slider(rs.getInt("ID"),
                        rs.getString("Img"),
                        rs.getString("Title"),
                        rs.getString("Description"),
                        rs.getInt("Status"));
            }
        } catch (SQLException e) {
            Logger.getLogger(Slider.class.getName()).log(Level.SEVERE, null, e);
        }
        return slider;
    }

    public void addSlider(String img, String title, String description, int status) {
        try {
            String query = "INSERT INTO [dbo].[Slider]\n"
                    + "           ([Img]\n"
                    + "           ,[Title]\n"
                    + "           ,[Description]\n"
                    + "           ,[status])\n"
                    + "     VALUES (?, ? , ? , ? )";
            ps = connection.prepareStatement(query);
            ps.setString(1, img);
            ps.setString(2, title);
            ps.setString(3, description);
            ps.setInt(4, status);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(Slider.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void editSlider(int id, String img, String title, String description, int status) {
        try {
            String query = "	UPDATE [dbo].[Slider]\n"
                    + "	   SET [Img] = ?\n"
                    + "		  ,[Title] = ?\n"
                    + "		  ,[Description] = ?\n"
                    + "		  ,[status] = ? WHERE ID = ?";
            ps = connection.prepareStatement(query);
            ps.setString(1, img);
            ps.setString(2, title);
            ps.setString(3, description);
            ps.setInt(4, status);
            ps.setInt(5, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(Slider.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void deleteSlider(int id) {
        try {
            String query = "DELETE FROM dbo.Slider WHERE ID = ?";
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(Slider.class.getName()).log(Level.SEVERE, null, e);
        }

    }
}
