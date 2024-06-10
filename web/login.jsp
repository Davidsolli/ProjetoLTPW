<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <title>Sabor Online - Cardápio Personalizado</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Bebas Neue', sans-serif;
            }

            body {
                background: rgb(220, 220, 220);
            }

            header {
                position: sticky;
                top: 0;
                left: 0;
                width: 100%;
                padding: 1rem 5%;
                display: flex;
                align-items: center;
                justify-content: space-between;
                background-color: #EFCAB5;
                box-shadow: 0 .4rem .8rem #0005;
                border-radius: 0 0 10px 10px;
            }
            
            .form-field {
                display: flex;
                flex-direction: row;
            }

            .logo {
                text-decoration: none;
                background: black;
                color: #EFCAB5;
                font-size: 30px;
                padding: 15px;
                border-radius: 20px 0;
            }

            nav ul {
                display: flex;
            }

            nav ul li {
                list-style: none;
            }

            nav ul li a {
                color: black;
                text-decoration: none;
                border-radius: 10px;
                padding: 15px;
                font-weight: 500;
                font-size: 20px;
            }

            nav ul li a:hover {
                border: dashed 1px black;
                color: #8F6C58;
                box-shadow: 0 .4rem .8rem #8F6C58;
            }

            form {
                background-color: rgba(255, 255, 255, 0.2);
                border-radius: 10px;
                padding: 20px;
                max-width: 400px;
                margin: 0 auto;
                margin-top: 5rem;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                z-index: 1;
                backdrop-filter: blur(10px);
                border: 1px solid rgba(255, 255, 255, 0.3);
            }

            form h2 {
                color: #000000;
                font-size: 34px;
                text-align: center;
                margin-bottom: 20px;
            }

            form input[type="text"],
            form input[type="password"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
                font-size: 16px;
            }

            form input[type="submit"] {
                width: 100%;
                cursor: pointer;
                margin-top: 2rem;
                text-decoration: none;
                color: black;
                background: #EFCAB5;
                border-radius: 10px;
                padding: 20px;
                font-size: 25px;
                border: dashed 1px black;
                align-self: center;
            }

            form input[type="submit"]:hover {
                border: dashed 1px black;
                color: #8F6C58;
                box-shadow: 0 .4rem .8rem #8F6C58;
            }

            form label {
                font-size: 18px;
                color: black;
            }

            form p {
                margin-top: 20px;
                font-size: 16px;
                text-align: center;
            }

            .swiper {
                width: 100%;
                height: 100vh;
                position: absolute;
                top: 0;
                left: 0;
                z-index: -1;
            }

            .swiper-slide {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .swiper-slide img {
                width: 100%;
                height: 100vh;
                object-fit: cover;
            }
        </style>
    </head>

    <body>
        <!-- Swiper -->
        <div class="swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img src="https://marettimo.com.br/blog/wp-content/uploads/2023/09/bife-suculento-carne-rara-medio-com-especiarias-e-legumes-grelhados-1-1024x683.jpg" alt="Imagem 1">
                </div>
                <div class="swiper-slide">
                    <img src="https://www.remessaonline.com.br/blog/wp-content/uploads/2022/07/comidas-tipicas-do-mexico-1024x683.jpg.webp" alt="Imagem 2">
                </div>
                <div class="swiper-slide">
                    <img src="https://jblitoral.com.br/wp-content/uploads/2024/02/CALDEIRADA-DE-FRUTOS-DO-MAR-1.jpg" alt="Imagem 3">
                </div>
                <div class="swiper-slide">
                    <img src="https://conteudo.imguol.com.br/blogs/213/files/2018/05/iStock-498303420-1024x683.jpg" alt="Imagem 4">
                </div>
            </div>
        </div>

        <header>
            <a href="index.jsp" class="logo">Sabor Online</a>
            <nav>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="cadastro.jsp">Cadastro</a></li>
                </ul>
            </nav>
        </header>

        <div class="form-field">
            <form action="LoginUsuario" method="post">
                <h2>Login Cliente</h2>
                <label for="user">Email</label>
                <input type="text" id="user" name="user" placeholder="Email" required>
                <label for="senha">Senha</label>
                <input type="password" id="senha" name="senha" placeholder="Senha" required>
                <input type="submit" value="Login">
            </form>

            <form action="LoginLoja" method="post">
                <h2>Login Loja</h2>
                <label for="userLoja">Email</label>
                <input type="text" id="userLoja" name="user" placeholder="Email" required>
                <label for="senhaLoja">Senha</label>
                <input type="password" id="senhaLoja" name="senha" placeholder="Senha" required>
                <input type="submit" value="Login">
            </form>
        </div>
    <body>
        <%
            String usuario = request.getParameter("user");
            String senha = request.getParameter("senha");
            String action = request.getParameter("action");

            if (usuario != null && senha != null && !usuario.isEmpty() && !senha.isEmpty()) {
                if ("LoginUsuario".equals(action)) {
                    session.setAttribute("usuario", usuario);
                    response.sendRedirect("lista-usuario.jsp");
                } else if ("LoginLoja".equals(action)) {
                    session.setAttribute("loja", usuario); // Assume usuario é usado para loja também.
                    response.sendRedirect("lista-loja.jsp");
                }
            }
        %>
    </body>

    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script>
        var swiper = new Swiper('.swiper', {
            spaceBetween: 30,
            centeredSlides: true,
            autoplay: {
                delay: 2500,
                disableOnInteraction: false,
            },
        });
    </script>
</body>

</html>
