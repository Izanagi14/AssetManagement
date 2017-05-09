<%-- 
    Document   : Manager
    Created on : 11 Apr, 2017, 11:36:40 PM
    Author     : apurv
--%>

<!DOCTYPE html>
<html>
    <head>
        <% String name = null, pos = null;%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jsp Page</title>
         <script type="text/javascript">
            window.history.forward();
            function noBack()
            {
                window.history.forward();
            }
        </script>   
        <title>Manager</title>
     
    </head>
        <style type="text/css">
            header, section, footer, aside, nav, article, figure, figcaption 
            {
                display: block;
            }
            body 
            {
                color: #666666;
                background-color: #f9f8f6;
                background-image: url("\one.jpg");
                background-position: center;
                font-family: Georgia, times, serif;
                line-height: 1.4em;
                margin: 0px;
            }


            h1 
            {
                background-image: url("\two.jpg");
                text-indent: -9999px;
                width: 940px;
                height: 130px;
                margin: 0px;
            }
            nav
            {
                clear: both;
                color: #ffffff;
                background-color: #aeaca8;
                height: 30px;
            }
            nav ul 
            {
                margin: 0px;
                padding: 5px 0px 5px 30px;
            }
            nav li
            {
                display: inline;
                margin-right: 40px;
            }
            nav li a
            {
                color: #ffffff;
            }
            nav li a:hover, nav li a.current 
            {
                color: #000000;
            }
            section.courses 
            {
                float: left;
                width: 659px;
                border-right: 1px solid #eeeeee;
            }
            article 
            {
                position:relative;	
                clear: both;
                overflow: auto;
                width: 100%;
            }
            hgroup
            {
                margin-top:40px;
            }
            figure
            {
                float: left;
                width: 290px;
                height: 220px;
                padding: 5px;
                margin: 20px;
                border: 1px solid #eeeeee;
            }
            figcaption
            {
                font-size: 90%;
                text-align: left;
            }
            aside
            {
                width: 230px;
                float: left;
                padding: 0px 0px 0px 20px;
            }
            aside section a
            {
                display: block;
                padding: 10px;
                border-bottom: 1px solid #eeeeee;
            }
            aside section a:hover
            {
                color: #985d6a;
                background-color: #efefef;
            }
            a
            {
                color: #985d6a;
                text-decoration: none;
            }
            h1, h2, h3 
            {
                color:#0099ff;
                font-weight: normal;
            }
            h2 
            {
                margin: 10px 0px 5px 0px;
                padding: 0px;
            }
            h3 
            {
                margin: 0px 0px 10px 0px;
                color: #de6581;
            }
            aside h2 
            {
                padding: 30px 0px 10px 0px;
                color: #de6581;
            }
            footer
            {
                position:absolute;
                bottom:38px;
                width:935px;
                font-size: 100%;
                clear: both;
                color: #ffffff;
                background-color: #aeaca8;
                height: 40px;
            }
            h4
            {
                position:absolute;
                left:30%;
                top:5%;
                font-size:25px;
                color:red;
            }
            fieldset
            {
                height:900px;
                width:940px;
                margin: 20px auto 20px auto;
                border: 2px solid #000000;
                background-color: #ffffff;
            }
        </style>
       
     <body onLoad="noBack();" onpageshow="if (event.persisted) noBack();" onUnload="">
    <%
        
        String value = session.getAttribute("apurv").toString();
        if (value.compareTo("value1") == 0) {
            name = request.getAttribute("name").toString();
            pos = request.getAttribute("designation").toString();
        } else {
            response.sendRedirect("index.jsp");
        }
    %>
     <h1>Welcome<% out.println(" " + name + "(" + pos + ")");%></h1>


        <fieldset>
            <header>
                <h1></h1>
                <h4>Asset Management</h4>
                <nav>
                    <ul>
                        <li><a href="addasset.jsp" class="current" target="go">Add Asset</a></li>
                        <li><a href="removeasset.jsp" target="go">Remove Asset</a></li>
                        <li><a href="addtask.jsp" target="go">Add Task</a></li>
                        <li><a href="removetask.jsp" target="go">Remove Task</a></li>
                        <li><a href="viewnotes.jsp" target="go">View Notes</a></li>
                        <li><a href="authentication.jsp" target="go">Register New Employee</a></li>
                        <li><a href="Logout.jsp">LOGOUT</a></li>

                    </ul>
                </nav>
            </header>
            <aside>
                <section class="viewer">
                    <h2>OPTIONS</h2>
                        <a href="addasset.jsp" class="current" target="go">Add Asset</a>
                        <a href="removeasset.jsp" target="go">Remove Asset</a>
                        <a href="addtask.jsp" target="go">Add Task</a>
                        <a href="removetask.jsp" target="go">Remove Task</a>
                        <a href="viewnotes.jsp" target="go">View Notes</a>
                        <a href="authentication.jsp" target="go">Register New Employee</a>
                        <a href="Logout.jsp">LOGOUT</a>

                </section>
            </aside>
            <section class="courses">
                <%
                    String str = request.getAttribute("name").toString();
                    //String id = session.getAttribute("id").toString();
                    //session.setAttribute("Empy", id);
                %>
                <h2><p align ="center" action="nameret.php">WELCOME <%= str%></p></h2>
            </section>
            <iframe name="go" style="width:680px"; height="480px" src="" frameborder="0"></iframe>


            <footer id="demo" align="center">
                <script>

                    document.getElementById("demo").innerHTML = Date("");

                </script>
                &copy; CRM
            </footer>


        </fieldset>
    </body>
</html>
        
     
   
</html>
