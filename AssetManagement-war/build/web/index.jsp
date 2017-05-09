<%-- 
    Document   : index
    Created on : 29 Mar, 2017, 12:44:08 AM
    Author     : apurv
--%>        

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
        <meta charset="UTF-8">
        <title>Sign-Up/Login Form</title>
        <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">


        <link rel="stylesheet" href="css/style.css">
<!--        <script type="text/javascript">
            window.history.forward();
            function noBack()
            {
                window.history.forward();
            }
        </script>-->

    </head>

    <body onLoad="noBack();" onpageshow="if (event.persisted) noBack();" onUnload="">
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            session.setMaxInactiveInterval(60);
            session.setAttribute("apurv", "value");

        %>
        <div class="form">

            <ul class="tab-group">
                <li class="tab active"><a href="#signup">Sign Up</a></li>
                <li class="tab"><a href="#login">Log In</a></li>
            </ul>

            <div class="tab-content">
                <div id="signup">   
                    <h1>Sign Up for Free</h1>

                    <form action="Login" method="post">

                        <div class="top-row">
                            <div class="field-wrap">
                                <label>
                                    First Name<span class="req">*</span>
                                </label>
                                <input type="text" required autocomplete="off" />
                            </div>

                            <div class="field-wrap">
                                <label>
                                    Last Name<span class="req">*</span>
                                </label>
                                <input type="text" required autocomplete="off"/>
                            </div>
                        </div>

                        <div class="field-wrap">
                            <label>
                                Email Address<span class="req">*</span>
                            </label>
                            <input type="email" required autocomplete="off"/>
                        </div>

                        <div class="field-wrap">
                            <label>
                                Set A Password<span class="req">*</span>
                            </label>
                            <input type="password" required autocomplete="off"/>
                        </div>

                        <button type="submit" class="button button-block"/> Request A Password </button>

                    </form>

                </div>

                <div id="login">   
                    <h1>Welcome Back!</h1>
                    <%     String userid = (String) session.getAttribute("apurv");
                        if (userid == null) {
                            response.sendRedirect("index.jsp");
                            return;
                        }%>
                    <form action="LoginMain21" method="post">

                        <div class="field-wrap">
                            <label>
                                Employee ID<span class="req">*</span>
                            </label>
                            <input type="text" required autocomplete="off" name="email"/>
                        </div>

                        <div class="field-wrap">
                            <label>
                                Password<span class="req">*</span>
                            </label>
                            <input type="password" required autocomplete="off" name="pass"/>
                        </div>

                        <p class="forgot"><a href="#">Forgot Password?</a></p>

                        <button class="button button-block"/>Log In</button>

                    </form>

                </div>

            </div><!-- tab-content -->

        </div> <!-- /form -->
        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script src="js/index.js"></script>

    </body>
</html>
