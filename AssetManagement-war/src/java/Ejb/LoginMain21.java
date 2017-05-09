/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejb;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;
import java.util.Vector;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author apurv
 */
public class LoginMain21 extends HttpServlet {

    @EJB
    private LoginBean2Local loginBean2;

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginMain2</title>");
            out.println("</head>");
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(60);
            String userid = (String) session.getAttribute("apurv");
            if (userid == null) {
                response.sendRedirect("index.jsp");
                return;
            }
            String value = (String) session.getAttribute("apurv");
            System.out.println(value);
            if (email != null && pass != null && value.compareTo("value") == 0) {
                //out.println(email + " " + pass);
                String name = loginBean2.getName();
                TreeMap<String, Vector<TreeMap<String, String>>> temp = loginBean2.checkLogin(email, pass);
                System.out.println(temp);
                Vector<TreeMap<String, String>> vec = new Vector<TreeMap<String, String>>();
                Iterator it = temp.entrySet().iterator();

                while (it.hasNext()) {
                    Map.Entry eny = (Map.Entry) it.next();
                    String ans = eny.getKey().toString();
                    System.out.println("YEH DEKH ANS"+ans);
                    if (ans.compareTo("Manager") == 0) {
                        vec = (Vector<TreeMap<String, String>>) eny.getValue();
                        System.out.println(vec);
                        TreeMap<String, String> ty = new TreeMap<String, String>();
                        ty = vec.get(0);
                        System.out.println(ty);
                        request.setAttribute("name", ty.get("name"));
                        request.setAttribute("designation", ans);
                        session.setAttribute("id", email);
                        session.setAttribute("pass", pass);
                        
                        session.setAttribute("apurv", "value1");
                        request.getRequestDispatcher("Manager.jsp").forward(request, response);
                    } else if (ans.compareTo("Employee") == 0) {
                        vec = (Vector<TreeMap<String, String>>) eny.getValue();
                        temp.clear();
                        request.setAttribute("name", vec.get(0).get("name"));
                        //request.setAttribute("id", email);
                        request.setAttribute("designation", ans);
                        session.setAttribute("id", email);
                        session.setAttribute("pass", pass);
                        session.setAttribute("apurv", "value1");
                        request.getRequestDispatcher("Employee.jsp").forward(request, response);

                    } else {
                        out.println("<script type='text/javascript'>"
                                + "function alertName(){"
                                + "alert('You Are Not Welcome');"
                                + "}"
                                + "</script>");
                        response.sendRedirect("index.jsp");
                    }
                }
            } else {
                Cookie kil[] = request.getCookies();
                Cookie l = kil[0];
                l.setValue("killer");
                response.sendRedirect("index.jsp");
            }
            out.println("<body>");
            out.println("<h1>Servlet LoginMain2 at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
