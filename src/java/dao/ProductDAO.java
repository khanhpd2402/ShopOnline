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
// Phương thức lấy danh sách 8 sản phẩm mới nhất
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
// Phương thức này trả về danh sách tất cả sản phẩm theo mức giá và sắp xếp
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
        // Xử lý sắp xếp theo giá
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
// Phương thức này trả về một sản phẩm theo ID
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
            // Nếu có kết quả, tạo đối tượng Product và trả về
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
// Trả về null nếu không tìm thấy sản phẩm
        return null;
    }

// Phương thức này tìm kiếm sản phẩm theo tên và sắp xếp theo giá
    public List<Product> searchProductByName(String name, int priceS) {
        List<Product> list = new ArrayList<>();
        // Câu lệnh SQL để tìm kiếm theo tên và sắp xếp
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
        // Xử lý tìm kiếm theo tên
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
        // Xử lý sắp xếp theo giá
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

    //Phương thức này lấy danh sách sản phẩm dựa trên categoryID
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
    
//lấy danh sách sản phẩm dựa trên filter
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
// Xử lý điều kiện lọc theo categoryIDs
        if (!categoryIDs.isEmpty()) {
            String categoryIDString = getCategoryIDsAsString(categoryIDs);
            sql += " AND CategoryID IN (" + categoryIDString + ")";
        }
// Xử lý điều kiện lọc theo brandIDs
        if (!brandIDs.isEmpty()) {
            String brandIDString = getBrandIDsAsString(brandIDs);
            sql += " AND BrandID IN (" + brandIDString + ")";
        }
        // Xử lý điều kiện lọc theo minPrice
        sql += " AND SalePrice >= " + minPrice;
// Xử lý điều kiện lọc theo maxPrice
        if (maxPrice != 0) {
            sql += " AND SalePrice <= " + maxPrice;
        }
        // Xử lý điều kiện sắp xếp theo priceS
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
// Phương thức chèn một đối tượng Product mới vào cơ sở dữ liệu
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
            st.setDouble(4, p.getSalePrice()); 
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
// Phương thức cập nhật thông tin sản phẩm trong cơ sở dữ liệu
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
            st.setDouble(4, p.getSalePrice()); 
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
