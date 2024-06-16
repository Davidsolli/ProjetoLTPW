<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="br.com.controle.Loja" %>
<%@page import="br.com.controle.Usuario" %>
<%@page import="br.com.controle.Produto" %>
<%@page import="br.com.entidade.DAOLoja" %>
<%@page import="br.com.entidade.DAOProduto" %>
<%@page import="br.com.entidade.DAOUsuario" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Produtos</title>
                <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Bebas Neue', sans-serif;
            }

            body {
                background: white;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }

            .content {
                width: 60%;
                background-color: rgba(255, 255, 255, 0.2);
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                z-index: 1;
                backdrop-filter: blur(10px);
                padding: 10px;
                margin: 10px 0;
                text-align: center;
            }

            h1, h2 {
                color: #000000;
                text-align: center;
                margin-bottom: 20px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
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
                color: #000000;
                text-decoration: none;
            }

            .welcome, .logout {
                text-align: center;
                margin-bottom: 20px;
            }

            .logout {
                margin-top: 10px;
            }

            label {
                width: 100%;
                background-color: rgba(255, 255, 255, 0.2);
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                z-index: 1;
                backdrop-filter: blur(10px);
                border-radius: 5px;
                padding: 5px 5px;
                margin: 5px;
            }

            .actions a {
                margin-right: 10px;
            }

            tfoot {
                text-align: center;
            }

            tfoot a {
                display: inline-block;
                padding: 10px 20px;
                background-color: #EFCAB5;
                border-radius: 10px;
                text-decoration: none;
                color: black;
                margin-top: 20px;
            }

            tfoot a:hover {
                border: dashed 1px black;
                color: #8F6C58;
                box-shadow: 0 .4rem .8rem #8F6C58;
            }
        </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <% 
            String usuarioEmail = (String) session.getAttribute("email");
            if (usuarioEmail == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            
            DAOUsuario usuarioDAO = new DAOUsuario();
            Usuario usuario = new Usuario();
            usuario = usuarioDAO.buscarPorEmail(usuarioEmail);
            Integer usuarioID = usuario.getId();
            if (usuarioID == null || usuarioID == -1) {
                out.println("ID do usuário não disponível.");
                return;
            }
        %>
        <div class="content">
            <% 
                String lojaIdParam = request.getParameter("lojaId");
                if (lojaIdParam == null || lojaIdParam.isEmpty()) {
                    out.println("ID da loja não fornecido.");
                    return;
                }
                int lojaID = Integer.parseInt(lojaIdParam);

                DAOProduto produtoDAO = new DAOProduto();
                ArrayList<Produto> listaProdutos = null;
                try {
                    listaProdutos = produtoDAO.listarProdutosPorLoja(lojaID);
                } catch (Exception e) {
                    out.println("Erro ao listar produtos: " + e.getMessage());
                }

                DAOLoja lojaDAO = new DAOLoja();
                Loja lojaSessao = null;
                try {
                    lojaSessao = lojaDAO.buscarPorEmail(usuarioEmail);
                } catch (Exception e) {
                    out.println("Erro ao buscar loja: " + e.getMessage());
                }
                int lojaSessaoID = (lojaSessao != null) ? lojaSessao.getId() : -1;
            %>

            <h1>Lista de Produtos da Loja <%= lojaIdParam %></h1>

            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Descrição</th>
                        <th>Preço</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        if (listaProdutos != null && !listaProdutos.isEmpty()) {
                            for (Produto produto : listaProdutos) {
                    %>
                    <tr>
                        <td><%= produto.getId() %></td>
                        <td><%= produto.getNome() %></td>
                        <td><%= produto.getDescricao() %></td>
                        <td><%= produto.getValor() %></td>
                        <td class="actions">
                            <a href="comprar-produto.jsp?id=<%= produto.getId() %>&lojaId=<%= lojaID %>&usuarioId=<%= usuarioID %>">Comprar</a>
                            <% if (lojaSessaoID == lojaID) { %>
                            <a href="editar-produto.jsp?id=<%= produto.getId() %>">Editar</a>
                            <a href="excluir-produto.jsp?id=<%= produto.getId() %>&lojaId=<%= lojaID %>">Excluir</a>
                        </td>
                        <% } %>
                    </tr>
                    <% 
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="5">Nenhum produto encontrado.</td>
                    </tr>
                    <% 
                        }
                    %>
                </tbody>
                <% if (lojaSessaoID == lojaID) { %>
                <tfoot>
                    <tr>
                        <td colspan="5">
                            <a href="cadastro-produto.jsp?lojaId=<%= lojaID %>">Adicionar Novo Produto</a>
                        </td>
                    </tr>
                </tfoot>
                <% } %>
            </table>
        </div>
    </body>
</html>
