<%-- 
    Document   : removeNotes
    Created on : 28 Apr, 2017, 1:01:19 AM
    Author     : apurv
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
                    String eid = session.getAttribute("id").toString();
                    String str = "select * from Notes where eid = \"" + eid + "\"";
                    ResultSet rs = s.executeQuery(str);
                    //rs.next();
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
                String str1 = "select * from Notes where eid <> \"" + eid + "\"";
                ResultSet rs1 = s.executeQuery(str1);
                //rs1.next();
                while (rs1.next()) {
                    System.out.println(rs1.getString("AssetID").toString());
            %>

            <tr>
                <td><%= rs1.getString("AssetId")%></td>
                <td><%= rs1.getString("Text")%></td>
                <td><%= rs1.getString("NoteID")%></td>

            </tr>
            <%  }
                } catch (Exception e) {

                }
            %>
        </table>
    </body>
</html>
