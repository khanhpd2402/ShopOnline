/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.User;

/**
 *
 * @author duykh
 */
@WebServlet(name = "InfoUserServlet", urlPatterns = {"/infouser"})
public class InfoUserServlet extends HttpServlet {

    private UserDAO udb = new UserDAO();

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
            out.println("<title>Servlet InfoUserServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InfoUserServlet at " + "" + "</h1>");
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
        // Lấy HttpSession từ request để kiểm tra xem người dùng đã đăng nhập hay chưa
        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("userinfo");
        // lấy thông tin người dùng từ database
        User u = udb.getAnUser(us.getUsername());
        request.setAttribute("anuser", u);
        request.getRequestDispatcher("InformationUser.jsp").forward(request, response);
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
        User us = (User) session.getAttribute("userinfo");
        String changepass = request.getParameter("changepass");

        //doi mat khau
        if (changepass != null) {
            // Lấy giá trị từ form
            String oldPass = request.getParameter("oldpass");
            String newPass = request.getParameter("newpass");
            String email = request.getParameter("email");
            String uname = request.getParameter("uname");
            try {
                // Kiểm tra mật khẩu cũ của người dùng
                if (udb.checkUserToLogin(uname, oldPass)) {
                    // Nếu mật khẩu cũ đúng, cập nhật mật khẩu mới
                    udb.updatePass(email, newPass);
                    request.setAttribute("existModal", "existModal");
                    request.setAttribute("mess", "Đổi mật khẩu thành công, vui lòng đăng nhập lại!");
                    // Xóa thông tin người dùng khỏi session để yêu cầu đăng nhập lại
                    session.removeAttribute("userinfo");
                    request.getRequestDispatcher("InformationUser.jsp").forward(request, response);
                } else {
                    // Nếu mật khẩu cũ không đúng, đặt thuộc tính "errorUpdatePass" để hiển thị thông báo lỗi
                    request.setAttribute("errorUpdatePass", "Mật Khẩu cũ không đúng!");
                    request.setAttribute("anuser", us);
                    request.getRequestDispatcher("InformationUser.jsp").forward(request, response);
                }
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(InfoUserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            //doi thong tin ca nhan nguoi dung
            // Lấy giá trị từ form
            String uname = request.getParameter("uname");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String gender = request.getParameter("gender");

            String unameCheck = "";
            //check xem nguoi dung co thay doi userName hay khong
            if (!us.getUsername().equals(uname)) {
                unameCheck = uname;
            }
            // Kiểm tra xem tên đăng nhập mới đã tồn tại chưa
            User u = udb.getAnUser(unameCheck);
            if ((u != null)) {
                if (u.getUsername().equalsIgnoreCase(uname) && (u.getUserID() != us.getUserID())) {
                    // Nếu tên đăng nhập mới đã tồn tại, đặt thuộc tính "errorusername" để hiển thị thông báo lỗi
                    request.setAttribute("errorusername", "Tên đăng nhập đã tồn tại!");
                }
                request.setAttribute("anuser", us);
                request.getRequestDispatcher("InformationUser.jsp").forward(request, response);
            } else {
                if (gender.equals("male")) {
                    User uNew = new User(us.getUserID(), uname, fname, lname, true);
                    //cap nhat thong tin ng dung
                    udb.updateUser(uNew);
                    // Xóa thông tin người dùng khỏi session để yêu cầu đăng nhập lại
                    session.removeAttribute("userinfo");
                    request.setAttribute("existModal", "existModal");
                    request.setAttribute("mess", "Đổi thông tin cá nhân thành công, vui lòng đăng nhập lại!");
                } else if (gender.equals("female")) {
                    User uNew = new User(us.getUserID(), uname, fname, lname, false);
                    udb.updateUser(uNew);
                    // Xóa thông tin người dùng khỏi session để yêu cầu đăng nhập lại
                    session.removeAttribute("userinfo");
                    request.setAttribute("existModal", "existModal");
                    request.setAttribute("mess", "Đổi thông tin cá nhân thành công, vui lòng đăng nhập lại!");
                }
                request.getRequestDispatcher("InformationUser.jsp").forward(request, response);
            }
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
