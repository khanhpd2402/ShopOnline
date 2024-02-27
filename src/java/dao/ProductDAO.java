/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import model.Product;

/**
 *
 * @author admin
 */
public class ProductDAO extends DBContext {

    private PreparedStatement ps;
    private ResultSet rs;

    public ArrayList<Product> getTop8Product() {
        ArrayList<Product> list = new ArrayList<>();
        try {

            String query = "SELECT TOP 8 [ProductID]\n"
                    + "      ,[ProductName]\n"
                    + "      ,[Description]\n"
                    + "      ,[OriginPrice]\n"
                    + "      ,[SalePrice]\n"
                    + "      ,[Discount]\n"
                    + "      ,[ProductImg]\n"
                    + "      ,[Quantity]\n"
                    + "      ,[ProductStatus]\n"
                    + "      ,[BrandID]\n"
                    + "      ,[CategoryID]\n"
                    + "      ,[CPU]\n"
                    + "      ,[RAM]\n"
                    + "      ,[Capacity]\n"
                    + "      ,[GraphicCard]\n"
                    + "      ,[Display]\n"
                    + "  FROM [dbo].[Product]"
                    + "ORDER BY \n"
                    + "    [ProductID] DESC;";

            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getString("Description"),
                        rs.getDouble("OriginPrice"),
                        rs.getDouble("SalePrice"),
                        rs.getDouble("Discount"),
                        rs.getString("ProductImg"),
                        rs.getInt("Quantity"),
                        rs.getInt("ProductStatus"),
                        rs.getInt("BrandID"),
                        rs.getInt("CategoryID"),
                        rs.getString("Cpu"),
                        rs.getString("Ram"),
                        rs.getString("Capacity"),
                        rs.getString("GraphicCard"),
                        rs.getString("Display")
                ));

            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Product> getAllProduct(int priceS) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [ProductID]\n"
                + "      ,[ProductName]\n"
                + "      ,[Description]\n"
                + "      ,[OriginPrice]\n"
                + "      ,[SalePrice]\n"
                + "      ,[Discount]\n"
                + "      ,[ProductImg]\n"
                + "      ,[Quantity]\n"
                + "      ,[ProductStatus]\n"
                + "      ,[BrandID]\n"
                + "      ,[CategoryID]\n"
                + "      ,[CPU]\n"
                + "      ,[RAM]\n"
                + "      ,[Capacity]\n"
                + "      ,[GraphicCard]\n"
                + "      ,[Display]\n"
                + "  FROM [dbo].[Product] where [ProductStatus] != 0";
        switch (priceS) {
            case 1:
                sql += " order by [SalePrice] DESC ";
                break;
            case 2:
                sql += " order by [SalePrice] ASC";
                break;
            default:
                sql += " order by [productID] DESC";
                break;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getString("Description"),
                        rs.getDouble("OriginPrice"),
                        rs.getDouble("SalePrice"),
                        rs.getDouble("Discount"),
                        rs.getString("ProductImg"),
                        rs.getInt("Quantity"),
                        rs.getInt("ProductStatus"),
                        rs.getInt("BrandID"),
                        rs.getInt("CategoryID"),
                        rs.getString("Cpu"),
                        rs.getString("Ram"),
                        rs.getString("Capacity"),
                        rs.getString("GraphicCard"),
                        rs.getString("Display")
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public Product getProductByID(int productID) {

        String sql = "SELECT [ProductID]\n"
                + "      ,[ProductName]\n"
                + "      ,[Description]\n"
                + "      ,[OriginPrice]\n"
                + "      ,[SalePrice]\n"
                + "      ,[Discount]\n"
                + "      ,[ProductImg]\n"
                + "      ,[Quantity]\n"
                + "      ,[ProductStatus]\n"
                + "      ,[BrandID]\n"
                + "      ,[CategoryID]\n"
                + "      ,[CPU]\n"
                + "      ,[RAM]\n"
                + "      ,[Capacity]\n"
                + "      ,[GraphicCard]\n"
                + "      ,[Display]\n"
                + "  FROM [dbo].[Product] where [productID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                try {
                    Product p = new Product(
                            rs.getInt("ProductID"),
                            rs.getString("ProductName"),
                            rs.getString("Description"),
                            rs.getDouble("OriginPrice"),
                            rs.getDouble("SalePrice"),
                            rs.getDouble("Discount"),
                            rs.getString("ProductImg"),
                            rs.getInt("Quantity"),
                            rs.getInt("ProductStatus"),
                            rs.getInt("BrandID"),
                            rs.getInt("CategoryID"),
                            rs.getString("Cpu"),
                            rs.getString("Ram"),
                            rs.getString("Capacity"),
                            rs.getString("GraphicCard"),
                            rs.getString("Display")
                    );

                    return p;
                } catch (NumberFormatException | SQLException e) {
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

//search theo ten o trang shop
    public List<Product> searchProductByName(String name, int priceS) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [ProductID]\n"
                + "      ,[ProductName]\n"
                + "      ,[Description]\n"
                + "      ,[OriginPrice]\n"
                + "      ,[SalePrice]\n"
                + "      ,[Discount]\n"
                + "      ,[ProductImg]\n"
                + "      ,[Quantity]\n"
                + "      ,[ProductStatus]\n"
                + "      ,[BrandID]\n"
                + "      ,[CategoryID]\n"
                + "      ,[CPU]\n"
                + "      ,[RAM]\n"
                + "      ,[Capacity]\n"
                + "      ,[GraphicCard]\n"
                + "      ,[Display]\n"
                + "  FROM [dbo].[Product] where [ProductStatus] != 0 ";
        if (name != null && !name.trim().equals("")) {
            // Tạo một biến để lưu kết quả
            String newName = "";
            // Tạo một biến để đếm số lượng kí tự khoảng trắng liên tiếp
            int spaceCount = 0;
            // Duyệt qua từng kí tự trong chuỗi đầu vào
            for (int i = 0; i < name.length(); i++) {
                // Lấy kí tự hiện tại
                char c = name.charAt(i);
                // Nếu kí tự là khoảng trắng
                if (c == ' ') {
                    // Tăng biến đếm lên 1
                    spaceCount++;
                    // Nếu biến đếm nhỏ hơn hoặc bằng 1
                    if (spaceCount <= 1) {
                        // Thêm kí tự vào kết quả
                        newName += c;
                    }
                    // Nếu không thì bỏ qua kí tự này
                } else {
                    // Nếu kí tự không phải là khoảng trắng
                    // Đặt lại biến đếm về 0
                    spaceCount = 0;
                    // Thêm kí tự vào kết quả
                    newName += c;
                }
            }
            sql += " AND productName like N'%" + newName.trim() + "%'";
        }
        switch (priceS) {
            case 1:
                sql += " order by [SalePrice] DESC ";
                break;
            case 2:
                sql += " order by [SalePrice] ASC";
                break;
            default:
                sql += " order by [productID] DESC";
                break;
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getString("Description"),
                        rs.getDouble("OriginPrice"),
                        rs.getDouble("SalePrice"),
                        rs.getDouble("Discount"),
                        rs.getString("ProductImg"),
                        rs.getInt("Quantity"),
                        rs.getInt("ProductStatus"),
                        rs.getInt("BrandID"),
                        rs.getInt("CategoryID"),
                        rs.getString("Cpu"),
                        rs.getString("Ram"),
                        rs.getString("Capacity"),
                        rs.getString("GraphicCard"),
                        rs.getString("Display")
                );
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;

    }

    //list theo category khi nguoi dung chon o trang index se chuyen huong den trang shop
    public List<Product> getProductByCategory(int categoryID) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [ProductID]\n"
                + "      ,[ProductName]\n"
                + "      ,[Description]\n"
                + "      ,[OriginPrice]\n"
                + "      ,[SalePrice]\n"
                + "      ,[Discount]\n"
                + "      ,[ProductImg]\n"
                + "      ,[Quantity]\n"
                + "      ,[ProductStatus]\n"
                + "      ,[BrandID]\n"
                + "      ,[CategoryID]\n"
                + "      ,[CPU]\n"
                + "      ,[RAM]\n"
                + "      ,[Capacity]\n"
                + "      ,[GraphicCard]\n"
                + "      ,[Display]\n"
                + "  FROM [dbo].[Product] where ProductStatus != 0 AND CategoryID = ? order by [productID] DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getString("Description"),
                        rs.getDouble("OriginPrice"),
                        rs.getDouble("SalePrice"),
                        rs.getDouble("Discount"),
                        rs.getString("ProductImg"),
                        rs.getInt("Quantity"),
                        rs.getInt("ProductStatus"),
                        rs.getInt("BrandID"),
                        rs.getInt("CategoryID"),
                        rs.getString("Cpu"),
                        rs.getString("Ram"),
                        rs.getString("Capacity"),
                        rs.getString("GraphicCard"),
                        rs.getString("Display")
                );
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }
//list san pham duoc filter

    public List<Product> getProductByFilter(List<Integer> categoryIDs, List<Integer> brandIDs, double minPrice, double maxPrice, int priceS) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT [ProductID]\n"
                + "      ,[ProductName]\n"
                + "      ,[Description]\n"
                + "      ,[OriginPrice]\n"
                + "      ,[SalePrice]\n"
                + "      ,[Discount]\n"
                + "      ,[ProductImg]\n"
                + "      ,[Quantity]\n"
                + "      ,[ProductStatus]\n"
                + "      ,[BrandID]\n"
                + "      ,[CategoryID]\n"
                + "      ,[CPU]\n"
                + "      ,[RAM]\n"
                + "      ,[Capacity]\n"
                + "      ,[GraphicCard]\n"
                + "      ,[Display]\n"
                + "  FROM [dbo].[Product] WHERE ProductStatus != 0 ";

        if (!categoryIDs.isEmpty()) {
            String categoryIDString = getCategoryIDsAsString(categoryIDs);
            sql += " AND CategoryID IN (" + categoryIDString + ")";
        }

        if (!brandIDs.isEmpty()) {
            String brandIDString = getBrandIDsAsString(brandIDs);
            sql += " AND BrandID IN (" + brandIDString + ")";
        }
        sql += " AND SalePrice >= " + minPrice;

        if (maxPrice != 0) {
            sql += " AND SalePrice <= " + maxPrice;
        }
        switch (priceS) {
            case 1:
                sql += " order by SalePrice DESC ";
                break;
            case 2:
                sql += " order by SalePrice ASC";
                break;
            default:
                sql += " order by [productID] DESC";
                break;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getString("Description"),
                        rs.getDouble("OriginPrice"),
                        rs.getDouble("SalePrice"),
                        rs.getDouble("Discount"),
                        rs.getString("ProductImg"),
                        rs.getInt("Quantity"),
                        rs.getInt("ProductStatus"),
                        rs.getInt("BrandID"),
                        rs.getInt("CategoryID"),
                        rs.getString("Cpu"),
                        rs.getString("Ram"),
                        rs.getString("Capacity"),
                        rs.getString("GraphicCard"),
                        rs.getString("Display")
                );
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

