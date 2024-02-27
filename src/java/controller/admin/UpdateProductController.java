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
@WebServlet(name = "UpdateProductController", urlPatterns = {"/updateproduct"})
public class UpdateProductController extends HttpServlet {

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
            Part imagePart = request.getPart("image");
            // Lấy tên của file ảnh
            String fileName = imagePart.getSubmittedFileName();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateProductController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProductController at " + imagePart + " - (" + fileName.trim() + ")</h1>");
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
        ProductDAO pd = new ProductDAO();
        CategoryDAO cdb = new CategoryDAO();
        BrandDAO sdb = new BrandDAO();

        String productID = request.getParameter("productID");
        if (productID != null) {
            int productId = Integer.parseInt(productID);
            Product p = pd.getProductByID(productId);
            request.setAttribute("datap", p);
        }
        List<Category> listAllc = cdb.getAllCategory();
        request.setAttribute("datac", listAllc);
        List<Brand> listAllb = sdb.getAllBrandToSearch();
        request.setAttribute("datab", listAllb);
        request.getRequestDispatcher("UpdateProduct.jsp").forward(request, response);

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
        String productID = request.getParameter("productID").trim();
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

        int productId = Integer.parseInt(productID);
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

        String img;
        Product product = pd.getProductByID(productId);
        Part imagePart = request.getPart("image");
        // Lấy tên của file ảnh
        String fileName = imagePart.getSubmittedFileName();
        if (fileName.trim() == null || fileName.trim().length() == 0) {
            img = product.getProductImg();
        } else {
            // Tạo một đường dẫn tuyệt đối của file ảnh trên server
            String savePath = "D:\\Semester_5\\SWP391\\g5-swp391-hungBranch\\web\\images"; // Giả sử có một thư mục images trên máy cua minh
            String filePath = savePath + File.separator + fileName;
            // Kiểm tra xem thư mục images có tồn tại hay không và tạo nếu cần
            File saveDir = new File(savePath);
            if (!saveDir.exists()) {
                saveDir.mkdir();
            }
            imagePart.write(filePath);
            // Lưu file ảnh vào thư mục images trên server
            img = "images/" + fileName;
        }
        Product p = new Product(productId, ProductName, describe, originPrice, salePrice, discount, img, quantity, productStatus, brandId, categoryId, cpu, ram, capacity, graphic, display);
        pd.updateProduct(p);
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
