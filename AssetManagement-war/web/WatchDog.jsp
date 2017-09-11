<%-- 
    Document   : WatchDog
    Created on : 10 May, 2017, 12:34:32 AM
    Author     : apurv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="SetWatchDog" method="post">
            <input type="hidden" value="<%= request.getParameter("Aid")%>" name="Aid"/>
            <input type="hidden" value="<%= request.getParameter("Eid")%>" name="Eid"/>
            <input type="hidden" value="<%= request.getParameter("Ceid")%>" name="Ceid"/>

            <input type="text" name="title" placeholder="Title"/>
            <br>
            <input type="text" name="body" placeholder="Body"/>
            <br>
            <input type="submit" value="Set WatchDog"><br>
        </form>
    </body>
</html>
