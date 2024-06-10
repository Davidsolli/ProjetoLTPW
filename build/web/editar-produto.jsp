<%-- 
    Document   : editar-produto
    Created on : 10 de jun. de 2024, 15:22:37
    Author     : HypeH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.controle.Produto" %>
<%@page import="br.com.entidade.DAOProduto" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Editar Produto</title>
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
            padding: 20px;
            text-align: center;
        }

        h1 {
            color: #000000;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        label {
            margin: 10px 0 5px;
            color: #000000;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            padding: 10px 20px;
            background-color: #EFCAB5;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            color: black;
        }

        button:hover {
            border: dashed 1px black;
            color: #8F6C58;
            box-shadow: 0 .4rem .8rem #8F6C58;
        }

        .message {
            color: red;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>
    <div class="content">
        <% 
            String produtoIdParam = request.getParameter("id");
            if (produtoIdParam == null || produtoIdParam.isEmpty()) {
                out.println("<p class='message'>ID do produto não fornecido.</p>");
                return;
            }
            
            int produtoId = Integer.parseInt(produtoIdParam);
            DAOProduto produtoDAO = new DAOProduto();
            Produto produto = null;
            try {
                produto = produtoDAO.buscarPorId(produtoId);
            } catch (Exception e) {
                out.println("<p class='message'>Erro ao buscar produto: " + e.getMessage() + "</p>");
                return;
            }
            
            if (produto == null) {
                out.println("<p class='message'>Produto não encontrado.</p>");
                return;
            }
        %>
        <h1>Editar Produto</h1>
        <form action="EditarProduto" method="post">
            <input type="hidden" name="id" value="<%= produto.getId() %>" />
            <p>
                <label for="nome">Nome:</label>
                <input type="text" id="nome" name="nome" value="<%= produto.getNome() %>" required />
            </p>
            <p>
                <label for="descricao">Descrição:</label>
                <input type="text" id="descricao" name="descricao" value="<%= produto.getDescricao() %>" required />
            </p>
            <p>
                <label for="valor">Preço:</label>
                <input type="text" id="valor" name="valor" value="<%= produto.getValor() %>" required />
            </p>
            <p>
                <button type="submit">Salvar</button>
            </p>
        </form>
    </div>
</body>
</html>