/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author khanh
 */
@WebServlet(name = "ProductManageController", urlPatterns = {"/productmanage"})
public class ProductManageController extends HttpServlet {

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
            out.println("<title>Servlet ProductManageController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductManageController at " + request.getContextPath() + "</h1>");
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
        ProductDAO pdb = new ProductDAO();
        CategoryDAO cdb = new CategoryDAO();
        String categoryIdRaw = request.getParameter("cid");
        //get all product
        List<Product> listAllProduct = pdb.getAllProduct(0);
        request.setAttribute("dataAll", listAllProduct);

        //get all category
        List<Category> listAllCategory = cdb.getAllCategory();
        request.setAttribute("dataAllCategory", listAllCategory);

       
        if (categoryIdRaw != null) {
            int categoryId = Integer.parseInt(categoryIdRaw);
             //get all product by category
            List<Product> listProductByCategory = pdb.getProductByCategory(categoryId);
             //get category name
            String cateforyName = cdb.getCategoryName(categoryId);
            request.setAttribute("dataProductByCategory", listProductByCategory);
            request.setAttribute("dataCategoryName", cateforyName);
        }
        request.getRequestDispatcher("ManagerProduct.jsp").forward(request, response);
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
        ProductDAO pdb = new ProductDAO();
        CategoryDAO cdb = new CategoryDAO();
        //get all category
        List<Category> listAllCategory = cdb.getAllCategory();
        request.setAttribute("dataAllCategory", listAllCategory);
        //get product by search name
        String searchname = request.getParameter("search").trim();
        List<Product> listSearch = pdb.searchProductByName(searchname, 0);
        if (listSearch.isEmpty()) {
            request.setAttribute("notfound", "The product you requested could not be found!");
        }
        request.setAttribute("listSearch", listSearch);
        request.getRequestDispatcher("ManagerProduct.jsp").forward(request, response);
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
