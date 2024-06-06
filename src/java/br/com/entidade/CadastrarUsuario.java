/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.entidade;

import br.com.controle.Usuario;
import java.sql.PreparedStatement;

/**
 *
 * @author HypeH
 */
public class CadastrarUsuario extends DAO {

    public void inserir(Usuario usuario) throws Exception {
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
}
