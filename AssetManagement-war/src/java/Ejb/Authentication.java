/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejb;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author apurv
 */
public class Authentication extends HttpServlet {

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
            String name = request.getParameter("Employee Name");
            String eid = request.getParameter("Employee ID");
            String designation = request.getParameter("Designation");
            String pw = request.getParameter("Password");
            String skills = request.getParameter("Skills");
            try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Asset_Management", "root", "");
            Statement s = conn.createStatement();
            s = conn.createStatement();
            String sql_query = "insert into Employees values(\"" + eid + "\",\"" + name + "\",\"" + designation + "\",\"" + pw + "\",\"" + skills + "\",\"true\")";
            System.out.println(eid + " " + name + " " + designation + " " + pw + " " + skills);
            System.out.println(sql_query);
            if (s.executeUpdate(sql_query)>0) {
                out.println("<script>"
                        +"alert('VALUES SUCCESSFULLY UPDATED')" 
                        +"</script>");
                out.println("<script>"
                        + "window.location='authentication.jsp';"
                        + "</script>");
            } else {
                out.println("<script>"
                        +"alert('You Must have Made A Mistake')" 
                        +"</script>");
                out.println("<script>"
                        + "window.location='authentication.jsp';"
                        + "</script>");
            }

        } catch (Exception e) {

        }
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Authentication</title>");   
            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Authentication at " + request.getContextPath() + "</h1>");
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
