<%-- 
    Document   : notifications
    Created on : 10 May, 2017, 1:21:39 AM
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
                <th>Setters ID</th>
                <th>Title</th>
                <th>Body</th>
            </tr>
            <%  try {
                    String id = session.getAttribute("id").toString();
                    Class.forName("com.mysql.jdbc.Driver");
                    //System.out.println("ajgdkjsagdkjabjdgakjsdhkagsdkjgku");

                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Asset_Management", "root", "");
                    Statement s = conn.createStatement();
                    s = conn.createStatement();
                    String str = "select * from Watchdog where EID="+"'"+id+"'";
                    
                    System.out.println(str);
                    ResultSet rs = s.executeQuery(str);
                    //rs.next();
                    while (rs.next()) {
                        System.out.println(rs.getString("Eid").toString());

            %>

            <tr>
                <td><%= rs.getString("AssetID")%></td>
                <td><%= rs.getString("CID")%></td>
                <td><%= rs.getString("Title")%></td>
                <td><%= rs.getString("Body")%></td>
                
            </tr>
            <%
                    }
                } catch (Exception e) {
                }
            %>
        </table>

    </body>
</html>
