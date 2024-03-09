package controller.log;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author duykh
 */
@WebServlet(urlPatterns = {"/verifyregister"})
public class VerifyRegisterServlet extends HttpServlet {

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
            out.println("<title>Servlet VerifySignUpServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifySignUpServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("VerifyRegister.jsp").forward(request, response);
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
        String userCode = request.getParameter("verification");
        UserDAO udb = new UserDAO();
        // Lấy mã xác nhận từ session
        HttpSession session = request.getSession();
        String verificationCode = (String) session.getAttribute("verification");
        User uNew = (User) session.getAttribute("insertuser");
        // Lấy số lần nhập sai từ session hoặc khởi tạo nếu chưa có
        Integer incorrectAttempts = (Integer) session.getAttribute("incorrectAttempt");
        if (incorrectAttempts == null) {
            incorrectAttempts = 0;
        }
        if (verificationCode != null && verificationCode.equals(userCode)) {
            // Mã xác nhận hợp lệ
            session.removeAttribute("verification"); // Xóa mã xác nhận khỏi session
            session.removeAttribute("incorrectAttempt"); // Xóa số lần nhập sai khỏi session
            try {
                try {
                    udb.insertUser(
                            uNew.getUsername(), uNew.getPassword(), uNew.getFirstName(), uNew.getLastName(),
                            uNew.isGender(), uNew.getEmail(), uNew.getPhone(), uNew.getAddress(), 1);
                } catch (SQLException ex) {
                    Logger.getLogger(VerifyRegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                session.removeAttribute("insertuser");
                request.setAttribute("title", "Đăng Kí Tài Khoản Thành Công!");
                request.setAttribute("messRegister", "Chúc bạn có những trải nghiệm mua sắm tuyệt vời cùng Shop Online. Vui lòng đăng nhập để tiếp tục.");
                request.getRequestDispatcher("NotifiCationpage.jsp").forward(request, response);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(VerifyRegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            // Mã xác nhận không hợp lệ
            incorrectAttempts++;
            session.setAttribute("incorrectAttempt", incorrectAttempts);
            //nhap sai qua 5 lan
            if (incorrectAttempts > 5) {
                session.removeAttribute("verification"); // Xóa mã xác nhận khỏi session
                session.removeAttribute("insertuser");//xoa thong tin dang ki cua user khoi session
                session.removeAttribute("incorrectAttempt"); // Xóa số lần nhập sai khỏi session
                request.setAttribute("title", "Đăng Kí Thất Bại!");
                request.setAttribute("messRegister", "Rất tiếc, nhưng chúng tôi đã nhận thấy rằng bạn đã nhập sai mã xác nhận quá 5 lần hoặc mã xác nhận đã quá thời gian 5 phút. Vui lòng quay lại trang đăng nhập để thử lại. Shop online thành thật xin lỗi vì sự bất tiện này!");
                request.getRequestDispatcher("NotifiCationpage.jsp").forward(request, response);
            } else {
                // Chuyển hướng đến trang xác nhận lại mã với thông báo lỗi
                request.setAttribute("error", "Mã xác nhận không hợp lệ");
                request.getRequestDispatcher("VerifyRegister.jsp").forward(request, response);
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
