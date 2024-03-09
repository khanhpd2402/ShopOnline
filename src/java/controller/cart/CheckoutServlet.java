/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.cart;

import dao.CouponDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import model.Coupon;
import model.Product;
import model.User;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "CheckoutServlet", urlPatterns = {"/checkout"})
public class CheckoutServlet extends HttpServlet {

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
        String totalMoney_raw = request.getParameter("totalMoney");
        String amountCoupon_raw = request.getParameter("amountCoupon");
        if (totalMoney_raw != null && amountCoupon_raw != null) {
            long totalMoney = (long) Double.parseDouble(totalMoney_raw);
            double amountCoupon = Double.parseDouble(amountCoupon_raw);

            try ( PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet CheckoutServlet</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Servlet CheckoutServlet at " + (long) totalMoney + "_" +(long) amountCoupon + "</h1>");
                out.println("</body>");
                out.println("</html>");
            }
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
        UserDAO ud = new UserDAO();
        User us = (User) session.getAttribute("userinfo");
        if (us != null) {
            //lay user theo id user dc lay tu session
            User u = ud.getAnUser(us.getUsername());
            request.setAttribute("user", u);

            ProductDAO d = new ProductDAO();
            List<Product> list = d.getAllProduct(0);
            Cookie[] arr = request.getCookies();
            String txt = "";
            if (arr != null) {
                for (Cookie o : arr) {
                    if (o.getName().equals("cart")) {
                        txt += o.getValue();
                    }
                }
            }
            Cart cart = new Cart(txt, list);
            request.setAttribute("cart", cart);
            request.setAttribute("fullInfoUser", u);
            request.getRequestDispatcher("CheckOut.jsp").forward(request, response);
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
        User us = (User) session.getAttribute("userinfo");

        String couponCode = request.getParameter("code");
        String paymentMethod = request.getParameter("paymentMethod");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String totalMoney_raw = request.getParameter("totalMoney");
        String amountCoupon_raw = request.getParameter("amountCoupon");

        ProductDAO d = new ProductDAO();
        OrderDAO odao = new OrderDAO();
        UserDAO ud = new UserDAO();

        User u = ud.getAnUser(us.getUsername());
        List<Product> list = d.getAllProduct(0);
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (couponCode != null) {

            CouponDAO cd = new CouponDAO();
            Coupon coupon = cd.getCouponByCode(couponCode);

            if (arr != null) {
                for (Cookie o : arr) {
                    if (o.getName().equals("cart")) {
                        txt += o.getValue();
                    }
                }
            }
            Cart cart = new Cart(txt, list);
            request.setAttribute("cart", cart);
            request.setAttribute("fullInfoUser", u);
            //user nhap ma giam gia sai
            if (coupon == null) {
                request.setAttribute("notiCoupon", "Mã giảm giá không hợp lệ!");
            } else {
                request.setAttribute("coupon", coupon);
            }
            request.getRequestDispatcher("CheckOut.jsp").forward(request, response);

        } else if (paymentMethod.equals("1")) {
            if (arr != null) {
                for (Cookie o : arr) {
                    if (o.getName().equals("cart")) {
                        txt += o.getValue();
                        o.setMaxAge(0);
                        response.addCookie(o);
                    }
                }
            }

            Cart cart = new Cart(txt, list);

            try {
                //neu user add ma giam gia
                if (totalMoney_raw != null && amountCoupon_raw != null && amountCoupon_raw.length()  != 0) {
                    //pasre ra kieu du lieu long de khong bi loi
                    long totalMoney = (long) Double.parseDouble(totalMoney_raw);
                    long amountCoupon = (long) Double.parseDouble(amountCoupon_raw);
                    odao.insertOrder(u.getUserID(),phone, cart, paymentMethod, address, totalMoney, "", amountCoupon);
                    //neu nguoi dung khong add ma giam gia
                }else if(totalMoney_raw != null){
                    long totalMoney = (long) Double.parseDouble(totalMoney_raw);
                    odao.insertOrder(u.getUserID(),phone, cart, paymentMethod, address, totalMoney, "", 0);
                }
            } catch (SQLException ex) {
                Logger.getLogger(CheckoutServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            //insert vao database xong thi xoa code di
            Cookie c = new Cookie("cart", "");
            c.setMaxAge(0);
            response.addCookie(c);
            response.sendRedirect("home");
        } else if (paymentMethod.equals("2")) {

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
