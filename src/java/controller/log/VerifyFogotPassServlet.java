/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.log;

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

@WebServlet(name = "VerifyFogotPassServlet", urlPatterns = {"/verifyfogotpass"})
public class VerifyFogotPassServlet extends HttpServlet {

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
            out.println("<title>Servlet VerifyCodeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifyCodeServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("VerifyForgotPassword.jsp").forward(request, response);
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
        String userCode = request.getParameter("verificationCode");

        // Lấy mã xác nhận từ session
        HttpSession session = request.getSession();
        String verificationCode = (String) session.getAttribute("verificationCode");

        // Lấy số lần nhập sai từ session hoặc khởi tạo nếu chưa có
        Integer incorrectAttempts = (Integer) session.getAttribute("incorrectAttempts");
        if (incorrectAttempts == null) {
            incorrectAttempts = 0;
        }

        if (verificationCode != null && verificationCode.equals(userCode)) {
            // Mã xác nhận hợp lệ
            session.removeAttribute("verificationCode"); // Xóa mã xác nhận khỏi session
            session.removeAttribute("incorrectAttempts"); // Xóa số lần nhập sai khỏi session
            session.setAttribute("acp", "acp");
            // Chuyển hướng đến trang đặt lại mật khẩu
            response.sendRedirect("resetpass");
        } else {
            // Mã xác nhận không hợp lệ
            incorrectAttempts++;
            session.setAttribute("incorrectAttempts", incorrectAttempts);

            if (incorrectAttempts > 5) {
                session.removeAttribute("verificationCode"); // Xóa mã xác nhận khỏi session
                session.removeAttribute("incorrectAttempts"); // Xóa số lần nhập sai khỏi session

                // Chuyển hướng đến trang thông báo với thông báo lỗi
                request.setAttribute("title", "Xác nhận Thất Bại!");
                request.setAttribute("messRegister", "Rất tiếc, nhưng chúng tôi đã nhận thấy rằng bạn đã nhập sai mã xác nhận quá 5 lần hoặc mã xác nhận đã quá thời gian 5 phút. Vui lòng quay lại trang đăng nhập để thử lại. Shop online thành thật xin lỗi vì sự bất tiện này!");
                request.getRequestDispatcher("NotifiCationpage.jsp").forward(request, response);
            } else {
                // Chuyển hướng đến trang xác nhận lại mã với thông báo lỗi
                request.setAttribute("error", "Mã xác nhận không hợp lệ");
                request.getRequestDispatcher("VerifyForgotPassword.jsp").forward(request, response);
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
