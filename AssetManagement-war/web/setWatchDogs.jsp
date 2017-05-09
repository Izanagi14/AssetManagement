<%-- 
    Document   : setWatchDogs
    Created on : 9 May, 2017, 11:54:12 AM
    Author     : apurv
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
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
                <th>Asset Name</th>
                <th>Date</th>
                <th>Quality</th>
                <th>Employee Id</th>  <th>Minutes From</th>  <th>Minutes To</th>  <th>Skill</th>  
            </tr>
            <%
                String currentEmpId = session.getAttribute("id").toString();
                try {
                    Class.forName("com.mysql.jdbc.Driver");

                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Asset_Management", "root", "");
                    Statement s = conn.createStatement();
                    s = conn.createStatement();
                    String str = "select * from Asset";
                    ResultSet rs = s.executeQuery(str);
                    //rs.next();
                    while (rs.next()) {
                        System.out.println(rs.getString("AssetID").toString());
            %>

            <tr>
                <td><%= rs.getString("AssetId")%></td>
                <td><%= rs.getString("Asset_Name")%></td>
                <td><%= rs.getString("Date")%></td>
                <td><%= rs.getString("Quality")%></td>
                <td><%= rs.getString("EID")%></td>
                <td><%= rs.getString("Minutes_From")%></td>
                <td><%= rs.getString("Minutes_To")%></td>
                <td><%= rs.getString("Skill")%></td>
                <td><form action="SetWatchDog" method="post"><input type="hidden" value="<%= rs.getString("AssetID")%>" name="Aid"/>
                        <input type="hidden" value="<%= rs.getString("EID")%>" name="Eid"/>
                        <input type="hidden" value="<%= currentEmpId%>" name="Ceid"/>
                        <input type="submit" value="Set Watch Dog" name=""/></form></td>
            </tr>

            <%
                    }
                } catch (Exception e) {

                }
            %>
        </table>
    </body>
</html>
