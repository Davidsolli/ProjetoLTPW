<%-- 
    Document   : index
    Created on : 6 de jun. de 2024, 23:16:24
    Author     : HypeH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            min-height: 91vh;
            padding: 100px;
            display: flex;
            align-items: flex-start;
            position: relative;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            z-index: 1;
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            padding: 20px;
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .container h2 {
            margin-bottom: 20px;
        }

        .container h2 span {
            color: black;
            background: #EFCAB5;
            padding: 10px;
            border-radius: 10px 0px;
        }

        .container h3 {
            margin-bottom: 20px;
        }

        .container p {
            max-width: 900px;
            margin-bottom: 20px;
            font-size: 25px;
        }

        .container a {
            text-decoration: none;
            color: black;
            background: #EFCAB5;
            border-radius: 10px;
            padding: 20px;
            font-size: 25px;
            border: dashed 1px black;
            align-self: center;
        }

        .container a:hover {
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
                <li><a href="login.jsp">Login</a></li>
                <li><a href="cadastro.jsp">Cadastro</a></li>
            </ul>
        </nav>
    </header>

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

    <main>
        <div class="container">
            <h2>MONTE O <span>CARDÁPIO</span> DO SEU NEGÓCIO!</h2>
            <h3>Utilize a nossa tecnologia em seu negócio!</h3>
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
            <a href="/Cardapio/login.jsp">Lojas</a>
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
