<%-- 
    Document   : Logout
    Created on : 18 Apr, 2017, 12:55:02 AM
    Author     : apurv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <script type="text/javascript">
            window.history.forward();
            function noBack()
            {
                window.history.forward();
            }
        </script>
    </head>
    <body onLoad="noBack();" onpageshow="if (event.persisted) noBack();" onUnload="">
        <%

            session.removeAttribute("apurv");
            session.setAttribute("apurv", "valuee");
            session.invalidate();
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
