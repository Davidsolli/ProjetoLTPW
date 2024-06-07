<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
        <style>
            /* Inclua aqui os estilos CSS do header */
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
            .dropdown-content {
                display: none;
                position: absolute;
                background-color: white;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
                border-radius: 0 0 10px 10px;
            }
            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }
            .dropdown-content a:hover {
                background-color: #ddd;
            }
            .dropdown:hover .dropdown-content {
                display: block;
            }
            .dropdown:hover .dropbtn {
                color: #4E19AE;
                background: white;
                border-radius: 10px 10px 0 0;
            }
        </style>
    </head>
    <body>
        <header>
            <a href="index.jsp" class="logo">Cardápio</a>
            <nav>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="cadastro.jsp">Cadastro</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropbtn">Perfil</a>
                        <div class="dropdown-content">
                            <a href="perfil.jsp">Ver Perfil</a>
                            <a href="configuracoes.jsp">Configurações</a>
                            <a href="logout.jsp">Logout</a>
                        </div>
                    </li>
                </ul>
            </nav>
        </header>
    </body>
</html>
