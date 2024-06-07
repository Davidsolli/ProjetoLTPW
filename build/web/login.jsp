<%-- 
    Document   : login
    Created on : 5 de jun. de 2024, 15:10:00
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
        <h2>Login</h2>
        <form action="LoginUsuario" method="post">
            Username: <input type="text" name="user" required><br>
            Password: <input type="password" name="senha" required><br>
            <input type="submit" value="Login">
        </form>
    </body>
</html>
