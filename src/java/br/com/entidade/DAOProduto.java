/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.entidade;

import br.com.controle.Produto;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

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
    
public ArrayList<Produto> listarProdutosPorLoja(int lojaId) throws Exception {
    ArrayList<Produto> produtos = new ArrayList<>();
    String sql = "SELECT * FROM produto WHERE loja_id = ?;";
    try (Connection conn = conectarBanco(); 
         PreparedStatement pst = conn.prepareStatement(sql)) {
        pst.setInt(1, lojaId);
        try (ResultSet rs = pst.executeQuery()) {
            while (rs.next()) {
                Produto produto = new Produto();
                produto.setId(rs.getInt("produto_id"));
                produto.setNome(rs.getString("nome_produto"));
                produto.setValor(rs.getDouble("valor")); // Certifique-se de que o nome do método é getPreco()
                produto.setDescricao(rs.getString("descricao"));
                produtos.add(produto);
            }
        }
    } catch (SQLException e) {
        throw new SQLException("Erro ao listar produtos por loja: " + e.getMessage(), e);
    }
    return produtos;
}

}
