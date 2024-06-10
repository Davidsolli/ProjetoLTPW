<%-- 
    Document   : form-cadastro
    Created on : 20 de mai. de 2024, 16:23:07
    Author     : HypeH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.controle.Loja" %>
<%@page import="br.com.controle.Produto" %>
<%@page import="br.com.entidade.DAOLoja" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Bebas Neue', sans-serif;
            }

            main {
                display: flex;
                justify-content: center;
                align-items: center;
                width: 100vw;
                height: 70%;
                position: relative;
            }

            body {
                background: rgb(220, 220, 220);
                overflow: hidden;
            }

            form {
                display: flex;
                flex-direction: column;
                z-index: 1;
                width: 60%;
                max-width: 600px;
                background: rgba(255, 255, 255, 0.2);
                backdrop-filter: blur(10px);
                padding: 20px;
                border-radius: 10px;
                border: 1px solid rgba(255, 255, 255, 0.3);
            }

            form input {
                padding: 10px;
                text-align: center;
                margin-bottom: 10px;
                border: solid 1px black;
                border-radius: 0px;
            }

            #btn-submit {
                text-decoration: none;
                color: black;
                background: #EFCAB5;
                border-radius: 10px;
                padding: 20px;
                font-size: 25px;
                border: dashed 1px black;
                align-self: center;
                transition: all 0.3s ease;
            }

            #btn-submit:hover {
                border: dashed 1px black;
                color: #8F6C58;
                box-shadow: 0 .4rem .8rem #8F6C58;
            }

            form textarea {
                text-align: center;
                border: dotted black 1px;
                border-radius: 0px;
                color: black;
                margin-bottom: 10px;
                padding: 1em;
                resize: none;
            }

            a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                font-size: 24px;
                font-weight: bold;
                text-align: center;
                border-radius: 5px;
                margin-bottom: 20px;
            }
        </style>
    </head>

    <body>
        <%
            String emailLoja = (String) session.getAttribute("email");

            if(emailLoja == null) {
                response.sendRedirect("login.jsp");
                System.out.println("Email não encontrado!");
                return;
            }

            Loja loja = DAOLoja.buscarPorEmail(emailLoja);

            if(loja == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            Produto produto = new Produto();
            produto.setLoja(loja);
            System.out.println(produto.getLoja().getId());
        %>
        <%@ include file="header.jsp" %>

        <main>
            <form action="CadastroProduto" method="Post">
                <a>Cadastre um novo produto!</a>
                <input type="text" placeholder="Nome do produto" name="nome-produto" required>
                <input type="text" name="valor-produto" placeholder="Valor do produto" required>
                <textarea name="descricao-produto" rows="5" cols="10" placeholder="Descrição do produto" required></textarea>
                <input type="hidden" name="loja-id" value="<%= loja.getId() %>">
                <input id="btn-submit" type="submit" name="enviar">
            </form>
        </main>

    </body>

</html>