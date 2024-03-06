/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.log;

import dao.AdminDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Admin;
import model.User;

/**
 *
 * @author M S I
 */
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("Login.jsp").forward(request, response);
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
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        String role = request.getParameter("role");
        String rem = request.getParameter("rem");
        
        
        Cookie cuser = new Cookie("cuser", username);
        Cookie cpass = new Cookie("cpass", pass);
        Cookie crem = new Cookie("crem", rem);
        if (rem != null) {
            cuser.setMaxAge(60 * 60 * 24 * 30);//1 thang
            cpass.setMaxAge(60 * 60 * 24 * 30);
            crem.setMaxAge(60 * 60 * 24 * 30);
        } else {
            cuser.setMaxAge(0);//0 luu tru
            cpass.setMaxAge(0);
            crem.setMaxAge(0);
        }
        //luu vao browser
        response.addCookie(cuser);
        response.addCookie(cpass);
        response.addCookie(crem);
        UserDAO ud = new UserDAO();
        AdminDAO ad = new AdminDAO();
        try {
            if (ud.checkUserToLogin(username, pass) && role.equals("u")) {
                User u = ud.getAnUser(username);
                session.setAttribute("userinfo", u);
                response.sendRedirect("home");
            } else if (ad.checkAdminToLogin(username, pass) && role.equals("a")) {
                Admin adm = ad.getAnAdmin(username,"","");
                session.setAttribute("admininfo", adm);
                response.sendRedirect("productmanage");
            } else {
                request.setAttribute("mess", "<p>Tên đăng nhập hoặc mật khẩu không chính xác!</p>");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
