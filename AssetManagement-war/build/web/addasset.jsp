

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
        <form class="pure-form pure-form-aligned" action="AddAsset" method="post">
            <label for="assetid">Asset ID</label>
    <input type="text" id="assetid" name="Asset ID" placeholder="Enter Asset ID..">

    <label for="name">Asset Name</label>
    <input type="text" id="name" name="Asset name" placeholder="Enter Asset name..">
    
    <label for="date">DATE</label>
    <input type="text" id="date" name="Date" placeholder="Enter Date..">

    <label for="quality">Quality</label>
    <input type="text" id="quality" name="Quality" placeholder="Enter Quality if any..">
    
    <label for="Skill">Skill</label>
    <input type="text" id="Skill" name="Skill" placeholder="Enter Skill Required..">

    <label for="minfrom">Minutes (From)</label>
    <input type="text" id="minfrom" name="Minutes from" placeholder="Minutes (from)..">
    
    <label for="minto">Minutes (To)</label>
    <input type="text" id="minto" name="Minutes to" placeholder="Minutes (to)..">
   
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
