/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.log;

import controller.SendMail;
import dao.UserContactDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author duykh
 */
@WebServlet(name = "ForgotPassServlet", urlPatterns = {"/forgotpass"})
public class ForgotPassServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

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
            out.println("<title>Servlet SendMailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendMailServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("ForgotPass.jsp").forward(request, response);
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
        String email = request.getParameter("email");
        UserContactDAO ucdb = new UserContactDAO();

        // Kiểm tra email trong cơ sở dữ liệu để tìm thông tin người dùng
        // Nếu tìm thấy, gửi email xác nhận
        if (ucdb.getAnEmail(email) != null) {
            String verificationCode = sendMail.generateVerificationCode();

            // Lưu mã xác nhận vào session
            HttpSession session = request.getSession();
            session.setAttribute("verificationCode", verificationCode);
            // Lưu email vào session
            session.setAttribute("email", email);
            session.setMaxInactiveInterval(300);

            // Gửi email chứa mã xác nhận đến người dùng
            sendMail.sendConfirmationEmail(email, verificationCode);
            response.sendRedirect("verifyfogotpass");
        } else {
            request.setAttribute("notfound", "Tìm kiếm không trả về kết quả nào. Vui lòng thử lại với thông tin khác.");
            request.getRequestDispatcher("ForgotPass.jsp").forward(request, response);
        }

        // Chuyển hướng người dùng đến trang xác nhận
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
