<%-- 
    Document   : addNotes
    Created on : 28 Apr, 2017, 1:00:26 AM
    Author     : apurv
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1"  style="vertical-align: top;">
            <tr>
                <th>Asset Id</th>
                <th>Asset Name</th>
                <th>Note</th>
            </tr>
            <%  try {
                    String id = session.getAttribute("id").toString();
                    Class.forName("com.mysql.jdbc.Driver");
                    //System.out.println("ajgdkjsagdkjabjdgakjsdhkagsdkjgku");

                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Asset_Management", "root", "");
                    Statement s = conn.createStatement();
                    s = conn.createStatement();
                    String str = "select * from Asset where Eid="+"'"+id+"'";
                    
                    System.out.println(str);
                    ResultSet rs = s.executeQuery(str);
                    //rs.next();
                    while (rs.next()) {
                        System.out.println(rs.getString("Eid").toString());

            %>

            <tr>
                <td><%= rs.getString("AssetId")%></td>
                <td><%= rs.getString("Asset_Name")%></td>

                <td><form action="AddNotes" method="post">
                        <input type="hidden" value="<%= rs.getString("AssetId")%>" name="id"/>
                        <input type="text" name="note" value="">
                        <input type="submit" value="Add" name=""/></form></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                }
            %>
        </table>

        <form action="LoginMain22" method="post">
                 <%
                     session.setAttribute("apurv", "value");
                     String id = session.getAttribute("id").toString();
                     String pass = session.getAttribute("pass").toString();
                     
                  %>
                  <input type="hidden" value="<%=id%>" name="idi">
                  <input type="hidden" value="<%=pass%>" name="passw">
                 
             </form>
    </body>
</html>
