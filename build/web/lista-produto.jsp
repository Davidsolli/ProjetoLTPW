<%-- 
    Document   : lista-produto
    Created on : 10 de jun. de 2024, 00:28:44
    Author     : HypeH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="br.com.controle.Loja" %>
<%@page import="br.com.controle.Produto" %>
<%@page import="br.com.entidade.DAOLoja" %>
<%@page import="br.com.entidade.DAOProduto" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lista de Produtos</title>
</head>
<body>
    <%@ include file="header.jsp" %>
    <%
        String lojaId = request.getParameter("lojaId");
        if (lojaId == null || lojaId.isEmpty()) {
            out.println("ID da loja não fornecido.");
            return;
        }
        // Aqui você pode usar o ID da loja para buscar os produtos
        DAOProduto produtoDAO = new DAOProduto();
        ArrayList<Produto> listaProdutos = null;
        try {
            int id = Integer.parseInt(lojaId);
            listaProdutos = produtoDAO.listarProdutosPorLoja(id);
        } catch (Exception e) {
            out.println("Erro ao listar produtos: " + e.getMessage());
        }
    %>
    <h1>Lista de Produtos da Loja <%= lojaId %></h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Descrição</th>
            <th>Preço</th>
        </tr>
        <% 
            if (listaProdutos != null && !listaProdutos.isEmpty()) {
                for (Produto produto : listaProdutos) {
        %>
        <tr>
            <td><%= produto.getId() %></td>
            <td><%= produto.getNome() %></td>
            <td><%= produto.getDescricao() %></td>
            <td><%= produto.getValor() %></td>
        </tr>
        <% 
                }
            } else {
        %>
        <tr>
            <td colspan="4">Nenhum produto encontrado.</td>
        </tr>
        <% 
            }
        %>
    </table>
</body>
</html>
