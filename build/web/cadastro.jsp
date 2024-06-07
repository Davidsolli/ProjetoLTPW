<%-- 
    Document   : cadastro
    Created on : 5 de jun. de 2024, 15:10:21
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
        <form action="CadastroUsuario" method="POST">
            <input type="text" placeholder="nome" name="nome" required>
            <input type="password" placeholder="senha" name="senha" required>
            <input type="text" placeholder="telefone" name="tel" required>
            <input type="email" placeholder="email" name="email" required>
            <input type="submit" name="enviar">
        </form>
    </body>
</html>
