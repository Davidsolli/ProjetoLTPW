<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.controle.Usuario" %>
<%@page import="br.com.entidade.CadastrarUsuario" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil do Usuário</title>
    </head>
    <body>
        <%
            String emailUsuario = (String) session.getAttribute("email");

            if(emailUsuario == null) {
                response.sendRedirect("login.jsp");
                System.out.println("Usuario não encontrado!");
                return;
            } else {
                System.out.println("Logado!");
            }
            
            Usuario usuario = CadastrarUsuario.buscarPorEmail(emailUsuario);

            if(usuario == null) {
                response.sendRedirect("login.jsp");
                System.out.println("Usuario não encontrado no banco de dados!");
                return;
            }
        %>
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
    </body>
</html>
