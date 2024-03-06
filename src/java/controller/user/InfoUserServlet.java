/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import controller.SendMail;
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
        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("userinfo");
        if (us != null) {
            User u = udb.getAnUser(us.getUsername());
            request.setAttribute("anuser", u);
            request.getRequestDispatcher("infouser.jsp").forward(request, response);
        } else {
            response.sendRedirect("login");
        }
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
        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("userinfo");
        String changepass = request.getParameter("changepass");
        if (us != null) {
            //doi mat khau
            if (changepass != null) {
                String oldPass = request.getParameter("oldpass");
                String newPass = request.getParameter("newpass");
                String email = request.getParameter("email");
                String uname = request.getParameter("uname");
                try {
                    if (udb.checkUserToLogin(uname, oldPass)) {
                        udb.updatePass(email, newPass);
                        request.setAttribute("existModal", "existModal");
                        request.setAttribute("mess", "Đổi mật khẩu thành công, vui lòng đăng nhập lại!");
                        session.removeAttribute("userinfo");
                        request.getRequestDispatcher("infouser.jsp").forward(request, response);
                    } else {
                        request.setAttribute("errorUpdatePass", "Mật Khẩu cũ không đúng!");
                        request.setAttribute("anuser", us);
                        request.getRequestDispatcher("infouser.jsp").forward(request, response);
                    }
                } catch (NoSuchAlgorithmException ex) {
                    Logger.getLogger(InfoUserServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                //doi thong tin ca nhan nguoi dung
                SendMail sendMail = new SendMail();
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
                User u = udb.getAnUser(unameCheck);
                if ((u != null)) {
                    if (u.getUsername().equalsIgnoreCase(uname) && (u.getUserID() != us.getUserID())) {
                        request.setAttribute("errorusername", "Tên đăng nhập đã tồn tại!");
                    }
                    request.setAttribute("anuser", us);
                    request.getRequestDispatcher("infouser.jsp").forward(request, response);
                } else {
                    if (gender.equals("male")) {
                        User uNew = new User(us.getUserID(), uname, fname, lname, true);
                        udb.updateUser(uNew);
                        request.setAttribute("existModal", "existModal");
                        request.setAttribute("mess", "Đổi thông tin cá nhân thành công, vui lòng đăng nhập lại!");
                    } else if (gender.equals("female")) {
                        User uNew = new User(us.getUserID(), uname, fname, lname, false);
                        udb.updateUser(uNew);
                        request.setAttribute("existModal", "existModal");
                        request.setAttribute("mess", "Đổi thông tin cá nhân thành công, vui lòng đăng nhập lại!");
                    }
                    request.getRequestDispatcher("infouser.jsp").forward(request, response);
                }
            }
        } else {
            response.sendRedirect("login");
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
