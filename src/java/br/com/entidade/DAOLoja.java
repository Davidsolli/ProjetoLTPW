/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.entidade;

import br.com.controle.Loja;
import static br.com.entidade.DAO.con;
import static br.com.entidade.DAO.conectarBanco;
import java.sql.PreparedStatement;

/**
 *
 * @author HypeH
 */
public class DAOLoja extends DAO{
    
        public void inserirLoja(Loja loja) throws Exception {
        String query = "INSERT INTO loja(nome_loja, senha, tel_loja, email) "
                + "values(?, ?, ?, ?)";
        try {
            conectarBanco();
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, loja.getNome());
            pst.setString(2, loja.getSenha());
            pst.setInt(3, loja.getTelefone());
            pst.setString(4, loja.getEmail());

            pst.executeUpdate();
            desconectarBanco();
            System.out.println("Loja cadastrada!");
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        }
    }
}
