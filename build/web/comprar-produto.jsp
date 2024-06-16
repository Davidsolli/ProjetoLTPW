<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.controle.Produto" %>
<%@page import="br.com.controle.Usuario" %>
<%@page import="br.com.entidade.DAOProduto" %>
<%@page import="br.com.entidade.DAOPedido" %>
<%@page import="br.com.controle.Pedido" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comprar Produto</title>
    </head>
    <body>
        <%
            String produtoIdParam = request.getParameter("id");
            String lojaIdParam = request.getParameter("lojaId");
            String usuarioIdParam = request.getParameter("usuarioId");
            
            System.out.println(produtoIdParam);
            System.out.println(lojaIdParam);
            System.out.println(usuarioIdParam);

            if (produtoIdParam == null || produtoIdParam.isEmpty()) {
                out.println("ID do produto não fornecido.");
                return;
            }

            if (lojaIdParam == null || lojaIdParam.isEmpty()) {
                out.println("ID da loja não fornecido.");
                return;
            }

            if (usuarioIdParam == null || usuarioIdParam.isEmpty()) {
                out.println("ID do usuário não fornecido.");
                return;
            }

            int produtoID = Integer.parseInt(produtoIdParam);
            int lojaID = Integer.parseInt(lojaIdParam);
            int usuarioID = Integer.parseInt(usuarioIdParam);

            // Instanciar o DAOProduto e DAOPedido
            DAOProduto produtoDAO = new DAOProduto();
            DAOPedido pedidoDAO = new DAOPedido();
            Produto produto = null;
            
            try {
                // Buscar o produto pelo ID
                produto = produtoDAO.buscarPorId(produtoID);
                
                if (produto == null) {
                    out.println("Produto não encontrado.");
                    return;
                }

                // Criar um novo pedido
                Pedido pedido = new Pedido();
                pedido.setProdutoId(produtoID);
                pedido.setQuantidade(1);
                pedido.setUsuarioId(usuarioID);
                pedido.setLojaId(lojaID);

                // Salvar o pedido no banco de dados
                pedidoDAO.criarPedido(pedido);

                // Exibir mensagem de sucesso
                out.println("Compra realizada com sucesso!");
                out.println("<a href='lista-produto.jsp?lojaId=" + lojaID + "'>Voltar para lista de produtos</a>");
            } catch (Exception e) {
                out.println("Erro ao processar compra: " + e.getMessage());
            }
        %>
    </body>
</html>
