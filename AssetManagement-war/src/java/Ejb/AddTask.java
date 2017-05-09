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
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author apurv
 */
public class AddTask extends HttpServlet {

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
            String id = request.getParameter("Asset ID").toString();
            String name = request.getParameter("Asset name");
            String skills = request.getParameter("Skills");
            String Taskname = request.getParameter("Task name");
            try {
                Class.forName("com.mysql.jdbc.Driver");

                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Asset_Management", "root", "");
                Statement s = conn.createStatement();
                s = conn.createStatement();
                String str = "select * from Employees";

                System.out.println(str);
                ResultSet rs = s.executeQuery(str);
                int flag = 0;
                while (rs.next()) {
                    String free = rs.getString("Free");
                    if (free.compareTo("true") == 0) {
                        String skills2 = rs.getString("Skills");

                        if (skills2.toLowerCase().contains(skills.toLowerCase())) {
                            String eid = rs.getString("Eid");
                            String quer1 = "Update Employees set Free='false' where Eid="+"'"+eid+"'";
                            s.executeUpdate(quer1);
                            flag = 0;
                            String que = "insert into Task values(\"" + id + "\",\"" + name + "\",\"" + eid + "\",\"" + Taskname + "\")";
                            if (s.executeUpdate(que) > 0) {
                                out.println("<script>"
                                        + "alert('VALUES SUCCESSFULLY UPDATED')"
                                        + "</script>");
                                out.println("<script>"
                                        + "window.location='addtask.jsp';"
                                        + "</script>");
                            } else {
                                out.println("<script>"
                                        + "alert('You Must have Made A Mistake')"
                                        + "</script>");
                                out.println("<script>"
                                        + "window.location='addtask.jsp';"
                                        + "</script>");

                            }
                        } else {
                            flag = 1;
                        }

                    }
                }
                if (flag == 1) {
                    out.println("<script>"
                            + "alert('You Must have Made A Mistake')"
                            + "</script>");
                    out.println("<script>"
                            + "window.location='addtask.jsp';"
                            + "</script>");
                }

            } catch (Exception e) {

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
