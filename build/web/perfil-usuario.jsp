<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.controle.Usuario" %>
<%@page import="br.com.entidade.DAOUsuario" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil do Usuário</title>
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
                overflow: hidden;
            }

            .swiper-container {
                width: 100%;
                height: 100vh;
                position: fixed;
                z-index: -1;
            }

            .swiper-slide img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .content {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background: rgba(255, 255, 255, 0.8);
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            h2 {
                text-align: center;
                margin-top: 20px;
                color: black;
                text-transform: uppercase;
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
                border-radius: 10px;
                border: 1px solid rgba(255, 255, 255, 0.3);
            }

            label {
                margin-bottom: 5px;
                color: black;
            }

            input[type="text"],
            input[type="password"],
            input[type="email"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
                font-size: 16px;
            }

            input[type="submit"] {
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

            input[type="submit"]:hover {
                border: dashed 1px black;
                color: #8F6C58;
                box-shadow: 0 .4rem .8rem #8F6C58;
            }
        </style>
    </head>
    <body>
        <%
            String emailUsuario = (String) session.getAttribute("email");

            if (emailUsuario == null) {
                response.sendRedirect("login.jsp");
                System.out.println("Usuario não encontrado!");
                return;
            } else {
                System.out.println("Logado!");
            }

            Usuario usuario = DAOUsuario.buscarPorEmail(emailUsuario);

            if (usuario == null) {
                response.sendRedirect("login.jsp");
                System.out.println("Usuario não encontrado no banco de dados!");
                return;
            }
        %>
        <!-- Swiper -->
        <div class="swiper-container">
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

        <div class="content">
            <h2>Perfil</h2>
            <div class="card-usuario">
                <form action="ListaDadosUsuario" method="POST">
                    <h3>ID do usuário: <%= usuario.getId() %></h3>
                    <input type="hidden" name="id" value="<%= usuario.getId() %>">
                    <label for="nome">Nome:</label>
                    <input type="text" id="nome" name="nome" value="<%= usuario.getNome() %>">

                    <label for="senha">Senha:</label>
                    <input type="password" id="senha" name="senha" value="<%= usuario.getSenha() %>">

                    <label for="tel">Telefone:</label>
                    <input type="text" id="tel" name="tel" value="<%= usuario.getTelefone() %>">

                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="<%= usuario.getEmail() %>">

                    <input type="submit" value="Alterar Dados">
                </form>
            </div>
        </div>

        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
        <script>
            const swiper = new Swiper('.swiper-container', {
                spaceBetween: 30,
                centeredSlides: true,
                autoplay: {
                    delay: 2500,
                    disableOnInteraction: false,
                },
                loop: true
            });
        </script>
    </body>
</html>