// convert chuoi categoryIDs thanh List
    private String getCategoryIDsAsString(List<Integer> categoryIDs) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < categoryIDs.size(); i++) {
            if (i > 0) {
                sb.append(", ");
            }
            sb.append(categoryIDs.get(i));
        }
        return sb.toString();
    }

// convert chuoi supplierIDs thanh List
    private String getBrandIDsAsString(List<Integer> supplierIDs) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < supplierIDs.size(); i++) {
            if (i > 0) {
                sb.append(", ");
            }
            sb.append(supplierIDs.get(i));
        }
        return sb.toString();
    }

    public void insertProduct(Product p) {
        String sql = "INSERT INTO [dbo].[Product]\n"
                + "           ([ProductName]\n"
                + "           ,[Description]\n"
                + "           ,[OriginPrice]\n"
                + "           ,[SalePrice]\n"
                + "           ,[Discount]\n"
                + "           ,[ProductImg]\n"
                + "           ,[Quantity]\n"
                + "           ,[ProductStatus]\n"
                + "           ,[BrandID]\n"
                + "           ,[CategoryID]\n"
                + "           ,[CPU]\n"
                + "           ,[RAM]\n"
                + "           ,[Capacity]\n"
                + "           ,[GraphicCard]\n"
                + "           ,[Display])\n"
                + "     VALUES"
                + "           (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, p.getProductName());
            st.setString(2, p.getDescription());
            st.setDouble(3, p.getOriginPrice());
            st.setDouble(4, p.getSalePrice()); // Assuming you have a method to calculate the sale price
            st.setDouble(5, p.getDiscount());
            st.setString(6, p.getProductImg());
            st.setInt(7, p.getQuantity());
            st.setInt(8, p.getProductStatus());
            st.setInt(9, p.getBrandID());
            st.setInt(10, p.getCategoryID());
            st.setString(11, p.getCpu());
            st.setString(12, p.getRam());
            st.setString(13, p.getCapacity());
            st.setString(14, p.getGraphicCard());
            st.setString(15, p.getDisplay());

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateProduct(Product p) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [ProductName] =?\n"
                + "      ,[Description] = ?\n"
                + "      ,[OriginPrice] = ?\n"
                + "      ,[SalePrice] = ?\n"
                + "      ,[Discount] = ?\n"
                + "      ,[ProductImg] = ?\n"
                + "      ,[Quantity] = ?\n"
                + "      ,[ProductStatus] = ?\n"
                + "      ,[BrandID] = ?\n"
                + "      ,[CategoryID] = ?\n"
                + "      ,[CPU] = ?\n"
                + "      ,[RAM] = ?\n"
                + "      ,[Capacity] = ?\n"
                + "      ,[GraphicCard] = ?\n"
                + "      ,[Display] =?\n"
                + " WHERE productID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, p.getProductName());
            st.setString(2, p.getDescription());
            st.setDouble(3, p.getOriginPrice());
            st.setDouble(4, p.getSalePrice()); // Assuming you have a method to calculate the sale price
            st.setDouble(5, p.getDiscount());
            st.setString(6, p.getProductImg());
            st.setInt(7, p.getQuantity());
            st.setInt(8, p.getProductStatus());
            st.setInt(9, p.getBrandID());
            st.setInt(10, p.getCategoryID());
            st.setString(11, p.getCpu());
            st.setString(12, p.getRam());
            st.setString(13, p.getCapacity());
            st.setString(14, p.getGraphicCard());
            st.setString(15, p.getDisplay());
            st.setInt(16, p.getProductID());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

//    public static void main(String[] args) {
//        ProductDAO dao = new ProductDAO();
//
//        // Tạo danh sách categoryIDs và brandIDs
//        List<Integer> categoryIDs = Arrays.asList(1, 2, 3);
//        List<Integer> brandIDs = Arrays.asList(1, 2);
//
//        // Gọi hàm getProductByFilter với các tham số đã tạo
//        List<Product> c = dao.getProductByFilter(categoryIDs, brandIDs, 10000, 10000000, 0);
//
//        // In ra thông tin sản phẩm
//        for (Product product : c) {
//            System.out.println(product.getProductName());
//        }
//    }
    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();

        // Gọi hàm getProductByFilter với các tham số đã tạo
        Product c = dao.getProductByID(28);

        // In ra thông tin sản phẩm

        System.out.println(Long.parseLong(String.format("%.0f",c.getSalePrice())));
        System.out.println(c.getSalePrice());
        System.out.println(Long.parseLong(String.format("%.0f",c.getOriginPrice())));

    }

}
