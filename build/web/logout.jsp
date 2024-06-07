<%-- 
    Document   : logout
    Created on : 6 de jun. de 2024, 22:06:35
    Author     : HypeH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            session.removeAttribute("email");
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
