/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.bean;

import br.com.entidade.DAO;
import java.io.IOException;
//import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author HypeH
 */
public class LoginUsuario extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String emailBuscado = "";
        String senhaBuscada = "";
        Connection con;
        String email = request.getParameter("user");
        String senha = request.getParameter("senha");
        String sql = "Select * from usuario where email = ? and senha = ?";

        try {
            con = DAO.conectarBanco();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, senha);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                emailBuscado = rs.getString("email");
                senhaBuscada = rs.getString("senha");
            }
            rs.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (emailBuscado.equals(email) || senhaBuscada.equals(senha)) {
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            request.getRequestDispatcher("lista-loja.jsp").forward(request, response);
        } else {
            System.out.println(emailBuscado + "-" + email);
            System.out.println(senhaBuscada + "-" + senha);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

}
