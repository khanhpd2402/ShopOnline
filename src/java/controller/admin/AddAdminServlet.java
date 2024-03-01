///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//package controller.admin;
//
//import dal.EmployeeDAO;
//import java.io.IOException;
//import java.io.PrintWriter;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import java.security.NoSuchAlgorithmException;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//import model.Employee;
//
///**
// *
// * @author efdf
// */
//@WebServlet(name = "AddAdminServlet", urlPatterns = {"/addadmin"})
//public class AddAdminServlet extends HttpServlet {
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        String employeeName = request.getParameter("employeeName");
//        String firstName = request.getParameter("firstName");
//        String lastName = request.getParameter("lastName");
//        String password = request.getParameter("password");
//        String email = request.getParameter("email");
//        String phoneNumber = request.getParameter("phoneNumber");
//        String address = request.getParameter("address");
//        String role_raw = request.getParameter("role");
//        try ( PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet AddAdminServlet</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet AddAdminServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        Employee u = (Employee) session.getAttribute("employeeinfo");
//        if (u != null) {
//            request.getRequestDispatcher("addadmin.jsp").forward(request, response);
//        } else {
//            response.sendRedirect("404.html");
//        }
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        EmployeeDAO edb = new EmployeeDAO();
//        String employeeName = request.getParameter("employeeName");
//        String firstName = request.getParameter("firstName");
//        String lastName = request.getParameter("lastName");
//        String password = request.getParameter("password");
//        String email = request.getParameter("email");
//        String phoneNumber = request.getParameter("phoneNumber");
//        String address = request.getParameter("address");
//        String role_raw = request.getParameter("role");
//        try {
//            Employee em = edb.getAnEmployee(employeeName, email, phoneNumber);
//            if (em != null) {
//                if (em.getEmployeename().equalsIgnoreCase(employeeName)) {
//                    request.setAttribute("erroremployeename", "Tên đăng nhập đã tồn tại!");
//                }
//                if (em.getEmail().equalsIgnoreCase(email)) {
//                    request.setAttribute("erroremail", "Email đã được sử dụng!");
//                }
//                if (em.getPhoneNumber().equals(phoneNumber)) {
//                    request.setAttribute("errorphone", " Số điện thoại đã được sử dụng!");
//                }
//            } else {
//                int role = Integer.parseInt(role_raw);
//                Employee e = new Employee(0, role, employeeName, password, firstName, lastName, email, phoneNumber, address);
//                edb.insertEmployee(e);
//                request.setAttribute("mess", "Add an admin successfully");
//            }
//        } catch (NumberFormatException e) {
//        } catch (NoSuchAlgorithmException ex) {
//            Logger.getLogger(AddAdminServlet.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        request.getRequestDispatcher("addadmin.jsp").forward(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
