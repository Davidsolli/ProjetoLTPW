<%-- 
    Document   : excluir-produto
    Created on : 10 de jun. de 2024, 17:46:02
    Author     : HypeH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.controle.Produto" %>
<%@page import="br.com.entidade.DAOProduto" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir Produto</title>
    </head>
    <body>
        <%
            String produtoIdParam = request.getParameter("id");
            String lojaIdParam = request.getParameter("lojaId");

            if (produtoIdParam == null || produtoIdParam.isEmpty()) {
                out.println("ID do produto não fornecido.");
                return;
            }

            if (lojaIdParam == null || lojaIdParam.isEmpty()) {
                out.println("ID da loja não fornecido.");
                return;
            }

            int produtoID = Integer.parseInt(produtoIdParam);
            int lojaID = Integer.parseInt(lojaIdParam);

            // Instanciar o DAOProduto
            DAOProduto produtoDAO = new DAOProduto();
            try {
                // Excluir o produto
                produtoDAO.excluirProduto(produtoID);
                // Redirecionar de volta para a lista de produtos
                response.sendRedirect("lista-produto.jsp?lojaId=" + lojaID);
            } catch (Exception e) {
                out.println("Erro ao excluir produto: " + e.getMessage());
            }
        %>
    </body>
</html>
