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
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("userinfo");
        OrderDAO odb = new OrderDAO();

        String action = request.getParameter("action");
        String orderID_raw = request.getParameter("orderID");
        if (u != null) {
            // nguoi dung huy dat hang
            if (action != null && action.equals("cancel") && orderID_raw != null) {
                try {
                    int orderID = Integer.parseInt(orderID_raw);
                    boolean check = odb.updateStatusOrderUser(orderID, 5, u.getUserID());
                    if (!check) {
                        request.setAttribute("mess", "Đơn hàng hủy không thành công!");
                    }
                } catch (NumberFormatException e) {
                }
            }

            String status_raw = request.getParameter("status");
            try {
                int status = Integer.parseInt(status_raw);
                if (status != 5) {
                    // Trường hợp mặc định
                    List<Order> list = odb.getOrder(status);
                    request.setAttribute("listOrder", list);
                    request.setAttribute("status", status);
                } else {
                    // Trường hợp xem don hàng bi huy
                    List<Order> list = odb.getOrderUser(status, u.getUserID());
                    request.setAttribute("listCancel", list);
                    request.setAttribute("status", status);

                }

            } catch (NumberFormatException e) {
            }
            request.getRequestDispatcher("myorder.jsp").forward(request, response);
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
