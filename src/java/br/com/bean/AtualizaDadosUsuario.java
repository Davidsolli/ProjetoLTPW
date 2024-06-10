/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.bean;

import br.com.controle.Usuario;
import br.com.entidade.DAOUsuario;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author HypeH
 */
@WebServlet(name = "ListaDadosUsuario", urlPatterns = {"/ListaDadosUsuario"})
public class AtualizaDadosUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String nome = request.getParameter("nome");
        String senha = request.getParameter("senha");
        int telefone = Integer.parseInt(request.getParameter("tel"));
        String email = request.getParameter("email");

        Usuario usuario = new Usuario();
        usuario.setId(id);
        usuario.setNome(nome);
        usuario.setSenha(senha);
        usuario.setTelefone(telefone);
        usuario.setEmail(email);

        boolean atualizado = DAOUsuario.atualizarUsuario(usuario);

        if (atualizado) {
            response.sendRedirect("lista-loja.jsp");
        } else {
            response.getWriter().println("Erro ao atualizar os dados do usuário.");
        }
    }
}
