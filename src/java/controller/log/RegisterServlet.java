/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.log;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import controller.SendMail;
import dao.UserContactDAO;
import java.util.List;
import model.UserContact;

/**
 *
 * @author Namlv
 */
public class RegisterServlet extends HttpServlet {

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
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("Register.jsp").forward(request, response);
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
        SendMail sendMail = new SendMail();
        // Lấy giá trị từ form
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email").trim();
        String phone = request.getParameter("phone").trim();
        String address = request.getParameter("address");
        UserDAO udb = new UserDAO();
        UserContactDAO ucdb = new UserContactDAO();

        HttpSession session = request.getSession();
        User u = udb.getAnUser(username);
        UserContact userContact = ucdb.getExistContact(email, phone);
        if (u != null || userContact != null) {
            if (u != null) {
                if (u.getUsername().equals(username)) {
                    request.setAttribute("errorusername", "Tên đăng nhập đã tồn tại!");
                }
            }
            if (userContact != null) {
                if (userContact.getEmail().equals(email)) {
                    request.setAttribute("erroremail", "Email đã được sử dụng!");
                }
                if (userContact.getPhone().equals(phone)) {
                    request.setAttribute("errorphone", " Số điện thoại đã được sử dụng!");
                }
            }

            request.getRequestDispatcher("Register.jsp").forward(request, response);
        } else {
            if (gender.equals("male")) {
                User uNew = new User(username, password, firstname, lastname, true, email, phone, address, 1);
                session.setAttribute("insertuser", uNew);
                String verificationCode = sendMail.generateVerificationCode();

                // Lưu mã xác nhận vào session
                session.setAttribute("verification", verificationCode);
                session.setMaxInactiveInterval(300);

                // Gửi email chứa mã xác nhận đến người dùng
                sendMail.sendConfirmationEmail(email, verificationCode);
                response.sendRedirect("verifyregister");

            } else if (gender.equals("female")) {
                User uNew = new User(username, password, firstname, lastname, false, email, phone, address, 1);
                session.setAttribute("insertuser", uNew);
                String verificationCode = sendMail.generateVerificationCode();

                // Lưu mã xác nhận vào session
                session.setAttribute("verification", verificationCode);
                session.setMaxInactiveInterval(300);

                // Gửi email chứa mã xác nhận đến người dùng
                sendMail.sendConfirmationEmail(email, verificationCode);
                response.sendRedirect("verifyregister");
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
