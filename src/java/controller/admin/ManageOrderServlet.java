/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Order;

/**
 *
 * @author duykh
 */
@WebServlet(name = "ManageOrderServlet", urlPatterns = {"/manageorder"})
public class ManageOrderServlet extends HttpServlet {

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
        OrderDAO odb = new OrderDAO();
// Lấy các tham số từ request để xử lý các hành động liên quan đến đơn hàng
        String action = request.getParameter("action");
        String orderID_raw = request.getParameter("orderID");
        // Kiểm tra nếu có tham số action và orderID
        if (action != null && orderID_raw != null) {
            try {
                // Chuyển đổi orderID từ String sang int
                int orderID = Integer.parseInt(orderID_raw);
                // Thực hiện các hành động tương ứng với action
                switch (action) {
                    case "cancel":
                        odb.updateStatusOrder(orderID, 5);
                        break;
                    case "accept":
                        odb.updateStatusOrder(orderID, 2);
                        break;
                    case "transport":
                        odb.updateStatusOrder(orderID, 3);
                        break;
                    case "done":
                        odb.updateStatusOrder(orderID, 4);
                        break;
                    default:
                        break;
                }
            } catch (NumberFormatException e) {
            }
        }
// Lấy trạng thái đơn hàng từ request để hiển thị danh sách theo trạng thái
        String status_raw = request.getParameter("status");
        try {
            // Chuyển đổi status từ String sang int
            int status = Integer.parseInt(status_raw);
            // Hiển thị danh sách đơn hàng tương ứng với trạng thái
            switch (status) {
                case 1: {
                    List<Order> list = odb.getOrder(status);
                    request.setAttribute("listConfirmationWaiting", list);
                    break;
                }
                case 2: {
                    List<Order> list = odb.getOrder(status);
                    request.setAttribute("listPrepare", list);
                    break;
                }
                case 3: {
                    List<Order> list = odb.getOrder(status);
                    request.setAttribute("listShipping", list);
                    break;
                }
                case 4: {
                    List<Order> list = odb.getOrder(status);
                    request.setAttribute("listComplete", list);
                    break;
                }
                case 5: {
                    List<Order> list = odb.getOrder(status);
                    request.setAttribute("listCanceled", list);
                    break;
                }
                default:
                    break;
            }
        } catch (NumberFormatException e) {
        }


        request.getRequestDispatcher("ManagerOrder.jsp").forward(request, response);
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
