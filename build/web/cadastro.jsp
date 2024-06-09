<%-- 
    Document   : cadastro
    Created on : 5 de jun. de 2024, 15:10:21
    Author     : HypeH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                font-family: sans-serif;
            }
            header {
                position: sticky;
                top: 0;
                left: 0;
                width: 100%;
                padding: 10px 100px;
                display: flex;
                align-items: center;
                justify-content: space-between;
                background-color: #4E19AE;
                box-shadow: 0 .4rem .8rem #0005;
                border-radius: 0px 0px 10px 10px;
            }
            .logo {
                font-family: "Bebas Neue", sans-serif;
                font-weight: 400;
                font-style: normal;
                text-decoration: none;
                background: white;
                color: #4E19AE;
                font-size: 30px;
                padding: 15px;
                border-radius: 20px 0px;
            }
            nav ul {
                display: flex;
            }
            nav ul li {
                list-style: none;
                position: relative;
            }
            nav ul li a {
                color: white;
                text-decoration: none;
                padding: 15px;
                font-weight: 500;
                font-size: 20px;
            }
            nav ul li a:hover {
                color: #4E19AE;
                background: white;
                border-radius: 10px;
            }
        </style>
    </head>
    <body>
        <header>
            <a href="index.jsp" class="logo">Cardápio</a>
            <nav>
                <ul>
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="cadastro.jsp">Cadastro</a></li>
                </ul>
            </nav>
        </header>
        <form action="CadastroUsuario" method="POST">
            <label><h2>Cadastro de cliente</h2></label>
            <input type="text" placeholder="nome" name="nome" required>
            <input type="password" placeholder="senha" name="senha" required>
            <input type="text" placeholder="telefone" name="tel" required>
            <input type="email" placeholder="email" name="email" required>
            <input type="submit" name="enviar">
        </form>
        <form action="CadastroLoja" method="POST">
            <label><h2>Cadastro de loja</h2></label>
            <input type="text" placeholder="nome do comercio" name="nomeComercio" required>
            <input type="password" placeholder="senha" name="senha" required>
            <input type="text" placeholder="telefone" name="tel" required>
            <input type="email" placeholder="email" name="email" required>
            <input type="submit" name="enviar">
        </form>
    </body>
</html>
