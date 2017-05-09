

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jsp Page</title>
        <style>
            </style>
            <!--        <style>
                        .container {
                            width: 40%;
                            border-radius: 5px;
                            background-color: #f2f2f2;
                            padding: 20px;
                        }
                         
                        input[type=text] {
                            width: 100%;
                            height: 50px;
                            background-color: #4CAF50;
                            color: white;
                            box-sizing: border-box;
                            padding: 14px 20px;
                            margin-top: 6px; 
                            margin-bottom: 6px;
                            border: 1px solid #ccc;
                            border-radius: 4px;
                            resize: vertical
                        }
                    </style>
                </head>
                <body>
                    <div class="container">
                        <form class="pure-form pure-form-aligned" action="removeasset.jsp" method="post">
                            <label for="assetid">Asset ID</label>
                            <input type="text" id="assetid" name="Asset ID" placeholder="Enter Asset ID..">
            
                            <label for="name">Asset Name</label>
                            <input type="text" id="name" name="Asset name" placeholder="Enter Asset name..">
            
                            <label for="date">DATE</label>
                            <input type="text" id="date" name="Date" placeholder="Enter Date..">
            
                            <label for="quality">Quality</label>
                            <input type="text" id="quality" name="Quality" placeholder="Enter Quality..">
            
                            <label for="EmployeeID">Employee ID</label>
                            <input type="text" id="EmployeeID" name="Employee ID" placeholder="Enter Employee ID..">
            
                            <label for="minfrom">Minutes (From)</label>
                            <input type="text" id="minfrom" name="Minutes from" placeholder="Minutes (from)..">
            
                            <label for="minto">Minutes (To)</label>
                            <input type="text" id="minto" name="Minutes to" placeholder="Minutes (to)..">
            
                            <input type="submit" value="Submit">
                        </form>-->
        <body>
        </div>
        <div>
            <table border="1"  style="vertical-align: top;">
            <tr>
                <th>Asset Id</th>
                <th>Asset Name</th>
                <th>Date</th>
                <th>Quality</th>
                <th>Eid</th>
                <th>Minutes From</th>
                <th>Minutes To</th>
            </tr>
            <% try {
                    Class.forName("com.mysql.jdbc.Driver");
                    System.out.println("ajgdkjsagdkjabjdgakjsdhkagsdkjgku");

                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Asset_Management", "root", "");
                    Statement s = conn.createStatement();
                    s = conn.createStatement();
                    String str = "select * from Asset";
                    ResultSet rs = s.executeQuery(str);
                    System.out.println("asdasdadadasdasdasdajgdkjsagdkjabjdgakjsdhkagsdkjgku");
                    //rs.next();
                    while (rs.next()) {
                        System.out.println(rs.getString("Eid").toString());
                        System.out.println("ajgdkjsagdkjabjdgakjsdhkagsdkjgku");
            %>

            <tr>
                <td><%= rs.getString("AssetId")%></td>
                <td><%= rs.getString("Asset_Name")%></td>
                <td><%= rs.getString("Date")%></td>
                <td><%= rs.getString("Quality")%></td>
                <td><%= rs.getString("Eid")%></td>
                <td><%= rs.getString("Minutes_From")%></td>
                <td><%= rs.getString("Minutes_To")%></td>
                <td><form action="AssetRemove" method="post"><input type="hidden" value="<%= rs.getString("AssetId")%>" name="id"/>
                        <input type="submit" value="Remove" name=""/></form></td>
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
    </div>
</body>
</html>
