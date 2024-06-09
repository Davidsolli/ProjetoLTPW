/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.entidade;

import br.com.controle.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;

/**
 *
 * @author HypeH
 */
public class CadastrarUsuario extends DAO {

    public void inserirUsuario(Usuario usuario) throws Exception {
        String query = "INSERT INTO usuario(nome, senha, tel, email) "
                + "values(?, ?, ?, ?)";
        try {
            conectarBanco();
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, usuario.getNome());
            pst.setString(2, usuario.getSenha());
            pst.setInt(3, usuario.getTelefone());
            pst.setString(4, usuario.getEmail());

            pst.executeUpdate();
            desconectarBanco();
            System.out.println("Usuário cadastrado!");
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        }
    }
    
     public static Usuario buscarPorEmail(String email) {
        Usuario usuario = null;
        String sql = "SELECT * FROM usuario WHERE email = ?";

        try (Connection conn = DAO.conectarBanco();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                usuario = new Usuario();
                usuario.setId(rs.getInt("usuario_id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setTelefone(rs.getInt("tel"));
                usuario.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usuario;
    }

    public static boolean atualizarUsuario(Usuario usuario) {
        String sql = "UPDATE usuario SET nome = ?, senha = ?, tel = ?, email = ? WHERE usuario_id = ?";

        try (Connection conn = DAO.conectarBanco(); 
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getSenha());
            stmt.setInt(3, usuario.getTelefone());
            stmt.setString(4, usuario.getEmail());
            stmt.setInt(5, usuario.getId());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}
