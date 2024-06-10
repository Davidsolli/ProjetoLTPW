<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.controle.Loja" %>
<%@page import="br.com.entidade.DAOLoja" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Lojas</title>
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
        Seja bem-vindo : <%= usuario %> | <a href="logout.jsp">Sair</a>

        <h1><a href="lista-produto.jsp">Produtos</a></h1>

        <h2>Lista de Lojas</h2>
        <%
            DAOLoja lojaDAO = new DAOLoja();
            ArrayList<Loja> listaLojas = null;
            try {
                listaLojas = lojaDAO.listarLoja();
            } catch (Exception e) {
                out.println("Erro ao listar lojas: " + e.getMessage());
            }
        %>
        <table border="1">
            <tr>
                <th>Nome</th>
                <th>Telefone</th>
                <th>Email</th>
            </tr>
            <% 
                if (listaLojas != null && !listaLojas.isEmpty()) {
                    for (Loja loja : listaLojas) {
            %>
            <tr>
                <td><%= loja.getNome() %></td>
                <td><%= loja.getTelefone() %></td>
                <td><%= loja.getEmail() %></td>
            </tr>
            <% 
                    }
                } else {
            %>
            <tr>
                <td colspan="3">Nenhuma loja encontrada.</td>
            </tr>
            <% 
                }
            %>
        </table>
    </body>
</html>
