/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.entidade;

import br.com.controle.Loja;
import static br.com.entidade.DAO.con;
import static br.com.entidade.DAO.conectarBanco;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author HypeH
 */
public class DAOLoja extends DAO {

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
    
    public static Loja buscarPorEmail(String email) {

        Loja loja = null;
        String query = "SELECT * FROM loja WHERE email = ?";

        try (Connection conn = DAO.conectarBanco(); PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                loja = new Loja();
                loja.setId(rs.getInt("loja_id"));
                loja.setNome(rs.getString("nome_loja"));
                loja.setSenha(rs.getString("senha"));
                loja.setTelefone(rs.getInt("tel_loja"));
                loja.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return loja;
    }
    
    public ArrayList<Loja> listarLoja() throws Exception {
        ArrayList<Loja> lojas = new ArrayList<>();
        try (Connection conn = conectarBanco(); PreparedStatement pst = conn.prepareStatement("SELECT * FROM loja");
             ResultSet rs = pst.executeQuery()) {
            while (rs.next()) {
                Loja loja = new Loja();
                loja.setId(rs.getInt("loja_id"));
                loja.setNome(rs.getString("nome_loja"));
                loja.setSenha(rs.getString("senha"));
                loja.setTelefone(rs.getInt("tel_loja"));
                loja.setEmail(rs.getString("email"));
                lojas.add(loja);
            }
        } catch (SQLException e) {
            throw new SQLException("Erro ao listar lojas: " + e.getMessage());
        }
        return lojas;
    }
}
