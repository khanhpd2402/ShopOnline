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
import model.Category;

/**
 *
 * @author khanh
 */
public class CategoryDAO extends DBContext {

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT [CategoryID]\n"
                + "      ,[CategoryName]\n"
                + "  FROM [dbo].[Category]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt("categoryID"), rs.getString("categoryName"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public String getCategoryName(int cid) {
        String cname = null;
        String sql = "select categoryName from Category where categoryID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                cname = rs.getString("categoryName");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return cname;
    }

}
