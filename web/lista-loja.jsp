<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.controle.Loja"%>
<%@page import="br.com.entidade.DAOLoja"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Lojas</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Bebas Neue', sans-serif;
            }

            body {
                background: rgb(220, 220, 220);
                display: flex;
                align-items: center;
                flex-direction: column;
            }

            .content {
                max-width: 50%;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-collapse: collapse;
                margin: 20px 0;
                background-color: rgba(255, 255, 255, 0.2);
                z-index: 1;
                backdrop-filter: blur(10px);
            }

            h1, h2 {
                color: #000000;
                text-align: center;
                margin-bottom: 20px;
            }

            table {
                width: 100%;
                margin-bottom: 20px;
            }

            table, th, td {
                border: 1px solid #ccc;
            }

            th, td {
                padding: 10px;
                text-align: left;
            }

            th {
                background-color: #EFCAB5;
            }

            a {
                color: black;
                text-decoration: none;
            }

            a:hover {
                text-decoration: underline;
            }

            .logout {
                text-align: right;
            }

            label {
                width: 100%;
                background-color: rgba(255, 255, 255, 0.2);
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                backdrop-filter: blur(10px);
                padding: 5px 5px;
                margin: 5px;
            }

            .btn-cadastrar {
                display: inline-block;
                padding: 10px 20px;
                background-color: #EFCAB5;
                border-radius: 10px;
                text-decoration: none;
                color: black;
                text-align: center;
            }

            .btn-cadastrar:hover {
                border: dashed 1px black;
                color: #8F6C58;
                box-shadow: 0 .4rem .8rem #8F6C58;
            }
        </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <% 
            String usuario = (String) session.getAttribute("email"); 
            if (usuario == null) {
                response.sendRedirect("login.jsp"); 
                return; 
            } 
        %>
        <label>Seja bem-vindo: <%= usuario %> | <a href="logout.jsp">Sair</a></label>
        <div class="content">
            <% 
                DAOLoja lojaDAO = new DAOLoja(); 
                ArrayList<Loja> listaLojas = null;
                try {
                    listaLojas = lojaDAO.listarLoja();
                } catch (Exception e) {
                    out.println("Erro ao listar lojas: " + e.getMessage());
                }
            %>
            <h1>Produtos</h1>
            <h2>Lista de Lojas</h2>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Telefone</th>
                    <th>Email</th>
                </tr>
                <% 
                    if (listaLojas != null && !listaLojas.isEmpty()) {
                        for (Loja loja : listaLojas) {
                %>
                <tr>
                    <td><%= loja.getId() %></td>
                    <td><a href="lista-produto.jsp?lojaId=<%= loja.getId() %>"><%= loja.getNome() %></a></td>
                    <td><%= loja.getTelefone() %></td>
                    <td><%= loja.getEmail() %></td>
                </tr>
                <% 
                        }
                    } else { 
                %>
                <tr>
                    <td colspan="4">Nenhuma loja encontrada.</td>
                </tr>
                <% 
                    }
                %>
            </table>

            <%
                // Passa o ID da primeira loja para o botão de cadastrar produto
                if (listaLojas != null && !listaLojas.isEmpty()) {
                    int primeiroLojaId = listaLojas.get(0).getId();
            %>
            <a class="btn-cadastrar" href="cadastro-produto.jsp?lojaId=<%= primeiroLojaId %>">Cadastrar Produto</a>
            <%
                }
            %>
        </div>
    </body>
</html>
