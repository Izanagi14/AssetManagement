/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejb;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author apurv
 */
public class AddAsset extends HttpServlet {

    @EJB
    private AssetAddLocal assetAdd;

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
            String id = request.getParameter("Asset ID");
            String name = request.getParameter("Asset name");
            String qua = request.getParameter("Quality");
            String date = request.getParameter("Date");
            String skill = request.getParameter("Skill");
            String minFrom = request.getParameter("Minutes from");
            String minTo = request.getParameter("Minutes to");
            String ans = assetAdd.assetAdd(name, id, date, qua, skill, minTo, minFrom);
            if(ans.compareTo("true")==0)
            {
                out.println("<script>"
                        +"alert('VALUES SUCCESSFULLY UPDATED')" 
                        +"</script>");
                out.println("<script>"
                        + "window.location='addasset.jsp';"
                        + "</script>");
            }
            else
            {
                out.println("<script>"
                        +"alert('You Must have Made A Mistake')" 
                        +"</script>");
                out.println("<script>"
                        + "window.location='addasset.jsp';"
                        + "</script>");
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
