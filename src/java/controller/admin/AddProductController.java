/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.BrandDAO;
import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.List;
import model.Brand;
import model.Category;
import model.Product;

/**
 *
 * @author khanh
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)

@WebServlet(name = "AddProductController", urlPatterns = {"/addproduct"})
public class AddProductController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProductController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDAO cdb = new CategoryDAO();
        BrandDAO sdb = new BrandDAO();
        List<Category> listAllc = cdb.getAllCategory();
        request.setAttribute("datac", listAllc);
        List<Brand> listAllb = sdb.getAllBrandToSearch();
        request.setAttribute("datab", listAllb);
        request.getRequestDispatcher("AddProduct.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO pd = new ProductDAO();

        // Lấy giá trị của tham số ProductName từ form
        String ProductName = request.getParameter("productName").trim();
        String ram = request.getParameter("ram").trim();
        String cpu = request.getParameter("cpu").trim();
        String capacity = request.getParameter("capacity").trim();
        String graphic = request.getParameter("graphic").trim();
        String display = request.getParameter("display").trim();
        String quantity_raw = request.getParameter("quantity").trim();
        String discount_raw = request.getParameter("discount").trim();
        String productStatus_raw = request.getParameter("productStatus").trim();
        String strOriginPrice = request.getParameter("OriginPrice").trim().replace(",", "");
        String strSalePrice = request.getParameter("SalePrice").trim().replace(",", "");
        String brandID = request.getParameter("BrandID").trim();
        String categoryID = request.getParameter("CategoryID").trim();
        String describe = request.getParameter("describe").trim();

        int brandId = Integer.parseInt(brandID);
        int categoryId = Integer.parseInt(categoryID);
        int quantity = Integer.parseInt(quantity_raw);
        int productStatus = Integer.parseInt(productStatus_raw);
        double discount = 0;
        if (discount_raw != null) {
            discount = Double.parseDouble(discount_raw);
        }
        double originPrice = Float.parseFloat(strOriginPrice);
        double salePrice = Float.parseFloat(strSalePrice);

        // Lấy đối tượng Part theo tên của input kiểu file
        String img;
        if (request.getPart("image") == null) {
            img = "NULL";
        } else {
            Part imagePart = request.getPart("image");
            // Lấy tên của file ảnh
            String fileName = imagePart.getSubmittedFileName();
            // Tạo một đường dẫn tuyệt đối của file ảnh trên server
            String savePath = "D:\\Semester_5\\SWP391\\g5-swp391-hungBranch\\web\\images"; // Giả sử có một thư mục images trên server
            String filePath = savePath + File.separator + fileName;
            // Kiểm tra xem thư mục images có tồn tại hay không và tạo nếu cần
            File saveDir = new File(savePath);
            if (!saveDir.exists()) {
                saveDir.mkdir();
            }
            // Lưu file ảnh vào thư mục images trên server
            imagePart.write(filePath);
            img = "images/" + fileName;
        }
        Product p = new Product(ProductName, describe, originPrice, salePrice, discount, img, quantity, productStatus, brandId, categoryId, cpu, ram, capacity, graphic, display);
        pd.insertProduct(p);
        response.sendRedirect("productmanage");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
