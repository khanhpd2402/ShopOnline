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
import model.Blog;

/**
 *
 * @author admin
 */
public class BlogDAO extends DBContext{
    private PreparedStatement ps;
    private ResultSet rs;
    
    public ArrayList<Blog> getAllBlogs() {
        ArrayList<Blog> blogList = new ArrayList<>();
        try {

            String query = "select * from Blog  ";
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                blogList.add(new Blog(rs.getInt("ID"), rs.getString("Author"), rs.getString("Title"), rs.getString("Content"), rs.getString("imageLink")));
            }
        } catch (SQLException e) {
            Logger.getLogger(Blog.class.getName()).log(Level.SEVERE, null, e);
        }
        return blogList;
    }
    
    public Blog getBlogByID(int id) {
        String query = "SELECT * FROM Blog WHERE ID = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Blog(rs.getInt("ID"), rs.getString("Author"), rs.getString("Title"), rs.getString("Content"), rs.getString("imageLink"));
            }
        } catch (SQLException e) {
            Logger.getLogger(Blog.class.getName()).log(Level.SEVERE, null, e);
        }
        return null;
    }
}
