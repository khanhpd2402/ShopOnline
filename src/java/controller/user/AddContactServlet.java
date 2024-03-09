/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dao.UserDAO;
import dao.UserContactDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.User;
import model.UserContact;

/**
 *
 * @author khanh
 */
@WebServlet(name = "AddContactServlet", urlPatterns = {"/addcontact"})
public class AddContactServlet extends HttpServlet {

    private UserDAO udb = new UserDAO();
    private UserContactDAO ucdb = new UserContactDAO();

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
            out.println("<title>Servlet AddContactServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddContactServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("AddContact.jsp").forward(request, response);
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
        // Lấy HttpSession từ request để kiểm tra xem người dùng đã đăng nhập hay chưa
        HttpSession session = request.getSession();
// Lấy giá trị từ form
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
// Lấy thông tin người dùng từ session
        User u = (User) session.getAttribute("userinfo");
        // Lấy danh sách tất cả các liên hệ của người dùng từ cơ sở dữ liệu
        List<UserContact> listContactsUser = ucdb.getAllContactAnUser(0);
        // Biến kiểm tra để đảm bảo rằng email và số điện thoại không bị trùng lặp
        boolean check = true;
        // Duyệt qua danh sách liên hệ để kiểm tra trùng lặp
        for (UserContact userContact : listContactsUser) {
            if (userContact.getEmail().equalsIgnoreCase(email)) {
                // Nếu email đã được sử dụng, đặt thuộc tính "erroremail" để hiển thị thông báo lỗi
                request.setAttribute("erroremail", "Email đã được sử dụng!");
                check = false;
            }
            if (userContact.getPhone().equals(phone)) {
                // Nếu số điện thoại đã được sử dụng, đặt thuộc tính "errorphone" để hiển thị thông báo lỗi
                request.setAttribute("errorphone", "Số điện thoại đã được sử dụng!");
                check = false;
            }
        }
        if (check) {
            ucdb.insertUserContact(u.getUserID(), email, phone, address);
            // Nếu không có trùng lặp, thêm liên hệ mới vào cơ sở dữ liệu và chuyển hướng đến trang "allcontacts"
            response.sendRedirect("allcontacts");
        } else {
            request.getRequestDispatcher("AddContact.jsp").forward(request, response);
        }
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
