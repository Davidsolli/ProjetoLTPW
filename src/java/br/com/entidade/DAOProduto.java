/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.entidade;

import br.com.controle.Produto;
import java.sql.PreparedStatement;

/**
 *
 * @author HypeH
 */
public class DAOProduto extends DAO {
    public void inserirLoja(Produto produto) throws Exception {
        
        String query = "INSERT INTO produto(nome_produto, valor, descricao, loja_id) "
                + "values(?, ?, ?, ?)";
        
        System.out.println(produto.getLoja().getId());
        try {
            conectarBanco();
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, produto.getNome());
            pst.setDouble(2, produto.getValor());
            pst.setString(3, produto.getDescricao());
            pst.setInt(4, produto.getLoja().getId());

            pst.executeUpdate();
            desconectarBanco();
            System.out.println("Produto cadastrado!");
        } catch (Exception e) {
            System.out.println("Erro " + e.getMessage());
        }
    }
}
