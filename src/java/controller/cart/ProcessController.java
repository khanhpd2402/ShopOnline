/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.cart;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Cart;
import model.Item;
import model.Product;

/**
 *
 * @author duykh
 */
@WebServlet(name = "ProccessServlet", urlPatterns = {"/process"})
public class ProcessController extends HttpServlet {

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
            out.println("<title>Servlet ProccessServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProccessServlet at " + request.getContextPath() + "</h1>");
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
        // add vao cookie o trang product detail hoac trang shop se duoc gui den day de xu ly
        String id = request.getParameter("productID");
        // returnUrl_raw se tra va url ma trang user dang đứng de add vao cart
        String returnUrl_raw = request.getParameter("returnUrl");
        if (returnUrl_raw != null) {
            Cookie[] arr = request.getCookies();
            String txt = "";
            //doc cookie
            if (arr != null) {
                for (Cookie o : arr) {
                    if (o.getName().equals("cart")) {
                        txt += o.getValue();
                        o.setMaxAge(0);
                        response.addCookie(o);
                    }
                }
            }

            //add neu cookie rong
            if (txt.isEmpty()) {
                txt = id + ":1";
            } //add new cookie da co
            else {
                String[] items = txt.split("_");
                //kiem tra san pham da ton tai chua
                boolean isIdFound = false;

                for (String item : items) {
                    String[] parts = item.split(":");
                    String itemId = parts[0];

                    if (itemId.equals(id)) {
                        isIdFound = true;
                        break;
                    }
                }

                if (!isIdFound) {
                    txt = txt + "_" + id + ":1";
                }
            }

            Cookie c = new Cookie("cart", txt);
            c.setMaxAge(60 * 60 * 24 * 360);
            response.addCookie(c);
            //xoa dau / cua returnUrl_raw (/productdetail --> productdetail)
            String returnUrl = returnUrl_raw.replaceFirst("/", "");
            //neu returnUrl_raw co dang .jsp thi xoa .jsp
            if (returnUrl.contains(".jsp")) {
                String url = returnUrl.replaceAll(".jsp", "").toLowerCase();
                if (url.contains("productdetail")) {
                    //tra ve tranng productdetail theo id
                    response.sendRedirect(url + "?productID=" + id);
                } else {
                    //tra ve trang cu~
                    response.sendRedirect(url);
                }
            } else {
                if (returnUrl.contains("productdetail")) {
                    //tra ve tranng productdetail theo id
                    response.sendRedirect(returnUrl + "?productID=" + id);
                } else {
                    //tra ve trang cu~
                    response.sendRedirect(returnUrl);
                }
            }
        } else {
            response.sendRedirect("cart");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * 0- * @param request servlet request
     *
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("act");
        if (action == null) {
            ProductDAO d = new ProductDAO();
            List<Product> list = d.getAllProduct(0);
            Cookie[] arr = request.getCookies();
            String txt = "";
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
            String num_raw = request.getParameter("num");
            String id_raw = request.getParameter("id");
            try {
                int id = Integer.parseInt(id_raw);
                int num = Integer.parseInt(num_raw);
                Product p = d.getProductByID(id);
                int numStore = p.getQuantity();
                if (num >= numStore) {
                    num = numStore;
                }
                if (num <= 0) {
                    num = cart.getQuantityOfItemById(id);
                }
                double price = p.getSalePrice();
                Item t = new Item(p, num, price);
                cart.addItem(t);

            } catch (NumberFormatException e) {
            }
            List<Item> items = cart.getItems();
            txt = "";
            if (items.size() > 0) {
                txt = items.get(0).getProduct().getProductID() + ":" + items.get(0).getQuantity();
                for (int i = 1; i < items.size(); i++) {
                    txt += "_" + items.get(i).getProduct().getProductID() + ":" + items.get(i).getQuantity();
                }
            }
            Cookie c = new Cookie("cart", txt);
            c.setMaxAge(60 * 60 * 24 * 360);
            response.addCookie(c);
            response.sendRedirect("cart");
        } // xoa 1 item trong cart
        else if (action.equals("remove")) {
            ProductDAO d = new ProductDAO();
            List<Product> list = d.getAllProduct(0);
            Cookie[] arr = request.getCookies();
            String txt = "";
            //doc cookie
            if (arr != null) {
                for (Cookie o : arr) {
                    if (o.getName().equals("cart")) {
                        txt += o.getValue();
                        //xoa cookie
                        o.setMaxAge(0);
                        response.addCookie(o);
                    }
                }
            }
            String id = request.getParameter("id");
            //cat chuoi txt theo tung item(vd: 18:1_17:2 = [18:1];[17:2])
            String[] ids = txt.split("_");
            String out = "";
            for (int i = 0; i < ids.length; i++) {
                String[] s = ids[i].split(":");
                //check neu khong phai id can xoa se luu vao out
                if (!s[0].equals(id)) {
                    //add lan dau
                    if (out.isEmpty()) {
                        out = ids[i];
                    } else {
                        out += "_" + ids[i];
                    }
                }
            }
            //add out vao lai cart
            if (!out.isEmpty()) {
                Cookie c = new Cookie("cart", out);
                c.setMaxAge(60 * 60 * 24 * 360);
                response.addCookie(c);
            }
            Cart cart = new Cart(out, list);
            response.sendRedirect("cart");
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
