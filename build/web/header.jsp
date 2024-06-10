<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Sabor Online</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
        <style>
            /* Inclua aqui os estilos CSS do header */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Bebas Neue', sans-serif;
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
                margin-bottom: 5px;
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

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #EFCAB5;
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
                background-color: #EFCAB5;
            }
            .dropdown:hover .dropdown-content {
                display: block;
            }
            .dropdown:hover .dropbtn {
                color: #8F6C58;
                background: #EFCAB5;
                border-radius: 10px 10px 0 0;
            }
        </style>
    </head>
    <body>
        <header>
            <a href="index.jsp" class="logo">Sabor Online</a>
            <nav>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropbtn">Perfil</a>
                        <div class="dropdown-content">
                            <a href="perfil-usuario.jsp">Ver Perfil</a>
                            <a href="logout.jsp">Logout</a>
                        </div>
                    </li>
                </ul>
            </nav>
        </header>

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
        
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
        <script>
            const swiper = new Swiper('.swiper', {
                spaceBetween: 30,
                centeredSlides: true,
                autoplay: {
                    delay: 5000,
                    disableOnInteraction: false
                },
                pagination: {
                    el: '.swiper-pagination',
                    clickable: true,
                },
            });
        </script>
    </body>
</html>
