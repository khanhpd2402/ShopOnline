/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dao.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Order;
import model.User;

/**
 *
 * @author duykh
 */
@WebServlet(name = "MyOrderServlet", urlPatterns = {"/myorder"})
public class MyOrderServlet extends HttpServlet {

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
            out.println("<title>Servlet StatisticOrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StatisticOrderServlet at " + request.getContextPath() + "</h1>");
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
        // Lấy thông tin người dùng từ session
        User u = (User) session.getAttribute("userinfo");
        OrderDAO odb = new OrderDAO();

// Lấy giá trị action từ tham số request để xác định hành động người dùng muốn thực hiện
        String action = request.getParameter("action");
        String orderID_raw = request.getParameter("orderID");

        // Kiểm tra hành động người dùng, nếu là "cancel" (hủy đơn hàng)
        if (action != null && action.equals("cancel") && orderID_raw != null) {
            try {
                // parse giá trị orderID từ String sang Integer
                int orderID = Integer.parseInt(orderID_raw);
                // Gọi phương thức updateStatusOrderUser từ OrderDAO để cập nhật trạng thái đơn hàng thành "Đã hủy"
                boolean check = odb.updateStatusOrderUser(orderID, 5, u.getUserID());
                // Kiểm tra kết quả cập nhật, nếu không thành công, thông báo lỗi
                if (!check) {
                    request.setAttribute("mess", "Đơn hàng hủy không thành công!");
                }
            } catch (NumberFormatException e) {
            }
        }
// Lấy giá trị status từ tham số request để xác định trạng thái của đơn hàng
        String status_raw = request.getParameter("status");
        try {
            int status = Integer.parseInt(status_raw);
            if (status != 5) {
                // Trường hợp mặc định: Lấy danh sách đơn hàng dựa trên trạng thái
                List<Order> list = odb.getOrderUser(status, u.getUserID());
                request.setAttribute("listOrder", list);
                request.setAttribute("status", status);
            } else {
                // Trường hợp xem đơn hàng đã bị hủy: Lấy danh sách đơn hàng hủy dựa trên trạng thái và userID
                List<Order> list = odb.getOrderUser(status, u.getUserID());
                request.setAttribute("listCancel", list);
                request.setAttribute("status", status);
            }

        } catch (NumberFormatException e) {
        }
        request.getRequestDispatcher("MyOrder.jsp").forward(request, response);
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
        processRequest(request, response);
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
