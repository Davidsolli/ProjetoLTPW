<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <title>sabor online - Cardápio Personalizado</title>
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
                border-radius: 0px 0px 10px 10px;
            }

            .logo {
                text-decoration: none;
                background: black;
                color: #EFCAB5;
                font-size: 30px;
                padding: 15px;
                border-radius: 20px 0px;
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

            main {
                width: 100%;
                padding: 100px;
                display: flex;
                align-items: center;
                justify-content: center;
                position: relative;
            }

            .content {
                width: 30%;
                background-color: rgba(255, 255, 255, 0.2);
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                backdrop-filter: blur(10px);
                padding: 20px;
                margin: 20px 0;
                text-align: center;
                position: relative;
                margin-left: 1rem;
            }

            h2 {
                color: #000000;
                margin-bottom: 20px;
            }

            form {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            form input[type="text"],
            form input[type="password"],
            form input[type="email"],
            form input[type="submit"] {
                width: 80%;
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            form input[type="submit"] {
                background-color: #EFCAB5;
                border: none;
                cursor: pointer;
                color: black;
                font-size: 20px;
            }

            form input[type="submit"]:hover {
                border: dashed 1px black;
                color: #8F6C58;
                box-shadow: 0 .4rem .8rem #8F6C58;
            }
        </style>
    </head>

    <body>
        <header>
            <a href="/Cardapio/index.html" class="logo">sabor online</a>
            <nav>
                <ul>
                    <li><a href="/Cardapio/index.jsp">Home</a></li>
                    <li><a href="login.jsp">Login</a></li>
                </ul>
            </nav>
        </header>

        <!-- Swiper -->
        <div class="swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img src="https://marettimo.com.br/blog/wp-content/uploads/2023/09/bife-suculento-carne-rara-medio-com-especiarias-e-legumes-grelhados-1-1024x683.jpg"
                         alt="Imagem 1">
                </div>
                <div class="swiper-slide">
                    <img src="https://www.remessaonline.com.br/blog/wp-content/uploads/2022/07/comidas-tipicas-do-mexico-1024x683.jpg.webp"
                         alt="Imagem 2">
                </div>
                <div class="swiper-slide">
                    <img src="https://jblitoral.com.br/wp-content/uploads/2024/02/CALDEIRADA-DE-FRUTOS-DO-MAR-1.jpg"
                         alt="Imagem 3">
                </div>
                <div class="swiper-slide">
                    <img src="https://conteudo.imguol.com.br/blogs/213/files/2018/05/iStock-498303420-1024x683.jpg"
                         alt="Imagem 4">
                </div>
            </div>
        </div>

        <main>
            <div class="content">
                <h2>Cadastro de Cliente</h2>
                <form action="CadastroUsuario" method="POST">
                    <input type="text" placeholder="Nome" name="nome" required>
                    <input type="password" placeholder="Senha" name="senha" required>
                    <input type="text" placeholder="Telefone" name="tel" required>
                    <input type="email" placeholder="Email" name="email" required>
                    <input type="submit" name="enviar" value="Cadastrar">
                </form>
            </div>
            <div class="content">
                <h2>Cadastro de Loja</h2>
                <form action="CadastroLoja" method="POST">
                    <input type="text" placeholder="Nome do Comércio" name="nomeComercio" required>
                    <input type="password" placeholder="Senha" name="senha" required>
                    <input type="text" placeholder="Telefone" name="tel" required>
                    <input type="email" placeholder="Email" name="email" required>
                    <input type="submit" name="enviar" value="Cadastrar">
                </form>
            </div>
        </main>

        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
        <script>
            const swiper = new Swiper('.swiper', {
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