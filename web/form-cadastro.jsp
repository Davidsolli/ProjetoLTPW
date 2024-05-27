<%-- 
    Document   : form-cadastro
    Created on : 20 de mai. de 2024, 16:23:07
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
                font-family: sans-serif;
                box-sizing: border-box;
            }
            
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                width: 100vw;
                height: 100vh;
                background-color: rgb(230, 230, 230);
            }
            
            form {
                display: flex;
                flex-direction: column;
                width: 50em;
            }
            
            form input {
                padding: 10px;
                text-align: center;
                margin-bottom: 10px;
                border: solid 1px black;
                border-radius: 0px;
            }
            
            #btn-submit {
                background: #4E19AE;
                color: white;
                transition: 0.5s;
            }

            #btn-submit:hover {
                cursor: pointer;
                background: white;
                color: #4E19AE;
                border: dashed 1px #4E19AE;
                box-shadow: 0px 3px 10px 5px #DEC9E9;
            }
            
            form label {
                margin-bottom: 10px;
                font-weight: 900; 
            }
            
            form textarea {
                text-align: center;
                border: dotted black 1px;
                border-radius: 0px; 
                color: black;
                margin-bottom: 10px;
                padding: 5em;
                place-content: center;
            }
        </style>
    </head>
    <body>
        <form action="Cadastro" method="Post">
            <label>Cadastre um novo produto!</label>
            <input type="text" placeholder="Nome do produto" name="nome-produto" required>
            <input type="text" name="valor-produto" placeholder="Valor do produto" required>
            <textarea name="descricao-produto" rows="5" cols="10" placeholder="Descrição do produto" required></textarea>
            <input id="btn-submit" type="submit" name="enviar">
        </form>
    </body>
</html>
