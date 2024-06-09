<%-- 
    Document   : login
    Created on : 5 de jun. de 2024, 15:10:00
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
        <form action="LoginUsuario" method="post">
            <label>Login cliente</label>
            <input type="text" name="user" placeholder="Email" required>
            <input type="password" name="senha" placeholder="Senha" required>
            <input type="submit" value="Login">
        </form>
        <form action="LoginLoja" method="post">
            <label>Login loja</label>
            <input type="text" name="user" placeholder="Email" required>
            <input type="password" name="senha" placeholder="Senha" required>
            <input type="submit" value="Login">
        </form>
        <%
            String usuario = request.getParameter("user");
            String senha = request.getParameter("senha");
            String action = request.getParameter("action");
            
            if (usuario != null && senha != null && !usuario.isEmpty() && !senha.isEmpty()) {
                if ("LoginUsuario".equals(action)) {
                    session.setAttribute("usuario", usuario);
                    response.sendRedirect("lista-usuario.jsp");
                } else if ("LoginLoja".equals(action)) {
                    session.setAttribute("loja", usuario); // Assume `usuario` é usado para loja também.
                    response.sendRedirect("lista-loja.jsp");
                }
            }
        %>
    </body>
</html>
