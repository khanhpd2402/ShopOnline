/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dao.UserContactDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.User;
import model.UserContact;

/**
 *
 * @author khanh
 */
@WebServlet(name = "AllContactsServlet", urlPatterns = {"/allcontacts"})
public class AllContactsServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        UserContactDAO ucdb = new UserContactDAO();
        if (us != null) {
            List<UserContact> userContacts = ucdb.getAllContactAnUser(us.getUserID());
            request.setAttribute("userContacts", userContacts);
            request.getRequestDispatcher("allcontacts.jsp").forward(request, response);
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
        User u = (User) session.getAttribute("userinfo");

        UserDAO udb = new UserDAO();
        UserContactDAO ucdb = new UserContactDAO();

        String userContactID = request.getParameter("userContactID");
        String action = request.getParameter("action");
        //set lien he mac dinh
        if (action.equals("setDefaul")) {
            udb.updateUserContactID_Favorite(Integer.parseInt(userContactID), u.getUserID());
            request.setAttribute("existModal", "existModal");
            session.removeAttribute("userinfo");
            request.getRequestDispatcher("allcontacts.jsp").forward(request, response);
        }
        //chinh sua lien he
        else if (action.equals("edit")) {
            String email = request.getParameter("email").trim();
            String phone = request.getParameter("phone").trim();
            String address = request.getParameter("address").trim();
            //check xem nguoi dung co thay doi thong tin hay khong
            
            List<UserContact> listContactsUser = ucdb.getAllContactAnUser(0);
            for (UserContact userContact : listContactsUser) {
                if (userContact.getEmail().equals(email) ) {

                }
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
