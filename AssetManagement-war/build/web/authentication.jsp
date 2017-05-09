

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jsp Page</title>
        <style>
            .container {
                width: 40%;
                border-radius: 5px;
                background-color: #f2f2f2;
                padding: 20px;
            }
            input[type=text] 
            {
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
            <form class="pure-form pure-form-aligned" action="Authentication" method="post">

                <label for="EmployeeID">Employee ID</label>
                <input type="text" id="EmployeeID" name="Employee ID" placeholder="Enter Employee ID..">

                <label for="EmployeeName">Employee Name</label>
                <input type="text" id="EmployeeName" name="Employee Name" placeholder="Enter Employee Name..">

                <label for="designation">Designation</label>
                <input type="text" id="designation" name="Designation" placeholder="Enter Designation..">

                <label for="pass">Password</label>
                <input type="text" id="pass" name="Password" placeholder="Enter Password..">

                <label for="skills">Employee ID</label>
                <input type="text" id="skills" name="Skills" placeholder="Enter Skills..">

                <input type="submit" value="Submit">
            </form>
            
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
