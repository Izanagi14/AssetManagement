<%-- 
    Document   : viewnotes
    Created on : 9 May, 2017, 2:20:09 AM
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
                <th>Asset Id </th>
                <th>Details </th>
                <th>NoteID </th>
            </tr>
        <%
       try {
                    Class.forName("com.mysql.jdbc.Driver");
                    
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Asset_Management", "root", "");
                    Statement s = conn.createStatement();
                    s = conn.createStatement();
                    String str = "select * from Notes";
                    ResultSet rs = s.executeQuery(str);
                    rs.next();
                    while (rs.next()) {
                        System.out.println(rs.getString("AssetID").toString());
            %>

            <tr>
                <td><%= rs.getString("AssetId")%></td>
                <td><%= rs.getString("Text")%></td>
                <td><%= rs.getString("NoteID")%></td>
                <td><form action="RemoveNotes" method="post"><input type="hidden" value="<%= rs.getString("NoteID")%>" name="id"/>
                        <input type="submit" value="Remove" name=""/></form></td>
            </tr>

            <%
                    }
                } catch (Exception e) {

                }
            %>
          </table>
    </body>
</html>
