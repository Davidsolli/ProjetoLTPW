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
        <%@ include file="header.jsp" %>
        <%
            String usuario = (String) session.getAttribute("email");
            
            if(usuario == null) {
                response.sendRedirect("login.jsp");
                System.out.println("Usuario não encontrado!");
            } else {System.out.println("Logado!");} 
            
        %>

        Seja bem Vindo : <%=usuario %> | <a href="logout.jsp">Sair</a>
        <h1><a href="lista-produto.jsp">produtos</a></h1>
    </body>
</html>
