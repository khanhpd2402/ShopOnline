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
import model.Brand;

/**
 *
 * @author khanh
 */
public class BrandDAO extends DBContext {

    public List<Brand> getAllBrandToSearch() {
        List<Brand> list = new ArrayList<>();
        String sql = "SELECT [BrandID]\n"
                + "      ,[BrandName]\n"
                + "  FROM [dbo].[Brand] where status = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand s = new Brand(rs.getInt("BrandID"), rs.getString("BrandName"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

//    public List<Brand> getListSupplier(int xstatus) {
//        List<Brand> list = new ArrayList<>();
//        String sql = "select supplierID, supplierName, [companyName], status from Supplier WHERE 1 = 1 ";
//        if (xstatus == 1) {
//            sql += " AND status = 1";
//        } else if (xstatus == 0) {
//            sql += " AND status = 0";
//        }
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                Brand s = new Brand(rs.getInt("supplierID"), rs.getInt("status"), rs.getString("supplierName"),rs.getString("companyName"));
//                list.add(s);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//
//        return list;
//    }
    public String getBrandName(int xID) {
        String name = null;
        String sql = "SELECT [BrandName]\n"
                + "  FROM [dbo].[Brand] where BrandID = ? AND status = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, xID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                name = rs.getString("BrandName");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return name;
    }

    
//    public Brand getAnSupplierByID(int sID) {
//        Brand s = null;
//        String sql = "SELECT [supplierID]\n"
//                + "      ,[supplierName]\n"
//                + "      ,[companyName]\n"
//                + "      ,[contactInfor]\n"
//                + "      ,[phoneContact]\n"
//                + "      ,[address]\n"
//                + "      ,[country]\n"
//                + "      ,[status]\n"
//                + "  FROM [dbo].[Supplier] WHERE supplierID = ?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, sID);
//            ResultSet rs = st.executeQuery();
//            if (rs.next()) {
//                s = new Brand(rs.getInt("supplierID"),
//                        rs.getInt("status"),
//                        rs.getString("supplierName"),
//                        rs.getString("companyName"),
//                        rs.getString("contactInfor"),
//                        rs.getString("phoneContact"),
//                        rs.getString("address"),
//                        rs.getString("country"));
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return s;
//    }
//    public void updateSupplier(Brand s) {
//        String sql = "UPDATE [dbo].[Supplier]\n"
//                + "   SET [supplierName] = ? \n"
//                + "      ,[companyName] = ? \n"
//                + "      ,[contactInfor] = ? \n"
//                + "      ,[phoneContact] = ? \n"
//                + "      ,[address] = ? \n"
//                + "      ,[country] = ? \n"
//                + "      ,[status] = ? \n"
//                + " WHERE SupplierID = ?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//
//            st.setString(1, s.getSupplierName());
//            st.setString(2, s.getCompanyName());
//            st.setString(3, s.getContactInfor());
//            st.setString(4, s.getPhoneContact());
//            st.setString(5, s.getAddress());
//            st.setString(6, s.getCountry());
//            st.setInt(7, s.getStatus());
//            st.setInt(8, s.getSupplierID());
//            st.executeUpdate();
//        } catch (SQLException e) {
//        }
//    }
//
//    public void insertSupplier(Brand s) {
//        String sql = "INSERT INTO [dbo].[Supplier]\n"
//                + "           ([supplierName]\n"
//                + "           ,[companyName]\n"
//                + "           ,[contactInfor]\n"
//                + "           ,[phoneContact]\n"
//                + "           ,[address]\n"
//                + "           ,[country]\n"
//                + "           ,[status])\n"
//                + "     VALUES "
//                + "           (?, ?, ?, ?, ?, ?, 1)";
//
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//
//            st.setString(1, s.getSupplierName());
//            st.setString(2, s.getCompanyName());
//            st.setString(3, s.getContactInfor());
//            st.setString(4, s.getPhoneContact());
//            st.setString(5, s.getAddress());
//            st.setString(6, s.getCountry());
//            st.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//    }
}
