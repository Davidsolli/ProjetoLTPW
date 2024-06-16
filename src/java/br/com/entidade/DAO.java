/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.entidade;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author HypeH
 */
public class DAO {

    static Connection con;// criação do objeto conexao
    PreparedStatement pst;//criação do objeto preparação de ambiente
    ResultSet rs;// criação do objeto que recebe resultados

    public static Connection conectarBanco() throws SQLException {// criando metodo para acessar o banco
        try {
            Class.forName("com.mysql.jdbc.Driver");//classe para utilização do arquivo com configurções do serivdor mysql
            String url = "jdbc:mysql://localhost/cardapio";// drive servidor e banco de dados a serem utilizados e indicação do banco a ser utilizado
            String user = "root";// usuario do banco de dados
            String senha = "david95118982";//senha do usuario do banco de dados
            System.out.println("Conectado ao banco de dados ");
            con = DriverManager.getConnection(url, user, senha);//metodo que usa os parametros para conectar com o banco
        } catch (ClassNotFoundException ex) {//tratamento de erro de drive
            System.out.println("Classe não encontrada, adicione o driver nas bibliotecas.");
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException e) {//tratamento de erro de SQL
            System.out.println(e);
            throw new RuntimeException(e);
        }
        return con;
    }

    public void desconectarBanco() throws Exception {//criando metodo que fecha a conexão com o banco
        if (pst != null) { //limpando os dados de conexão   
            pst.close();//fechando o ambiente de conexão
            System.out.println("Execuçao da Query fechada\n");
        }
    }
}
