<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style-lista-produto.css"/>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: sans-serif;
            }

            body {
                background-color: rgb(220, 220, 220);
            }

            .container {
                height: 100vh;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }

            table {
                box-shadow: 0 .4rem .8rem #0005;
            }

            td {
                width: auto;
                height: auto;
                margin-right: .5rem;
                vertical-align: middle;
            }

            tr {
                background-color: white;
            }

            table, th, td {
                padding: 1rem;
                border-collapse: collapse;
            }

            thead th {
                position: sticky;
                top: 0;
                left: 0;
                background-color: #4E19AE;
                color: white;
            }

            tbody tr:nth-child(even) {
                background-color: rgb(204, 204, 204);
            }

            tbody tr:hover {
                background-color: white;
            }

            tfoot tr {
                background-color: white;
                border: solid 2px #4E19AE;
            }

            tfoot tr:hover {
                border: dashed 2px #4E19AE;
                cursor: pointer;
                background-color: #B4BDE2;
            }

            tfoot a {
                text-decoration: none;
                color: #4E19AE;
            }
        </style>
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
        <div class="container">
            <table>
                <thead>
                    <tr>
                        <th> Id </th>
                        <th> Nome </th>
                        <th> Descrição </th>
                        <th> Preço </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td> 1 </td>
                        <td> ${nomeProduto} </td>
                        <td> ${descricaoProduto} </td>
                        <td> <strong>${valorProduto}</strong> </td>
                    </tr>
                </tbody>
                <tfoot>        
                    <tr>
                        <td colspan="4"><a href="/Cardapio/form-cadastro.jsp"><center>Novo produto+</center></a></td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </body>
</html>
