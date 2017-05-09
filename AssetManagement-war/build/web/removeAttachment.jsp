<%-- 
    Document   : removeAttachment
    Created on : 28 Apr, 2017, 1:01:49 AM
    Author     : apurv
--%>

<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
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
                <th>Attachment ID </th>

            </tr>
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");

                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Asset_Management", "root", "");
                    Statement s = conn.createStatement();
                    s = conn.createStatement();
                    String eid = session.getAttribute("id").toString();
                    String str = "select * from Attachment where eid = \"" + eid + "\"";
                    ResultSet rs = s.executeQuery(str);
                    //rs.next();
                    while (rs.next()) {
                        System.out.println(rs.getString("AssetID").toString());

                        byte[] imgData = rs.getBytes("File");//Here r1.getBytes() extract byte data from resultSet 
                        System.out.println(imgData);
                        response.setHeader("expires", "0");
                        response.setContentType("image/jpg");

                        OutputStream os = response.getOutputStream();
                        os.write(imgData);
                        os.flush();
                        os.close();


            %>
            <tr>
                <td><%= rs.getString("AssetID")%></td>
                <td><%= rs.getString("AttachmentID")%></td>

                <td><form action="RemoveAttachment" method="post"><input type="hidden" value="<%= rs.getString("AttachmentID")%>" name="id"/>
                        <input type="submit" value="Remove" name=""/></form></td>
            </tr>

            <%
                }
                String str1 = "select * from Attachment where eid <> \"" + eid + "\"";
                ResultSet rs1 = s.executeQuery(str1);
                //rs1.next();
                while (rs1.next()) {
                    System.out.println(rs1.getString("AssetID").toString());
            %>

            <tr>
                <td><%= rs1.getString("AssetID")%></td>
                <td><%= rs1.getString("AttachmentID")%></td>


            </tr>
            <%  }
                } catch (Exception e) {

                }
            %>
        </table>
    </body>
</html>
