<%-- 
    Document   : index
    Created on : 6 de jun. de 2024, 23:16:24
    Author     : HypeH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cardápio</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: sans-serif;
            }

            main {
                width: 100%;
                min-height: 91vh;
                padding: 100px;
                background: rgb(220, 220, 220);
                display: flex;
                align-items: center;
                justify-content: center;
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
                position: relative; /* Necessário para o dropdown */
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

            /* Estilos para o dropdown */
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

            .container {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .container h2 {
                margin-bottom: 20px;
            }

            .container h2 span {
                color: white;
                background: #4E19AE;
                padding: 10px;
                border-radius: 10px 0px;
            }

            .container h3 {
                margin-bottom: 20px;
            }

            .container p {
                max-width: 900px;
                margin-bottom: 20px;
                font-family: "Bebas Neue", sans-serif;
                font-weight: 400;
                font-style: normal;
                font-size: 25px;
            }

            .container a {
                text-decoration: none;
                color: black;
                background: white;
                border-radius: 10px;
                padding: 20px;
                font-family: "Bebas Neue", sans-serif;
                font-weight: 300;
                font-style: normal;
                font-size: 25px;
                border: dashed 1px black;
            }

            .container a:hover {
                border: dashed 1px #4E19AE;
                background: white;
                color: #4E19AE;
                box-shadow: 0 .4rem .8rem #0005;
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
        <main>
            <div class="container">
                <h2>MONTE O <span>CARDÁPIO</span> DO SEU NEGÓCIO!</h2>
                <h3>Ultilize a nossa tecnologia em seu negócio!</h3>
                <p>Contrary to popular belief, Lorem Ipsum is not simply random
                    text. It has roots in a piece of classical Latin literature 
                    from 45 BC, making it over 2000 years old. Richard 
                    McClintock, a Latin professor at Hampden-Sydney College in
                    Virginia, looked up one of the more obscure Latin words,
                    consectetur, from a Lorem Ipsum passage, and going through
                    the cites of the word in classical literature, discovered
                    the undoubtable source.
                </p>
                <h3>Confira nossas lojas!</h3>
                <a href="login.jsp">Lojas</a>
            </div>
        </main>
    </body>
</html>
