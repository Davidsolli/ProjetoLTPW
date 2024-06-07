<%-- 
    Document   : lista-loja
    Created on : 5 de jun. de 2024, 15:16:38
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
        <%
            String email = (String) session.getAttribute("email");
        %>

        Seja bem Vindo : <%=email %> | <a href="#">Sair</a>
        <h1><a href="lista-produto.jsp">produtos</a></h1>
    </body>
</html>
